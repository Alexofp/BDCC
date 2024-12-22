extends Reference
class_name TFBase

var id:String = "error"
var holderRef:WeakRef
var uniqueID:int = -1

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
		text = "MEOW GOT MEOW'D!",
	}

func doCancel(_context:Dictionary) -> Dictionary:
	return {
		text = "MEOW GOT CANCELLED!",
	}

func processTime(_seconds:int):
	pass
