extends FetishBase

func _init():
	id = Fetish.DrugUse
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Coward: -0.4,
		PersonalityStat.Naive: 0.4,
		PersonalityStat.Brat: 0.1,
	}

func getVisibleName():
	return "Drug use"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	return possible
