extends SexGoalBase

func _init():
	id = SexGoal.MilkWithBreastPump

func getVisibleName():
	return "Use breast pump on"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func getGoalDefaultWeight():
	return 0.5

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Milk me!"

func getBegCategory() -> Array:
	return BegCategoryExotic

func getBegDesc() -> String:
	return "Beg the dom to milk your breasts with a breast pump!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	var _isBusy:bool = _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex)
	var _hasBlockedArms:bool = _subInfo.getChar().hasBlockedHands() || _subInfo.getChar().hasBoundArms()
	#var _isVagFree:bool = (_subInfo.getChar().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null)

	if(!_isBusy && !_hasBlockedArms):
		return "{sub.You} {sub.youVerb('squeeze')} {sub.yourHis} {sub.breasts} for {dom.you}."
	
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to milk {sub.yourHis} {sub.breasts}."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"My breasts are so heavy and aching for it, please use breast pumps on them if you have any.",
		"I'll be good, just please, milk my breasts.",
		"If you have any breast pumps, please use them on me.. I need that so badly.",
		"Every part of me is begging for you to attach some breast pumps onto my tits and drain them.",
		"Please, I want to be your good little cow, just milk me.",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.Lactation: 1.0,
	}
