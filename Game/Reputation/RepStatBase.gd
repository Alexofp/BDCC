extends Reference
class_name RepStatBase

var id:String = "error"

func getVisibleName():
	return "Error?"

func getTextForLevel(_level:int, _rep):
	return "ERROR, FILL ME PLS"

func getMaxLevel() -> int:
	return 4

func getMinLevel() -> int:
	return -1

func getNeededScoreForLevel(_level:int) -> float:
	return 1.0
