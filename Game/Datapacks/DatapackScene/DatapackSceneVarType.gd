extends Object
class_name DatapackSceneVarType

const BOOL = "bool"
const NUMBER = "number"
const STRING = "string"
const ANY = "any"

static func getAll():
	return [BOOL, NUMBER, STRING, ANY]

static func getName(theType):
	if(theType == BOOL):
		return "Bool"
	if(theType == NUMBER):
		return "Number"
	if(theType == STRING):
		return "String"
	if(theType == ANY):
		return "Any"
	
	return "ERROR?"

static func getDefaultValue(theType):
	if(theType == BOOL):
		return false
	if(theType == NUMBER):
		return 0
	if(theType == STRING):
		return ""
	if(theType == ANY):
		return null
	
	return null
