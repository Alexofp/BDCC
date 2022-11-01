extends FetishBase

func _init():
	id = Fetish.VaginalSexGiving

func getVisibleName():
	return "Vaginal sex (Giving)"

func getGoals(_sexEngine, _dom, _sub):
	var possible = []
	
	if(_dom.hasReachablePenis() && _sub.hasReachableVagina()):
		possible.append(SexGoal.FuckVaginal)
	
	return possible
