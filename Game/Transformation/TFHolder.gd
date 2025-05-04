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
	
	#call_deferred("startTransformation", "SpeciesTFMinor")
	#startTransformation("SpeciesTFMinor", {species=Species.Feline})
	#startTransformation("Demonification")
	#startTransformation("Feminization")
	#startTransformation("Masculinization")
	#startTransformation("SpeciesTF", {species=Species.Feline})
	#startTransformation("TestTF")

func getChar():
	if(charRef == null):
		return null
	return charRef.get_ref()

func canStartTransformation(_tfID:String) -> bool:
	var newTF = GlobalRegistry.getTransformationRef(_tfID)
	if(newTF == null || !newTF.isPossibleFor(getChar())):
		return false
	# TFs only support dynamic characters and the player, sorry
	if(!getChar().isDynamicCharacter() && !getChar().isPlayer()):
		return false
	
	if(getChar().isPlayer()):
		var encounterSettings = GM.main.getEncounterSettings()
		if(encounterSettings.getTFWeight(_tfID) <= 0.0): # If you disabled a TF, you probably don't want it
			return false
	
	# Skip tags checking if tf is allowed to stack and we already have one
	if(newTF.canTFStack()):
		for tf in transformations:
			if(tf.id == _tfID):
				return true
	
	var currentTags:Dictionary = getCurrentTFTags()
	var newTfTags:Dictionary = newTF.getTFCheckTags()
	for tag in newTfTags:
		if(currentTags.has(tag)):
			return false
	
	return true

func startTransformation(_tfID:String, _args:Dictionary={}):
	if(!canStartTransformation(_tfID)):
		return null
	
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

func hasTF(tfID:String) -> bool:
	for tf in transformations:
		if(tf.id == tfID):
			return true
	return false

func hasTFFinalStage(tfID:String) -> bool:
	for tf in transformations:
		if(tf.id == tfID):
			if(!tf.canTransformFurther()):
				return true
	return false

func getActiveTransformationsCount() -> int:
	return transformations.size()

func getTransformationsInFinalStage() -> Array:
	var result:Array = []
	
	for tf in transformations:
		if(!tf.canTransformFurther()):
			result.append(tf)
	
	return result

func getTransformationsCanBeTested() -> Array:
	var result:Array = []
	
	for tf in transformations:
		if(tf.canBeTested()):
			result.append(tf)
	
	return result

func hasTransformationsInFinalStage() -> bool:
	for tf in transformations:
		if(!tf.canTransformFurther()):
			return true
	
	return false

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
			success = false,
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
		success = true,
		text = finalText,
		anim = (reactResult["anim"] if reactResult.has("anim") else []),
		say = (reactResult["say"] if reactResult.has("say") else ""),
	}

func processTime(_seconds:int):
	var theChar = getChar()
	if(theChar != null):
		GM.pc.getCustomAttribute(BuffAttribute.TransformationSpeed)
		var mult:float = 1.0 + max(theChar.getCustomAttribute(BuffAttribute.TransformationSpeed), -1.0)
		_seconds = int(round(float(_seconds)*mult))
	
	var tfsSize:int = transformations.size()
	for _i in range(tfsSize):
		var tf = transformations[tfsSize - _i - 1]
		if(tf.shouldCancelItselfFinal()):
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
			originalParts[bodypartSlot] = {bodypartID=null}
			return originalParts[bodypartSlot]
		
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
	
	# Char data has to be last because it applies skin data to bodyparts
	theChar.applyTFData(charModifiedData)
	
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

func forceProgressAll():
	for tf in transformations:
		tf.timer = 0
	
	while(true):
		var result:Dictionary = doFirstPendingTransformation({})
		if(!result.has("success") || !result["success"]):
			break

func accelerateAllFull(howMuch:float = 1.0):
	for tf in transformations:
		tf.timer *= (1.0 - howMuch)

func getTotalStageSum() -> int:
	var result:int = 0
	
	for tf in transformations:
		result += tf.getStage()
	
	return result

func getCurrentTFTags() -> Dictionary:
	var result:Dictionary = {}
	
	for tf in transformations:
		var tags = tf.getTFCheckTags()
		for tag in tags:
			result[tag] = true
	
	return result

func getSexGoalWeightModifier(_sexGoalID:String) -> float:
	var result:float = 1.0
	for tf in transformations:
		result += tf.getSexGoalWeightModifier(_sexGoalID)
	
	return max(result, 0.0)

func shouldAlwaysUpdateNPC() -> bool:
	for tf in transformations:
		if(tf.canTransformFurther()):
			return true
	
	return false

func saveData() -> Dictionary:
	var effectsData:Array = []
	for effect in effects:
		effectsData.append({
			id = effect.id,
			data = effect.saveData(),
		})
	
	var tfData:Array = []
	for tf in transformations:
		tfData.append({
			id = tf.id,
			data = tf.saveData(),
		})
	
	var result:Dictionary = {
		ogParts = originalParts,
		ogChar = originalCharData,
		affParts = affectedParts,
		effects = effectsData,
		tfs = tfData,
	}
	
	return result

func loadData(_data:Dictionary):
	originalParts = SAVE.loadVar(_data, "ogParts", {})
	originalCharData = SAVE.loadVar(_data, "ogChar", {})
	affectedParts = SAVE.loadVar(_data, "affParts", {})
	
	effects.clear()
	var effectsData:Array = SAVE.loadVar(_data, "effects", [])
	for effectLine in effectsData:
		var newEffectID:String = SAVE.loadVar(effectLine, "id", "")
		if(newEffectID == ""):
			continue
		var newEffect:TFEffect = GlobalRegistry.createTransformationEffect(newEffectID)
		if(newEffect == null):
			continue
		newEffect.setHolder(self)
		effects.append(newEffect)
		newEffect.loadData(SAVE.loadVar(effectLine, "data", {}))
	
	transformations.clear()
	var tfData:Array = SAVE.loadVar(_data, "tfs", [])
	for tfLine in tfData:
		var newTFID:String = SAVE.loadVar(tfLine, "id", "")
		if(newTFID == ""):
			continue
		var newTF:TFBase = GlobalRegistry.createTransformation(newTFID)
		if(newTF == null):
			continue
		newTF.setHolder(self)
		transformations.append(newTF)
		newTF.loadData(SAVE.loadVar(tfLine, "data", {}))
