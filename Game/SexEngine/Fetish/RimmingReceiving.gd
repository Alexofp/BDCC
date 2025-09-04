extends FetishBase

func _init():
	id = Fetish.RimmingReceiving
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Subby: -0.3,
		PersonalityStat.Mean: 0.2,
		PersonalityStat.Coward: -0.1,
	}

func getVisibleName():
	return "Rimming (Receiving)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = [SexGoal.RimmingReceive]
	
	return possible
