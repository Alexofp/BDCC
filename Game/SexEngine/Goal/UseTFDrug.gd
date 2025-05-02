extends SexGoalBase

func _init():
	id = SexGoal.UseTFDrug

func getVisibleName():
	return "Use transformative drug"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.getChar().isOralBlocked()):
		return false
	
	return true
	
func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
	}
	
func getGoalDefaultWeight():
	return 0.2
