extends SexGoalBase

func _init():
	id = SexGoal.RimmingReceive

func getVisibleName():
	return "Receive rimming"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(!_domInfo.getChar().hasReachableAnus() || _subInfo.getChar().isOralBlocked()):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressDom: 1.0,
	}

func getGoalDefaultWeight():
	return 0.1

func domWantsToCum():
	return true
