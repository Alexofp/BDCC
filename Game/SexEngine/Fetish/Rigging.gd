extends FetishBase

func _init():
	id = Fetish.Rigging

func getVisibleName():
	return "Rigging"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.TieUp)
	
	return possible
