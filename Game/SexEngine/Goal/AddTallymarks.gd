extends SexGoalBase

func _init():
	id = SexGoal.AddTallymarks

func getVisibleName():
	return "Add tallymarks"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 0.3,
	}

func getGoalDefaultWeight():
	return 0.0
