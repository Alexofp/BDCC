extends FetishBase

func _init():
	id = Fetish.Bondage
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Brat: 0.25,
		PersonalityStat.Subby: 0.25,
		PersonalityStat.Impatient: -0.25,
	}

func getVisibleName():
	return "Bondage"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	return possible
