extends Object
class_name CrotchVarType

const ANY = 0
const NUMBER = 1
const STRING = 2

static func getDefaultValue(theType):
	if(theType == NUMBER):
		return 0
	if(theType == STRING):
		return ""
	return null
