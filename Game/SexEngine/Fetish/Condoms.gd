extends FetishBase

func _init():
	id = Fetish.Condoms
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Coward: 0.4,
		PersonalityStat.Impatient: -0.2,
	}

func getVisibleName():
	return "Condoms"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	return possible
