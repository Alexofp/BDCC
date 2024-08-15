extends Reference
class_name DialogueFiller

var forID:String = ""
var priority:int = 0

func getFormIDs() -> Array:
	return [forID]

func getPriority(_id:String) -> int:
	return priority

func canBeUsed(_id:String, _args:Dictionary) -> bool:
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
