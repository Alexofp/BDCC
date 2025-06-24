extends FetishBase

func _init():
	id = Fetish.Exhibitionism
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Coward: -0.4,
		PersonalityStat.Naive: 0.2,
		PersonalityStat.Subby: 0.2,
	}

func getVisibleName():
	return "Exhibitionism"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	return possible
