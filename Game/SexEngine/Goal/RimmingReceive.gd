extends SexGoalBase

func _init():
	id = SexGoal.RimmingReceive

func getVisibleName():
	return "Receive rimming"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(!_domInfo.getChar().hasReachableAnus() || _subInfo.getChar().isOralBlocked()):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressDom: 1.0,
	}

func getGoalDefaultWeight():
	return 0.1

func domWantsToCum():
	return true

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Offer to rim"

func getBegDesc() -> String:
	return "Beg the dom to let you eat their butt out!"

func getBegCategory() -> Array:
	return BegCategoryExotic

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	var _isBusy:bool = _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex)

	if(!_isBusy):
		return "{sub.You} {sub.youVerb('open')} {sub.yourHis} mouth wide for {dom.you}."
	
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to let {sub.youHim} rim {dom.yourHis} butt."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"Please, I need to taste your butt. Let me worship it.",
		"Let me serve you with my tongue, please. I want to make you feel so good.",
		"Please, I need to taste you. Let me eat that beautiful ass.",
		"The thought of my tongue sliding along your rear hole is driving me crazy. Please?",
		"Let me serve you with my mouth. I'm begging to eat that perfect ass.",
		"You have no idea how badly I need to rim you right now. Please?",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.RimmingReceiving: 1.0,
	}
