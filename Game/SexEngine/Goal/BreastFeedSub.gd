extends SexGoalBase

func _init():
	id = SexGoal.BreastFeedSub

func getVisibleName():
	return "Breastfeed sub"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	#if(!_subInfo.getChar().canBeMilked()):
	#	return false
	if(_subInfo.getChar().isOralBlocked()):
		return false
	
	return true
	
func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressDom: 1.0,
	}
	
func getGoalDefaultWeight():
	return 0.5
