extends SexGoalBase

func _init():
	id = SexGoal.DoOralOnSub

func getVisibleName():
	return "Do oral on sub"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if((!_subInfo.getChar().hasReachablePenis() && !_subInfo.getChar().hasReachableVagina()) || _domInfo.getChar().isOralBlocked()):
		return false
	if(!_subInfo.getChar().canZoneOrgasm(BodypartSlot.Penis) && !_subInfo.getChar().canZoneOrgasm(BodypartSlot.Vagina)):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	var sub = _subInfo.getChar()
	var dom = _domInfo.getChar()
	
	if(sub.hasReachablePenis() && RNG.chance(50)):
		dom.gotThroatFuckedBy(sub.getID())
		if(RNG.chance(50)):
			dom.cummedInMouthBy(sub.getID())
		else:
			dom.cummedOnBy(sub.getID(), FluidSource.Penis)
	elif(sub.hasReachableVagina()):
		if(RNG.chance(50)):
			dom.cummedInMouthBy(sub.getID(), FluidSource.Vagina, RNG.randf_range(0.4, 0.8))
		else:
			dom.cummedOnBy(sub.getID(), FluidSource.Vagina, RNG.randf_range(0.4, 0.8))
