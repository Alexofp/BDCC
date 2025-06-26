extends FetishBase

func _init():
	id = Fetish.Rigging
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Subby: -0.3,
		PersonalityStat.Impatient: -0.2,
		PersonalityStat.Mean: 0.15,
	}

func getVisibleName():
	return "Rigging"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.TieUp)
	
	return possible
