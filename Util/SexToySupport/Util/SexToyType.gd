extends Object
class_name SexToyType

const Unknown := -1
const Vibrator := 0

static func getName(_type:int) -> String:
	if(_type == Vibrator):
		return "Vibrator"
	return "Unknown:"+str(_type)
