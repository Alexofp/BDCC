extends Object
class_name RecruitDifficulty

const VeryEasy := 0
const Easy := 1
const Medium := 2
const Hard := 3

static func getName(_diff:int) -> String:
	if(_diff == VeryEasy):
		return "Very Easy"
	if(_diff == Easy):
		return "Easy"
	if(_diff == Medium):
		return "Medium"
	if(_diff == Hard):
		return "Hard"
	return "Unknown"

static func getDifficultyText(_diff:int) -> String:
	if(_diff == VeryEasy):
		return "3 yellows"
	if(_diff == Easy):
		return "2 yellows"
	if(_diff == Medium):
		return "1 yellow"
	if(_diff == Hard):
		return "No yellows"
	return "Unknown"

static func getDifficultyYellowAmount(_diff:int) -> int:
	if(_diff == VeryEasy):
		return 3
	if(_diff == Easy):
		return 2
	if(_diff == Medium):
		return 1
	if(_diff == Hard):
		return 0
	return 0
