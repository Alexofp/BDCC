extends SexGoalBase

func _init():
	id = SexGoal.ReceiveVaginal

func getVisibleName():
	return "Ride (Vaginal)"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(!_domInfo.getChar().hasReachableVagina() || !_subInfo.getChar().hasReachablePenis()):
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
		dom.gotVaginaFuckedBy(sub.getID())
		if(RNG.chance(30)):
			dom.cummedOnBy(sub.getID())
		elif(!dom.hasWombIn(BodypartSlot.Vagina) || RNG.chance(OPTIONS.getSandboxOffscreenBreedingMult()*100.0)):
			dom.cummedInVaginaBy(sub.getID())

	if(RNG.chance(50)):
		sendSexEvent(_sexEngine, SexEvent.PainInflicted, _domInfo, _subInfo, {pain=RNG.randi_range(1, 20),isDefense=false,intentional=false})

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Ride me (vag)"

func getBegCategory() -> Array:
	return BegCategorySex

func getBegDesc() -> String:
	return "Beg the dom to ride your cock with their pussy!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	var _isBusy:bool = _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex)
	var _hasBlockedArms:bool = _subInfo.getChar().hasBlockedHands() || _subInfo.getChar().hasBoundArms()
	var _isCockFree:bool = (_subInfo.getChar().getFirstItemThatCoversBodypart(BodypartSlot.Penis) == null)

	if(!_isBusy && !_hasBlockedArms && _isCockFree):
		return "{sub.You} {sub.youVerb('offer')} {dom.you} to ride {sub.yourHis} {sub.penis} with {dom.yourHis} pussy."
	
	return "{sub.You} {sub.youVerb('offer')} {dom.you} to ride {sub.yourHis} {sub.penis} with {dom.yourHis} pussy."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"I need to feel you on top of me, riding my cock. Doesn't that sound fun?",
		"You should really straddle my cock. I need to feel your pussy wrapped around me.",
		"Please, I need you to fuck your pussy on my cock. I need it so bad.",
		"I'm yours. Please, take me and ride me with your pussy, I'm begging you.",
		"Don't make me wait, just slide your pussy down onto my cock and ride me.",
		"I'll be so good for you, just let me feel you riding me with your pussy.",
		"Your pussy is all I can think about. Don't wanna ride my cock?",
		"Claim my cock, please. Ride me with your pussy and make me yours completely.",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.VaginalSexReceiving: 1.0,
	}
