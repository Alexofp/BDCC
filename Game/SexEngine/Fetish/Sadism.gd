extends FetishBase

func _init():
	id = Fetish.Sadism

func getVisibleName():
	return "Sadism"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = [SexGoal.SpankSub]
	
	return possible
