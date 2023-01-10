extends FetishBase

func _init():
	id = Fetish.OralSexReceiving

func getVisibleName():
	return "Oral sex (Receiving)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = [SexGoal.FuckOral]
	
	return possible
