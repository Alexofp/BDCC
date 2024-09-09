extends SexGoalBase

func _init():
	id = SexGoal.FuckVaginal

func getVisibleName():
	return "Fuck vaginally"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasReachablePenis() && _subInfo.getChar().hasReachableVagina()):
		return true
	
	return false

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 1.0,
		SexGoal.SubOptionalCondomOnDom: 0.5,
	}

func canLeadToSubsPregnancy(_sexEngine, _domInfo, _subInfo, _data):
	return true

func domWantsToCum():
	return true

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	var sub = _subInfo.getChar()
	var dom = _domInfo.getChar()
	
	if(dom.hasReachablePenis()):
		sub.gotVaginaFuckedBy(dom.getID())
		if(RNG.chance(30)):
			sub.cummedOnBy(dom.getID())
		elif(!sub.hasWombIn(BodypartSlot.Vagina) || RNG.chance(OPTIONS.getSandboxOffscreenBreedingMult()*100.0)):
			sub.cummedInVaginaBy(dom.getID())

	if(RNG.chance(50)):
		sendSexEvent(_sexEngine, SexEvent.PainInflicted, _domInfo, _subInfo, {pain=RNG.randi_range(1, 20),isDefense=false,intentional=false})
	
	if(RNG.chance(20)):
		var zone = BodyWritingsZone.getRandomZone()
		var writingID = BodyWritings.getRandomWritingIDForZone(zone)
		sub.addBodywriting(zone, writingID)
		sendSexEvent(_sexEngine, SexEvent.BodyWritingAdded, _domInfo, _subInfo, {zone=zone,writingID=writingID})
	
	if(RNG.chance(20) || sub.hasTallymarks() || (_sexEngine.getSexTypeID() in [SexType.StocksSex, SexType.SlutwallSex])):
		sub.addTallymarkCrotch()
