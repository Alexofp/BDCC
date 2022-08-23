extends Object
class_name FlagType

enum {
	Bool,
	Number,
	Text,
	Dict,
	Anything,
}

static func getDefaultValue(flagType):
	if(flagType == Bool):
		return false
	if(flagType == Number):
		return 0
	if(flagType == Text):
		return ""
	if(flagType == Dict):
		return {}
	
	return false

static func isCorrectType(flagType, value):
	if(flagType == Bool):
		if(value is bool):
			return true
	if(flagType == Number):
		if(value is float || value is int):
			return true
	if(flagType == Text):
		if(value is String):
			return true
	if(flagType == Dict):
		if(value is Dictionary):
			return true
	if(flagType == Anything):
		return true
	
	return false

static func getVisibleName(flagType):
	if(flagType == Bool):
		return "Bool"
	if(flagType == Number):
		return "Number"
	if(flagType == Text):
		return "Text"
	if(flagType == Dict):
		return "Dict"
	if(flagType == Anything):
		return "Anything"
	
	return "Error?"
