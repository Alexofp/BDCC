extends FetishBase

func _init():
	id = Fetish.RimmingGiving
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Subby: 0.3,
		PersonalityStat.Naive: 0.1,
		PersonalityStat.Coward: -0.1,
	}

func getVisibleName():
	return "Rimming (Giving)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = [SexGoal.RimSub]
	
	return possible
