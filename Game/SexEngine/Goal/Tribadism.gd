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

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Offer to trib"

func getBegCategory() -> Array:
	return BegCategorySex

func getBegDesc() -> String:
	return "Beg the dom to rub your pussies against each other!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	var _isBusy:bool = _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex)
	var _hasBlockedArms:bool = _subInfo.getChar().hasBlockedHands() || _subInfo.getChar().hasBoundArms()
	var _isVagFree:bool = (_subInfo.getChar().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null)

	if(!_isBusy && !_hasBlockedArms && _isVagFree):
		return "{sub.You} {sub.youVerb('spread')} {sub.yourHis} {sub.vaginaStretch} pussy."
	
	return "{sub.You} {sub.youVerb('beg')} to do some scissoring with {dom.you}."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"Please, I need to feel you.. Let's rub our pussies together, I'm begging you.",
		"I need to feel how wet you are against me. Please, let our pussies kiss.",
		"Let me feel you.. please, let us rub together until I can't think straight.",
		"I'm aching to have our clits sliding against one another. Please, grant me that?",
		"Let me feel the heat from your pussy against mine. I need it so badly.",
		"I'll be so good for you, just please let us scissor. I need that..",
		"Please, I'm begging you, let me feel your pussy grind against mine. I can't wait any longer.",
		"Use me, let our bodies tangle together. Please, rub your pussy against mine.",
		"Your pussy against mine is all I want. Please?",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.Tribadism: 1.0,
	}
