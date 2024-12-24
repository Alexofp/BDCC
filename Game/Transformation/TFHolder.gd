extends Reference
class_name TFHolder

var charRef:WeakRef

var originalParts:Dictionary = {}
var partEffects:Dictionary = {}
var affectedParts:Dictionary = {}

var originalCharData:Dictionary = {}
var charEffects:Array = []

var transformations:Array = []

var reactQueue:Array = [] # no save
var tfTexts:Array = [] # no save
var transformInProgress:bool = false # no save

func setCharacter(theChar):
	charRef = weakref(theChar)
	
	startTransformation("TestTF")
	startTransformation("TestTF")

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
	newTF.start(_args)
	return newTF

func hasActiveTransformations() -> bool:
	return !transformations.empty()

func undoAllTransformations():
	partEffects.clear()
	charEffects.clear()
	transformations.clear()
	
	applyAllTransformationEffects()
	
	originalParts.clear()
	originalCharData.clear()

func makeAllTransformationsPermanent():
	applyAllTransformationEffects()
	partEffects.clear()
	transformations.clear()
	originalParts.clear()
	originalCharData.clear()
	charEffects.clear()

func hasPendingTransformations() -> bool:
	for tf in transformations:
		if(tf.isReadyToProgress()):
			return true
	
	return false

func doAllPendingTransformations(_context:Dictionary) -> Dictionary:
	var texts:Array = []
	
	for tf in transformations:
		if(tf.isReadyToProgress()):
			var result:Dictionary = tf.doProgress(_context)
			if(result.has("text")):
				texts.append(result["text"])
	
	#getChar().updateAppearance()
	applyAllTransformationEffects()
	
	return {
		text = "Meow meow.\n\n"+Util.join(texts, "\n"),
	}

func doFirstPendingTransformation(_context:Dictionary) -> Dictionary:
	reactQueue.clear()
	tfTexts.clear()
	#var texts:Array = []
	
	for tf in transformations:
		if(tf.isReadyToProgress()):
			var _result:Dictionary = tf.doProgress(_context)
			#if(result.has("text")):
			#	texts.append(result["text"])
			break
	
	#getChar().updateAppearance()
	transformInProgress = true
	applyAllTransformationEffects()
	transformInProgress = false
	
	var finalTexts:Array = []
	for queueElement in reactQueue:
		var theType:String = queueElement["type"]
		if(theType == "text"):
			finalTexts.append(queueElement["text"])
		elif(theType == "parteffect"):
			var theText:String = queueElement["effect"].grabText()
			if(theText != ""):
				finalTexts.append(theText)
		elif(theType == "chareffect"):
			var theText:String = queueElement["effect"].grabText()
			if(theText != ""):
				finalTexts.append(theText)
	
	optimizeEffects()
	
	return {
		text = "Meow meow.\n\n"+Util.join(finalTexts, "\n\n"),
	}

func processTime(_seconds:int):
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

func addTextToReactQueue(theText:String):
	reactQueue.append({type="text", text=theText})

func addPartEffectToReactQueue(bodypartSlot, effect):
	addPartEffect(bodypartSlot, effect)
	reactQueue.append({type="parteffect", slot=bodypartSlot, effect=effect})

func addPartEffect(bodypartSlot, effect):
	effect.setHolder(self)
	if(!partEffects.has(bodypartSlot)):
		partEffects[bodypartSlot] = []
	
#	var theEffects:Array = partEffects[bodypartSlot]
#	for _i in range(theEffects.size()):
#		if(effect.canReplace(theEffects[_i])):
#			var oldEffect = theEffects[_i]
#			#theEffects[_i] = effect
#			theEffects.remove(_i)
#			theEffects.append(effect)
#			effect.onReplace(oldEffect)
#			return
	effect.needsToBeChecked = true
	partEffects[bodypartSlot].append(effect)

func addCharEffectToReactQueue(effect):
	addCharEffect(effect)
	reactQueue.append({type="chareffect", effect=effect})

func addCharEffect(effect):
	effect.setHolder(self)
#	for _i in range(charEffects.size()):
#		if(effect.canReplace(charEffects[_i])):
#			var oldEffect = charEffects[_i]
#			#charEffects[_i] = effect
#			charEffects.remove(_i)
#			charEffects.append(effect)
#			effect.onReplace(oldEffect)
#			return
	effect.needsToBeChecked = true
	charEffects.append(effect)

func grabCharOriginalData():
	if(originalCharData.empty()):
		var theChar = getChar()
		if(theChar == null):
			return {}
		originalCharData = theChar.saveOriginalTFData()
	return originalCharData

func applyAllTransformationEffects():
	applyCharEffects()
	applyPartEffects()

func applyCharEffects():
	var theChar = getChar()
	var origData = grabCharOriginalData()
	var modifiedData = origData.duplicate(true)
	
	for effect in charEffects:
		effect.prepareToApply()
		effect.applyEffect(modifiedData)
	for effect in charEffects:
		effect.afterAllEffects(modifiedData)
			
	
	theChar.applyTFData(modifiedData)

func applyPartEffects():
	var theChar = getChar()
	
	var newAffectedParts:Dictionary = {}
	for bodypartSlot in partEffects:
		newAffectedParts[bodypartSlot] = true
		var thisPartEffects:Array = partEffects[bodypartSlot]
		var origData = grabBodypartOriginalData(bodypartSlot)
		var modifiedData = origData.duplicate(true)
	
		for effect in thisPartEffects:
			effect.prepareToApply()
			effect.applyEffect(modifiedData)
		for effect in thisPartEffects:
			effect.afterAllEffects(modifiedData)
	
		theChar.applyTFBodypart(bodypartSlot, modifiedData)
	
	for bodypartSlot in affectedParts:
		if(newAffectedParts.has(bodypartSlot)):
			continue
		var origData = grabBodypartOriginalData(bodypartSlot)
		theChar.applyTFBodypart(bodypartSlot, origData)
	
	affectedParts = newAffectedParts
	
	theChar.updateAppearance()

func canAddText() -> bool:
	return transformInProgress

func tryCombineEffect(effect, theEffects:Array):
	for _i in range(theEffects.size()):
		if(theEffects[_i].needsToBeChecked || theEffects[_i] == effect):
			continue
		if(effect.canReplace(theEffects[_i])):
			var oldEffect = theEffects[_i]
			#theEffects[_i] = effect
			theEffects.remove(_i)
			#theEffects.append(effect)
			effect.onReplace(oldEffect)
			return

func optimizeEffects():
	var toCheck:Array = []
	for effect in charEffects:
		if(effect.needsToBeChecked):
			toCheck.append(effect)
	
	for effect in toCheck:
		tryCombineEffect(effect, charEffects)
		effect.needsToBeChecked = false
	
	for slot in partEffects:
		var theEffects:Array = partEffects[slot]
		
		var toCheck2:Array = []
		for effect in theEffects:
			if(effect.needsToBeChecked):
				toCheck2.append(effect)
		
		for effect in toCheck2:
			tryCombineEffect(effect, theEffects)
			effect.needsToBeChecked = false
	
	#print(charEffects)
	#print(charEffects.duplicate())
