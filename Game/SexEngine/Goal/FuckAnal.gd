extends SexGoalBase

func _init():
	id = SexGoal.FuckAnal

func getVisibleName():
	return "Fuck anally"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasReachablePenis() && _subInfo.getChar().hasReachableAnus()):
		return true
	
	return false
