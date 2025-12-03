extends SexGoalBase

func _init():
	id = SexGoal.SpankSub

func getVisibleName():
	return "Spank sub"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.isUnconscious()):
		return false
	if(_subInfo.getConsciousness() <= 0.5):
		return false
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	
	return true

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 0.1,
	}

func getGoalDefaultWeight():
	return 0.4

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	for _i in range(RNG.randi_range(0, 5)):
		sendSexEvent(_sexEngine, SexEvent.Spanked, _domInfo, _subInfo, {strongSpank=RNG.chance(20), pain=RNG.randi_range(0, 1)})

func canBegFor() -> bool:
	return true

func getBegName() -> String:
	return "Spank me"

func getBegDesc() -> String:
	return "Beg the dom to spank your ass!"

func getBegCategory() -> Array:
	return BegCategoryExotic

func getBegMessage(_sexEngine, _domInfo, _subInfo) -> String:
	var _isBusy:bool = _sexEngine.hasTag(_subInfo.charID, SexActivityTag.HavingSex)
	#var _hasBlockedArms:bool = _subInfo.getChar().hasBlockedHands() || _subInfo.getChar().hasBoundArms()
	#var _isVagFree:bool = (_subInfo.getChar().getFirstItemThatCoversBodypart(BodypartSlot.Vagina) == null)

	if(!_isBusy):
		return "{sub.You} {sub.youVerb('wiggle')} {sub.yourHis} butt at {dom.you}."
	
	return "{sub.You} {sub.youVerb('beg')} {dom.you} to spank {sub.yourHis} butt."

func getBegDialogue(_sexEngine, _domInfo, _subInfo) -> String:
	return RNG.pick([
		"Spank my ass, do it!",
		"Spank me, I've been so bad.",
		"I'm begging you, smack my ass, make it red.",
		"I need a spanking so badly, please make it sting.",
		"Could you please punish my ass? I need it.",
		"Every part of me is craving the sting of your hand on my ass.",
		"Don't make me beg too long.. just spank me, please!",
		"Just a few spanks, please? I promise I'll thank you for it.",
		"Make me gasp by spanking my ass, I'm begging you."
	])

func getBegDomFetishes() -> Dictionary:
	return {
		Fetish.Sadism: 1.0,
	}
