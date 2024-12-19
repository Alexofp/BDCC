extends SexGoalBase

func _init():
	id = SexGoal.ChokeReceiveVaginal

func getVisibleName():
	return "Ride+Choke (Vaginal)"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(!_domInfo.getChar().hasReachableVagina() || !_subInfo.getChar().hasReachablePenis()):
		return false
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	if(!_subInfo.getChar().canZoneOrgasm(BodypartSlot.Penis)):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubChoking: 1.0,
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 1.0,
		SexGoal.SubOptionalCondomOnSub: 0.5,
		SexGoal.SubOptionalApplyLubeOnDom: 0.1,
	}

func getGoalDefaultWeight():
	return 0.5

func domWantsToCum():
	return true

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	for _i in range(RNG.randi_range(0, 3)):
		sendSexEvent(_sexEngine, SexEvent.Choking, _domInfo, _subInfo, {strongChoke=RNG.chance(20)})
	
	var sub = _subInfo.getChar()
	var dom = _domInfo.getChar()
	
	if(sub.hasReachablePenis()):
		dom.gotVaginaFuckedBy(sub.getID())
		if(!dom.hasWombIn(BodypartSlot.Vagina) || RNG.chance(OPTIONS.getSandboxOffscreenBreedingMult()*100.0)):
			dom.cummedInVaginaBy(sub.getID())

	if(RNG.chance(50)):
		sendSexEvent(_sexEngine, SexEvent.PainInflicted, _domInfo, _subInfo, {pain=RNG.randi_range(1, 20),isDefense=false,intentional=false})
