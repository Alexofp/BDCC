extends SexGoalBase

func _init():
	id = SexGoal.FuckAnal

func getVisibleName():
	return "Fuck anally"

func isPossible(_sexEngine, _dom, _sub):
	if(_dom.hasReachablePenis() && _sub.hasReachableAnus()):
		return true
	
	return false
