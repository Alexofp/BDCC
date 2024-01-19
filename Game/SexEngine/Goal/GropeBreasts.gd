extends SexGoalBase

func _init():
	id = SexGoal.GropeBreasts

func getVisibleName():
	return "Breast groping"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	return true
	
func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 0.1,
	}
	
func getGoalDefaultWeight():
	return 0.5
