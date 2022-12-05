extends SexGoalBase

func _init():
	id = SexGoal.FuckVaginal

func getVisibleName():
	return "Fuck vaginally"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasReachablePenis() && _subInfo.getChar().hasReachableVagina()):
		return true
	
	return false
