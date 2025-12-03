extends SexGoalBase

func _init():
	id = SexGoal.Choke

func getVisibleName():
	return "Choke sub"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.isUnconscious()):
		return false
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
	}

func getGoalDefaultWeight():
	return 0.2

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	for _i in range(RNG.randi_range(0, 5)):
		sendSexEvent(_sexEngine, SexEvent.Choking, _domInfo, _subInfo, {strongChoke=RNG.chance(20)})

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Choke me!"

func getBegCategory() -> Array:
	return BegCategoryChoking

func getBegDesc() -> String:
	return "Beg the dom to choke your neck!"

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	var _isBusy:bool = _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex)

	if(!_isBusy):
		return "{sub.You} {sub.youVerb('offer')} {dom.you} {sub.yourHis} exposed neck."
	
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to choke {sub.youHim}."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"Please, I need to feel your hand on my neck.",
		"Choke me, I want to feel owned by you.",
		"I'm begging you, cut off my air just for a second.. or more.",
		"Your hands on my neck is all I can think about. Please?",
		"Be rough, please. Squeeze my throat hard.",
		"I want to feel completely helpless. Choke me!",
		"Please, I'll be so good for you if you just choke me.",
		"Wrap your fingers around my neck and squeeze hard. Please?"
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.Choking: 1.0,
	}
