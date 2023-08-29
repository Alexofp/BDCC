extends SexGoalBase

func _init():
	id = SexGoal.DoFeetplay

func getVisibleName():
	return "Feetplay"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.getChar().hasReachablePenis() || _subInfo.getChar().isWearingChastityCage() || _subInfo.getChar().hasReachableVagina()):
		return true
	
	return false

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func getGoalDefaultWeight():
	return 0.3
