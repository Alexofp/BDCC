extends SexGoalBase

func _init():
	id = SexGoal.Fuck69

func getVisibleName():
	return "Fuck 69"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.getChar().isOralBlocked()):
		return false
	if(_domInfo.getChar().isOralBlocked()):
		return false
	
	if(!_domInfo.getChar().hasReachablePenis() && !_domInfo.getChar().hasReachableVagina()):
		return false
	if(!_subInfo.getChar().hasReachablePenis() && !_subInfo.getChar().hasReachableVagina()):
		return false
	
	if((!_subInfo.getChar().canZoneOrgasm(BodypartSlot.Penis) && !_subInfo.getChar().canZoneOrgasm(BodypartSlot.Vagina)) && (!_domInfo.getChar().canZoneOrgasm(BodypartSlot.Penis) && !_domInfo.getChar().canZoneOrgasm(BodypartSlot.Vagina))):
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
	
	if(dom.hasReachablePenis() && RNG.chance(50)):
		sub.gotThroatFuckedBy(dom.getID())
		if(RNG.chance(50)):
			sub.cummedInMouthBy(dom.getID())
		else:
			sub.cummedOnBy(dom.getID(), FluidSource.Penis)
	elif(dom.hasReachableVagina()):
		if(RNG.chance(50)):
			sub.cummedInMouthBy(dom.getID(), FluidSource.Vagina, RNG.randf_range(0.4, 0.8))
		else:
			sub.cummedOnBy(dom.getID(), FluidSource.Vagina, RNG.randf_range(0.4, 0.8))

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

	if(RNG.chance(50)):
		sendSexEvent(_sexEngine, SexEvent.PainInflicted, _domInfo, _subInfo, {pain=RNG.randi_range(1, 20),isDefense=false,intentional=false})

	if(RNG.chance(20)):
		var zone = BodyWritingsZone.getRandomZone()
		var writingID = BodyWritings.getRandomWritingIDForZone(zone)
		sub.addBodywriting(zone, writingID)
		sendSexEvent(_sexEngine, SexEvent.BodyWritingAdded, _domInfo, _subInfo, {zone=zone,writingID=writingID})
	
	if(RNG.chance(20) || sub.hasTallymarks() || (_sexEngine.getSexTypeID() in [SexType.StocksSex, SexType.SlutwallSex])):
		sub.addTallymarkFace()


func getGoalDefaultWeight():
	return 1.0
