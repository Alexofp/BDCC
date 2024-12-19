extends SexGoalBase

func _init():
	id = SexGoal.ChokeSexAnal

func getVisibleName():
	return "Choke-Fuck anally"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(!_domInfo.getChar().hasReachablePenis() || !_subInfo.getChar().hasReachableAnus()):
		return false
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	if(!_domInfo.getChar().canZoneOrgasm(BodypartSlot.Penis)):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubChoking: 1.0,
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 1.0,
		SexGoal.SubOptionalCondomOnDom: 1.0,
		SexGoal.SubOptionalApplyLubeOnSub: 0.5,
	}

func canLeadToSubsPregnancy(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.getChar().hasWombIn(BodypartSlot.Anus)):
		return true
	return false

func getGoalDefaultWeight():
	return 0.5

func domWantsToCum():
	return true

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	for _i in range(RNG.randi_range(0, 3)):
		sendSexEvent(_sexEngine, SexEvent.Choking, _domInfo, _subInfo, {strongChoke=RNG.chance(20)})
	
	var sub = _subInfo.getChar()
	var dom = _domInfo.getChar()
	
	if(dom.hasReachablePenis()):
		sub.gotAnusFuckedBy(dom.getID())
		if(!sub.hasWombIn(BodypartSlot.Anus) || RNG.chance(OPTIONS.getSandboxOffscreenBreedingMult()*100.0)):
			sub.cummedInAnusBy(dom.getID())

	if(RNG.chance(50)):
		sendSexEvent(_sexEngine, SexEvent.PainInflicted, _domInfo, _subInfo, {pain=RNG.randi_range(1, 20),isDefense=false,intentional=false})
