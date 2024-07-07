extends Object
class_name DatapackSceneVarType

const BOOL = "bool"
const NUMBER = "number"
const STRING = "string"

static func getAll():
	return [BOOL, NUMBER, STRING]

static func getName(theType):
	if(theType == BOOL):
		return "Bool"
	if(theType == NUMBER):
		return "Number"
	if(theType == STRING):
		return "String"
	
	return "ERROR?"

static func getDefaultValue(theType):
	if(theType == BOOL):
		return false
	if(theType == NUMBER):
		return 0
	if(theType == STRING):
		return ""
	
	return null
