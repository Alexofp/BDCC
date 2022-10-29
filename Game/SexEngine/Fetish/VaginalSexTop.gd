extends FetishBase

func _init():
	id = Fetish.VaginalSexTop

func getVisibleName():
	return "Vaginal sex (Giving)"

func getGoals(_sexEngine, _dom, _sub):
	var possible = []
	
	if(_dom.hasReachablePenis() && _sub.hasReachableVagina()):
		possible.append(SexGoal.Fuck)
	
	return possible
