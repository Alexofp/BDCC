extends SexGoalBase

func _init():
	id = SexGoal.RimSub

func getVisibleName():
	return "Rim sub"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(!_subInfo.getChar().hasReachableAnus() || _domInfo.getChar().isOralBlocked()):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func getGoalDefaultWeight():
	return 0.1

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Ask to get rimmed"

func getBegDesc() -> String:
	return "Beg the dom to eat your butt out!"

func getBegCategory() -> Array:
	return BegCategoryExotic

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	var _isBusy:bool = _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex)
	var _hasBlockedArms:bool = _subInfo.getChar().hasBlockedHands() || _subInfo.getChar().hasBoundArms()
	var _isHoleFree:bool = (_subInfo.getChar().getFirstItemThatCoversBodypart(BodypartSlot.Anus) == null)

	if(!_isBusy && !_hasBlockedArms && _isHoleFree):
		return "{sub.You} {sub.youVerb('spread')} {sub.yourHis} {sub.anusStretch} tailhole for {dom.you}."
	
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to rim {sub.yourHis} {sub.anusStretch} tailhole."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"Please, I need to feel your tongue licking my ass.",
		"I'll be so good for you if you just rim me, please.",
		"Your tongue in my ass would feel so good, please?",
		"Just your tongue, teasing my rear hole, is all I can think about. Please?",
		"Could you please just eat my ass out? I need it so bad.",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.RimmingGiving: 1.0,
	}
