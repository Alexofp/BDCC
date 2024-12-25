extends Reference
class_name TFBase

var id:String = "error"
var holderRef:WeakRef
var uniqueID:int = -1

const TFTYPE_CHAR = 0
const TFTYPE_PART = 1

var tfTexts:Array = [] # no save

func start(_args:Dictionary):
	pass

func setHolder(_holder):
	holderRef = weakref(_holder)

func getHolder():
	if(holderRef == null):
		return null
	return holderRef.get_ref()

func getChar() -> BaseCharacter:
	var theHolder = getHolder()
	if(theHolder == null):
		return null
	return theHolder.getChar()

func getName() -> String:
	return "FILL ME!"

func isReadyToProgress() -> bool:
	return false

func doProgress(_context:Dictionary) -> Dictionary:
	return {
		effects = [],
	}

func reactProgress(_context:Dictionary, _result:TFResult):
	pass
	
func reactProgressFinal(_context:Dictionary, _result:TFResult):
	tfTexts.clear()
	reactProgress(_context, _result)
	return {text=Util.join(tfTexts, "\n\n")}

func reactProgressShort(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts(" "))

func reactProgressShortFinal(_context:Dictionary, _result:TFResult):
	tfTexts.clear()
	reactProgressShort(_context, _result)
	return {text=Util.join(tfTexts, " ")}

func doCancel(_context:Dictionary) -> Dictionary:
	return {
		text = "MEOW GOT CANCELLED!",
	}

func processTime(_seconds:int):
	pass

func addText(theText:String):
	if(theText == ""):
		return
	#getHolder().addTextToReactQueue(theText)
	tfTexts.append(theText)

func effect(_effectID:String, _args:Array = []):
	var theEffect:TFEffect = GlobalRegistry.createTransformationEffect(_effectID)
	theEffect.tfID = uniqueID
	theEffect.initArgs(_args)
	return theEffect

func partEffect(theid:String, part:String, effectID:String, args:Array = []) -> Dictionary:
	return {
		id = theid,
		type = TFTYPE_PART,
		part = part,
		effect = effect(effectID, args),
	}
	
func charEffect(theid:String, effectID:String, args:Array = []) -> Dictionary:
	return {
		id = theid,
		type = TFTYPE_CHAR,
		effect = effect(effectID, args),
	}
