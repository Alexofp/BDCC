extends SexGoalBase

func _init():
	id = SexGoal.SpankSub

func getVisibleName():
	return "Spank sub"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.isUnconscious()):
		return false
	if(_subInfo.getConsciousness() <= 0.5):
		return false
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 0.1,
	}

func getGoalDefaultWeight():
	return 0.4
