extends Reference
class_name TFHolder

var charRef:WeakRef

var originalParts:Dictionary = {}
var effects:Array = []
var affectedParts:Dictionary = {}

var originalCharData:Dictionary = {}

var transformations:Array = []

const TFTYPE_CHAR = 0
const TFTYPE_PART = 1

func setCharacter(theChar):
	charRef = weakref(theChar)
	
	startTransformation("TestTF")
	#startTransformation("SpeciesTF", {species=Species.Feline})
	#startTransformation("TestTF")

func getChar():
	if(charRef == null):
		return null
	return charRef.get_ref()

func startTransformation(_tfID:String, _args:Dictionary={}):
	var newTF = GlobalRegistry.createTransformation(_tfID)
	if(newTF == null):
		return null
	transformations.append(newTF)
	newTF.uniqueID = GlobalRegistry.generateTFID()
	newTF.setHolder(self)
	newTF.startFinal(_args)
	return newTF

func hasActiveTransformations() -> bool:
	return !transformations.empty()

func getActiveTransformationsCount() -> int:
	return transformations.size()

func undoTransformation(tf):
	if(!transformations.has(tf)):
		return
	var _tfID:int = tf.uniqueID
	transformations.erase(tf)
	
	var effectsSize:int = effects.size()
	for _i in range(effectsSize):
		var effect = effects[effectsSize - _i - 1]
		if(effect.tfID == _tfID):
			effects.remove(effectsSize - _i - 1)
			
	applyAllTransformationEffects()
	if(transformations.empty()):
		originalParts.clear()
		originalCharData.clear()

func undoAllTransformations():
	effects.clear()
	transformations.clear()
	
	applyAllTransformationEffects()
	
	originalParts.clear()
	originalCharData.clear()

func makeAllTransformationsPermanent():
	applyAllTransformationEffects()
	effects.clear()
	transformations.clear()
	originalParts.clear()
	originalCharData.clear()

func hasPendingTransformations() -> bool:
	for tf in transformations:
		if(tf.isReadyToProgressFinal()):
			return true
	
	return false

func doFirstPendingTransformation(_context:Dictionary, _isShort:bool = false) -> Dictionary:
	#var texts:Array = []
	
	var foundTF = null
	var foundResult:Dictionary
	
	for tf in transformations:
		if(tf.isReadyToProgressFinal()):
			var _result:Dictionary = tf.doProgressFinal(_context)
			foundTF = tf
			foundResult = _result
			break
	
	if(foundTF == null):
		return {
			text = "COULDN'T TRANSFORM ANYTHING!",
		}
	
	var newEffects:Array = foundResult["effects"] if foundResult.has("effects") else []
	var savedEffectObjs:Dictionary = {}
	
	for effectEntry in newEffects:
		var effectType:int = effectEntry["type"]
		
		if(effectType == TFTYPE_CHAR || effectType == TFTYPE_PART):
			addEffect(effectEntry["effect"])
		#savedEffectObjs[effectEntry["id"]] = effectEntry["effect"]
		savedEffectObjs[effectEntry["effect"]] = effectEntry["id"]
	
	var applyResults:Dictionary = {}
	
	
	#getChar().updateAppearance()
	applyAllTransformationEffects(savedEffectObjs, applyResults)
	
	var tfResult:TFResult = TFResult.new()
	tfResult.setData(foundResult, applyResults)
	
	var reactResult:Dictionary
	if(!_isShort):
		reactResult = foundTF.reactProgressFinal(_context, tfResult)
	else:
		reactResult = foundTF.reactProgressShortFinal(_context, tfResult)
	
	optimizeEffects()
	
	var gameParser:GameParser = GameParser.new()
	var finalText:String = gameParser.executeString(reactResult["text"], {npc=getChar().getID()})
	
	return {
		text = finalText,
		anim = (reactResult["anim"] if reactResult.has("anim") else []),
	}

func processTime(_seconds:int):
	var tfsSize:int = transformations.size()
	for _i in range(tfsSize):
		var tf = transformations[tfsSize - _i - 1]
		if(tf.shouldCancelItself()):
			undoTransformation(tf)
	for tf in transformations:
		tf.processTime(_seconds)

func grabBodypartOriginalData(bodypartSlot):
	if(!originalParts.has(bodypartSlot)):
		var theChar = getChar()
		if(theChar == null):
			return {}
		
		var bodypart = theChar.getBodypart(bodypartSlot)
		if(bodypart == null):
			return {bodypartID=null}
		
		originalParts[bodypartSlot] = bodypart.saveOriginalTFData()
	
	return originalParts[bodypartSlot]


func addEffect(effect):
	effect.setHolder(self)

	effect.needsToBeChecked = true
	effects.append(effect)

func grabCharOriginalData():
	if(originalCharData.empty()):
		var theChar = getChar()
		if(theChar == null):
			return {}
		originalCharData = theChar.saveOriginalTFData()
	return originalCharData

func applyAllTransformationEffects(savedEffectObjs:Dictionary={}, applyResults:Dictionary={}):
	applyEffects(savedEffectObjs, applyResults)

func applyEffects(savedEffectObjs:Dictionary={}, applyResults:Dictionary={}):
	var theChar = getChar()
	var charOrigData = grabCharOriginalData()
	var charModifiedData = charOrigData.duplicate(true)
	var bodypartModifiedData:Dictionary = {}
	var newEffectedParts:Dictionary = {}
	
	for effect in effects:
		var effectResult
		if(effect.isPartEffect()):
			var bodypartSlot:String = effect.getBodypartSlot()
			
			newEffectedParts[bodypartSlot] = true
			
			if(!bodypartModifiedData.has(bodypartSlot)):
				var origData = grabBodypartOriginalData(bodypartSlot)
				bodypartModifiedData[bodypartSlot] = origData.duplicate(true)
			
			effectResult = effect.applyEffect(bodypartModifiedData[bodypartSlot])
		else:
			effectResult = effect.applyEffect(charModifiedData)
			
		if(savedEffectObjs.has(effect)):
			if(effectResult is Dictionary):
				effectResult["effect"] = effect
			applyResults[savedEffectObjs[effect]] = effectResult
	
	theChar.applyTFData(charModifiedData)
	for bodypartSlot in bodypartModifiedData:
		theChar.applyTFBodypart(bodypartSlot, bodypartModifiedData[bodypartSlot])
	
	 # Removes any effects from bodyparts that weren't touched by effects
	for bodypartSlot in affectedParts:
		if(newEffectedParts.has(bodypartSlot)):
			continue
		var origData = grabBodypartOriginalData(bodypartSlot)
		theChar.applyTFBodypart(bodypartSlot, origData)
		originalParts.erase(bodypartSlot)
	affectedParts = newEffectedParts
	
	
	theChar.updateAppearance()

func tryCombineEffect(effect, theEffects:Array):
	for _i in range(theEffects.size()):
		if(theEffects[_i].needsToBeChecked || theEffects[_i] == effect):
			continue
		if(effect.canReplace(theEffects[_i])):
			var oldEffect = theEffects[_i]
			theEffects.remove(_i)
			effect.onReplace(oldEffect)
			return

func optimizeEffects():
	var toCheck:Array = []
	for effect in effects:
		if(effect.needsToBeChecked):
			toCheck.append(effect)
	
	for effect in toCheck:
		tryCombineEffect(effect, effects)
		effect.needsToBeChecked = false
	
	#print(charEffects)
	#print(charEffects.duplicate())

func onSexEvent(_event : SexEvent):
	for tf in transformations:
		tf.onSexEvent(_event)

func getBuffs() -> Array:
	var result:Array = []
	for tf in transformations:
		result.append_array(tf.getBuffs())
	return result
