extends SexGoalBase

func _init():
	id = SexGoal.FuckVaginal

func getVisibleName():
	return "Fuck vaginally"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(!_domInfo.getChar().hasReachablePenis() || !_subInfo.getChar().hasReachableVagina()):
		return false
	if(!_domInfo.getChar().canZoneOrgasm(BodypartSlot.Penis)):
		return false
		
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 1.0,
		SexGoal.SubOptionalCondomOnDom: 0.5,
		SexGoal.SubOptionalApplyLubeOnSub: 0.5,
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
		if(!sub.isPlayer() || !GM.main.getEncounterSettings().isGoalDisabledForSubPC(SexGoal.DrawTallymarkOnSub)):
			sub.addTallymarkCrotch()

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Offer pussy"

func getBegCategory() -> Array:
	return BegCategorySex

func getBegDesc() -> String:
	return "Beg the dom to fuck your pussy!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	var _isBusy:bool = _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex)
	var _hasBlockedArms:bool = _subInfo.getChar().hasBlockedHands() || _subInfo.getChar().hasBoundArms()
	var _isVagFree:bool = (_subInfo.getChar().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null)

	if(!_isBusy && !_hasBlockedArms && _isVagFree):
		return "{sub.You} {sub.youVerb('spread')} {sub.yourHis} {sub.vaginaStretch} pussy."
	
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to use {sub.yourHis} {sub.vaginaStretch} pussy."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"Please, I need to feel you inside my pussy.",
		"Fuck my pussy, I'm begging you.",
		"I need your cock in my pussy so badly.",
		"Use my pussy, it's yours to take.",
		"I'll be so good for you, just please fuck my pussy.",
		"Let me feel you deep inside my pussy, please.",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.VaginalSexGiving: 1.0,
	}
