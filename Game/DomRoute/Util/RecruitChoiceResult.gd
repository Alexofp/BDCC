extends Object
class_name RecruitChoiceResult

const Green := 0
const Yellow := 1
const Red := 2

static func getColor(_c:int) -> Color:
	if(_c == Green):
		return Color.green
	if(_c == Yellow):
		return Color.yellow
	if(_c == Red):
		return Color.red
	
	return Color.pink
