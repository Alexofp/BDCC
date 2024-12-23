extends Reference
class_name TFHolder

var charRef:WeakRef

var originalParts:Dictionary = {}
var partEffects:Dictionary = {}
var affectedParts:Dictionary = {}

var originalCharData:Dictionary = {}
var charEffects:Array = []

var transformations:Array = []

func setCharacter(theChar):
	charRef = weakref(theChar)
	
	#startTransformation("TestTF")
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

func doPendingTransformations(_context:Dictionary) -> Dictionary:
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

func addPartEffect(bodypartSlot, effect):
	if(!partEffects.has(bodypartSlot)):
		partEffects[bodypartSlot] = []
	
	var theEffects:Array = partEffects[bodypartSlot]
	for _i in range(theEffects.size()):
		if(effect.canReplace(theEffects[_i])):
			var oldEffect = theEffects[_i]
			theEffects[_i] = effect
			effect.onReplace(oldEffect)
			return
	partEffects[bodypartSlot].append(effect)

func addCharEffect(effect):
	for _i in range(charEffects.size()):
		if(effect.canReplace(charEffects[_i])):
			var oldEffect = charEffects[_i]
			charEffects[_i] = effect
			effect.onReplace(oldEffect)
			return
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
		effect.applyEffect(modifiedData)
	
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
			effect.applyEffect(modifiedData)
	
		theChar.applyTFBodypart(bodypartSlot, modifiedData)
	
	for bodypartSlot in affectedParts:
		if(newAffectedParts.has(bodypartSlot)):
			continue
		var origData = grabBodypartOriginalData(bodypartSlot)
		theChar.applyTFBodypart(bodypartSlot, origData)
	
	affectedParts = newAffectedParts
	
	theChar.updateAppearance()
