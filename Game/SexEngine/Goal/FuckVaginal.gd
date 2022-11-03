extends SexGoalBase

func _init():
	id = SexGoal.FuckVaginal

func getVisibleName():
	return "Fuck vaginally"

func isPossible(_sexEngine, _dom, _sub):
	if(_dom.hasReachablePenis() && _sub.hasReachableVagina()):
		return true
	
	return false
