extends SexGoalBase

func _init():
	id = SexGoal.FuckOral

func getVisibleName():
	return "Fuck orally"

func isPossible(_sexEngine, _dom, _sub):
	if(_dom.hasReachablePenis() && !_sub.isOralBlocked()):
		return true
	
	return false
