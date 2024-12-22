extends Reference
class_name TFHolder

var charRef:WeakRef

var originalProperties:Dictionary = {}
var transformations:Array = []

func setCharacter(theChar):
	charRef = weakref(theChar)
	
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
	newTF.setHolder(self)
	newTF.start(_args)
	return newTF

func hasActiveTransformations() -> bool:
	return !transformations.empty()

func undoAllTransformations():
	pass

func makeAllTransformationsPermanent():
	pass

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
	
	getChar().updateAppearance()
	
	return {
		text = "Meow meow.\n\n"+Util.join(texts, "\n"),
	}

func hasOriginalProperty(_changeID:String) -> bool:
	return originalProperties.has(_changeID)

func saveOriginalProperty(_changeID:String, newValue, responsibleID:int, override:bool = false):
	if(!override && hasOriginalProperty(_changeID)):
		return
	originalProperties[_changeID] = {
		value = newValue,
		id = responsibleID,
	}

func getOriginalProperty(_changeID:String, _defaultValue):
	if(!originalProperties.has(_changeID)):
		return _defaultValue
	return originalProperties[_changeID]["value"]

func getOriginalPropertyResponsibleID(_changeID:String) -> int:
	if(!originalProperties.has(_changeID)):
		return -1
	return originalProperties[_changeID]["id"]

func clearOriginalPropertiesOfID(_theID:int):
	for propID in originalProperties:
		if(originalProperties[propID]["id"] == _theID):
			var _ok = originalProperties.erase(propID)

func processTime(_seconds:int):
	for tf in transformations:
		tf.processTime(_seconds)
