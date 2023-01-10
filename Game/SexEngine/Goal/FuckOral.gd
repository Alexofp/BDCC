extends SexGoalBase

func _init():
	id = SexGoal.FuckOral

func getVisibleName():
	return "Fuck orally"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if((_domInfo.getChar().hasReachablePenis() || _domInfo.getChar().hasReachableVagina()) && !_subInfo.getChar().isOralBlocked()):
		return true
	
	return false

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressDom: 1.0,
	}
