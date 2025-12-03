extends SexGoalBase

func _init():
	id = SexGoal.ChokeSexVaginal

func getVisibleName():
	return "Choke-Fuck vaginally"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(!_domInfo.getChar().hasReachablePenis() || !_subInfo.getChar().hasReachableVagina()):
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
		SexGoal.SubOptionalCondomOnDom: 0.5,
		SexGoal.SubOptionalApplyLubeOnSub: 0.5,
	}

func canLeadToSubsPregnancy(_sexEngine, _domInfo, _subInfo, _data):
	return true

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
		sub.gotVaginaFuckedBy(dom.getID())
		if(!sub.hasWombIn(BodypartSlot.Vagina) || RNG.chance(OPTIONS.getSandboxOffscreenBreedingMult()*100.0)):
			sub.cummedInVaginaBy(dom.getID())

	if(RNG.chance(50)):
		sendSexEvent(_sexEngine, SexEvent.PainInflicted, _domInfo, _subInfo, {pain=RNG.randi_range(1, 20),isDefense=false,intentional=false})

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Choke+fuck my pussy!"

func getBegCategory() -> Array:
	return BegCategoryChoking
	
func getBegDesc() -> String:
	return "Beg the dom to fuck your pussy while choking you!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	var _isBusy:bool = _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex)
	var _hasBlockedArms:bool = _subInfo.getChar().hasBlockedHands() || _subInfo.getChar().hasBoundArms()
	var _isVagFree:bool = (_subInfo.getChar().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null)

	if(!_isBusy && !_hasBlockedArms && _isVagFree):
		return "{sub.You} {sub.youVerb('spread')} {sub.yourHis} {sub.vaginaStretch} pussy."
	
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to use {sub.yourHis} {sub.vaginaStretch} pussy while choking {sub.youHim}."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"Please, I need you inside me, I want to feel you in my pussy while you choke me.",
		"Fuck my pussy and cut off my air, I want to feel owned completely.",
		"Use my pussy.. and please don't stop choking me while you do.",
		"I'm begging you, fill my pussy while you have your hands on my throat.",
		"Please, let me feel you fucking my pussy while I'm dizzy from you choking me.",
		"I want your cock buried in my pussy and your hand around my neck, please give it to me.",
		"While you're choking me, please fuck my needy pussy, I can't take it anymore.",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.Choking: 1.0,
		Fetish.VaginalSexGiving: 1.0,
	}
