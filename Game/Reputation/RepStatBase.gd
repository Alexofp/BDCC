extends Reference
class_name RepStatBase

var id:String = "error"

func getVisibleName():
	return "Error?"

func getTextForLevel(_level:int, _rep):
	return "ERROR, FILL ME PLS"

func getEffectsInfoForLevel(_level:int, _rep) -> Array:
	return []

func getMaxLevel() -> int:
	return 4

func getMinLevel() -> int:
	return -1

func getNeededScoreForLevel(_level:int, _curLevel:int) -> float:
	if(_curLevel > 0 && _level < _curLevel):
		return 1.0
	if(_curLevel < 0 && _level > _curLevel):
		return 1.0
	
	var absLevel:int = _level
	if(absLevel < 0):
		absLevel = -absLevel
	
	if(absLevel <= 1):
		return 1.0
	
	var neededScore:float = 1.0 + (absLevel*absLevel)*0.1
	
	return neededScore

func getSpecialRequirementToReachLevel(_level:int, _rep):
	#if(_level == 3):
	#	return ["somekey", "DO SOMETHING SILLY"]
	
	return null
