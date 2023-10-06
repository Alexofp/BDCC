extends SexGoalBase

func _init():
	id = SexGoal.BreastFeedOnSub

func getVisibleName():
	return "Breastfeed on sub"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	#if(!_subInfo.getChar().canBeMilked()):
	#	return false
	
	return true
	
func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}
	
func getGoalDefaultWeight():
	return 0.5
