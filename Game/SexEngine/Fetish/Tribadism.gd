extends FetishBase

func _init():
	id = Fetish.Tribadism

func getVisibleName():
	return "Tribadism"

func getGoals(_sexEngine, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.Tribadism)
	
	return possible
