extends SexGoalBase

func _init():
	id = SexGoal.FuckOral

func getVisibleName():
	return "Fuck orally"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if((_domInfo.getChar().hasReachablePenis() || _domInfo.getChar().hasReachableVagina()) && !_subInfo.getChar().isOralBlocked()):
		return true
	
	return false

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
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

	if(RNG.chance(50)):
		sendSexEvent(_sexEngine, SexEvent.PainInflicted, _domInfo, _subInfo, {pain=RNG.randi_range(1, 20),isDefense=false,intentional=false})

	if(RNG.chance(20)):
		var zone = BodyWritingsZone.getRandomZone()
		var writingID = BodyWritings.getRandomWritingIDForZone(zone)
		sub.addBodywriting(zone, writingID)
		sendSexEvent(_sexEngine, SexEvent.BodyWritingAdded, _domInfo, _subInfo, {zone=zone,writingID=writingID})
	
	if(RNG.chance(20) || sub.hasTallymarks() || (_sexEngine.getSexTypeID() in [SexType.StocksSex, SexType.SlutwallSex])):
		sub.addTallymarkFace()
