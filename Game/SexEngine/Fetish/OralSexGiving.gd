extends FetishBase

func _init():
	id = Fetish.OralSexGiving

func getVisibleName():
	return "Oral sex (Performing)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = [SexGoal.DoOralOnSub]
	
	return possible
