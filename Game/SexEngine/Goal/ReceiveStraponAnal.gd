extends SexGoalBase

func _init():
	id = SexGoal.ReceiveStraponAnal

func getVisibleName():
	return "Ride strapon (Anal)"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	if(_domInfo.getChar().hasReachableAnus() && !_subInfo.getChar().hasPenis()):
		return true
	
	return false

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 1.0,
		SexGoal.SubWearStraponOnSub: 1.0,
	}
