extends SexGoalBase

func _init():
	id = SexGoal.DrawTallymarkOnSub

func getVisibleName():
	return "Draw on body (Tallymarks)"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	return true

func getTags(_indx:int) -> Array:
	return [SexActivityTag.HandsUsed]

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 0.3,
	}

func getGoalDefaultWeight():
	return 0.0
