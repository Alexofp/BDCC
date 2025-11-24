extends SexGoalBase

func _init():
	id = SexGoal.MilkWithPenisPump

func getVisibleName():
	return "Use penis pump on"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	if(_subInfo.getChar().hasReachablePenis() || _subInfo.getChar().getWornPenisPump() != null):
		return true
	return false

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func getGoalDefaultWeight():
	return 0.1

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Milk my dick!"

func getBegDesc() -> String:
	return "Beg the dom to milk your dick with a penis pump!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	var _isBusy:bool = _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex)
	var _hasBlockedArms:bool = _subInfo.getChar().hasBlockedHands() || _subInfo.getChar().hasBoundArms()
	#var _isVagFree:bool = (_subInfo.getChar().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null)

	if(!_isBusy && !_hasBlockedArms):
		return "{sub.You} {sub.youVerb('squeeze')} {sub.yourHis} {sub.penis}."
	
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to milk {sub.yourHis} {sub.penis}."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"If you have a penis pump, please use it on me! I need to feel it pulling every drop out.",
		"I'm begging you to put a pump on my cock and just drain me completely.",
		"I'll be so good, just please use a penis pump on my dick. I need to be drained.",
		"I'm yours to use. Please, milk my cock with a penis pump if you have one like I'm your toy.",
		"If you have a penis pump.. please.. I need to be milked until I can't think straight.",
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.SeedMilking: 1.0,
	}
