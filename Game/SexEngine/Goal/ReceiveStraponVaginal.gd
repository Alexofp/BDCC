extends SexGoalBase

func _init():
	id = SexGoal.ReceiveStraponVaginal

func getVisibleName():
	return "Ride strapon (Vaginal)"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	if(!_domInfo.getChar().hasReachableVagina() || !_subInfo.getChar().canWearStrapon()):
		return false
	if(!_domInfo.getChar().canZoneOrgasm(BodypartSlot.Vagina)):
		return false
	
	return true

func domWantsToCum():
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 1.0,
		SexGoal.SubWearStraponOnSub: 0.5,
		SexGoal.SubOptionalApplyLubeOnDom: 0.1,
	}
