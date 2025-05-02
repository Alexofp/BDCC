extends SexGoalBase

func _init():
	id = SexGoal.ReceiveAnal

func getVisibleName():
	return "Ride (Anal)"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(!_domInfo.getChar().hasReachableAnus() || !_subInfo.getChar().hasReachablePenis()):
		return false
	if(!_subInfo.getChar().canZoneOrgasm(BodypartSlot.Penis)):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 1.0,
		SexGoal.SubOptionalCondomOnSub: 0.5,
		SexGoal.SubOptionalApplyLubeOnDom: 0.1,
	}

func domWantsToCum():
	return true

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	var sub = _subInfo.getChar()
	var dom = _domInfo.getChar()
	
	if(sub.hasReachablePenis()):
		dom.gotAnusFuckedBy(sub.getID())
		if(RNG.chance(30)):
			dom.cummedOnBy(sub.getID())
		elif(!dom.hasWombIn(BodypartSlot.Anus) || RNG.chance(OPTIONS.getSandboxOffscreenBreedingMult()*100.0)):
			dom.cummedInAnusBy(sub.getID())

	if(RNG.chance(50)):
		sendSexEvent(_sexEngine, SexEvent.PainInflicted, _domInfo, _subInfo, {pain=RNG.randi_range(1, 20),isDefense=false,intentional=false})
