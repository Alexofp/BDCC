extends SexGoalBase

func _init():
	id = SexGoal.Choke

func getVisibleName():
	return "Choke sub"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.isUnconscious()):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
	}

func getGoalDefaultWeight():
	return 0.2
