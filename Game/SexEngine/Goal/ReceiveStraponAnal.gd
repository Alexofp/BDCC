extends SexGoalBase

func _init():
	id = SexGoal.ReceiveStraponAnal

func getVisibleName():
	return "Ride strapon (Anal)"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	if(!_domInfo.getChar().hasReachableAnus() || !_subInfo.getChar().canWearStrapon()):
		return false
	if(!_domInfo.getChar().canZoneOrgasm(BodypartSlot.Anus)):
		return false
	
	return true

func domWantsToCum():
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 1.0,
		SexGoal.SubWearStraponOnSub: 1.0,
		SexGoal.SubOptionalApplyLubeOnDom: 0.1,
	}
