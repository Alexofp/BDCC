extends FetishBase

func _init():
	id = Fetish.Masochism
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Subby: 0.3,
		PersonalityStat.Brat: 0.2,
		PersonalityStat.Coward: -0.2,
		PersonalityStat.Mean: 0.1,
	}

func getVisibleName():
	return "Masochism"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	return possible
