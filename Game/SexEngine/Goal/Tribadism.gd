extends SexGoalBase

func _init():
	id = SexGoal.Tribadism

func getVisibleName():
	return "Tribadism"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(!_domInfo.getChar().hasReachableVagina() || !_subInfo.getChar().hasReachableVagina()):
		return false
	if(!_subInfo.getChar().canZoneOrgasm(BodypartSlot.Vagina) && !_domInfo.getChar().canZoneOrgasm(BodypartSlot.Vagina)):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 1.0,
	}

func domWantsToCum():
	return true

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	var sub = _subInfo.getChar()
	var dom = _domInfo.getChar()
	
	if(sub.hasReachableVagina() && dom.hasReachableVagina()):
		dom.rubsVaginasWith(sub.getID())
		
		if(RNG.chance(30)):
			dom.cummedOnBy(sub.getID(), FluidSource.Vagina)
		if(RNG.chance(30)):
			sub.cummedOnBy(dom.getID(), FluidSource.Vagina)
