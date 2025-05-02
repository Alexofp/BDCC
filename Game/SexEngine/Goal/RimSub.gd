extends SexGoalBase

func _init():
	id = SexGoal.RimSub

func getVisibleName():
	return "Rim sub"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(!_subInfo.getChar().hasReachableAnus() || _domInfo.getChar().isOralBlocked()):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func getGoalDefaultWeight():
	return 0.1
