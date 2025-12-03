extends SexGoalBase

func _init():
	id = SexGoal.StraponAnal

func getVisibleName():
	return "Strapon anus"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	if(_subInfo.isUnconscious()):
		return false
	if(!_domInfo.getChar().canWearOrWearingStrapon() || !_subInfo.getChar().hasReachableAnus()):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 1.0,
		SexGoal.SubWearStraponOnDom: 1.0,
		SexGoal.SubOptionalApplyLubeOnSub: 0.5,
	}

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Peg me!"

func getBegCategory() -> Array:
	return BegCategorySex

func getBegDesc() -> String:
	return "Beg the dom to fuck your ass with a strapon!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	var _isBusy:bool = _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex)
	var _hasBlockedArms:bool = _subInfo.getChar().hasBlockedHands() || _subInfo.getChar().hasBoundArms()
	var _isHoleFree:bool = (_subInfo.getChar().getFirstItemThatCoversBodypart(BodypartSlot.Anus) == null)

	if(!_isBusy && !_hasBlockedArms && _isHoleFree):
		return "{sub.You} {sub.youVerb('spread')} {sub.yourHis} {sub.anusStretch} tailhole for {dom.you}."
	
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to peg {sub.yourHis} {sub.anusStretch} tailhole."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"Do you have a strapon? Please, I need to feel you inside my ass..",
		"Use the strapon on my ass, I'm begging you.",
		"Have a strapon maybe? Fuck my ass, I can't wait any longer.",
		"Fill my ass up, I need it so bad. Use a dildo, I don't care..",
		"I'll be so good for you, just please peg my ass.",
		"Please, I need to be stretched by you. Do you have a strapon?..",
	])

func getBegDenyDialogue() -> String:
	return RNG.pick([
		"Why would I peg you?",
		"You want to be pegged? Really? No.",
		"No pegging for you.",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.StraponSexAnal: 1.0,
	}
