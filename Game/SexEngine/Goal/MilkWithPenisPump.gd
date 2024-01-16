extends SexGoalBase

func _init():
	id = SexGoal.MilkWithPenisPump

func getVisibleName():
	return "Use penis pump on"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	if(_subInfo.getChar().hasReachablePenis() || _subInfo.getChar().getWornPenisPump() != null):
		return true
	return false

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func getGoalDefaultWeight():
	return 0.1
