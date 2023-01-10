extends SexGoalBase

func _init():
	id = SexGoal.DoOralOnSub

func getVisibleName():
	return "Do oral on sub"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if((_subInfo.getChar().hasReachablePenis() || _subInfo.getChar().hasReachableVagina()) && !_domInfo.getChar().isOralBlocked()):
		return true
	
	return false

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}
