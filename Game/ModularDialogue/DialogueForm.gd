extends Reference
class_name DialogueForm

const CHAR = "CHAR"

var id:String = "error"
var defaultLine:String = ""
var requiredArgs:Dictionary = {}
var mainRole:String = ""
var dirToRole:String = ""

func getDefaultText(_args:Dictionary):
	return defaultLine

func getRequiredArgs() -> Dictionary:
	return requiredArgs

func checkArgs(_args:Dictionary):
	var ourArgs:Dictionary = getRequiredArgs()
	
	for argID in ourArgs:
		if(!_args.has(argID)):
			return [false, "Missing "+str(argID)+" argument"]
		
		var argVal = _args[argID]
		var argType:String = ourArgs[argID]
		
		if(argType == CHAR):
			if(argVal is String): # In case we supplied a character ID
				_args[argID] = GlobalRegistry.getCharacter(argVal)
				argVal = _args[argID]
			
			if(!(argVal is BaseCharacter)):
				return [false, "Wrong argument type for "+str(argID)+", character required, got "+str(argVal)]
		
	return [true]
