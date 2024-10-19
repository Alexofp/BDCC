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
