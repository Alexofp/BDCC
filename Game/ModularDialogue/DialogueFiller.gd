extends Reference
class_name DialogueFiller

var forID:String = ""
var priority:int = 0
var weight:float = 1.0

func getFormIDs() -> Array:
	return [forID]

func getPriority(_id:String) -> int:
	return priority

func getWeight(_id:String) -> float:
	return weight

func canBeUsed(_id:String, _args:Dictionary, _form) -> bool:
	return true

func getText(_id:String, _args:Dictionary):
	return

func getTextsFinal(_id:String, _args:Dictionary) -> Array:
	var result = getText(_id, _args)
	
	if(result == null):
		return []
	if(result is Array):
		return result
	return [str(result)]

func getChar(_args:Dictionary, argID:String) -> BaseCharacter:
	if(!_args.has(argID)):
		return null
	return _args[argID]

func getCharID(_args:Dictionary, argID:String) -> String:
	if(!_args.has(argID)):
		return ""
	return _args[argID].getID()

func getVar(_args:Dictionary, argID:String, _defaultValue = null):
	if(!_args.has(argID)):
		return _defaultValue
	return _args[argID]
