extends FetishBase

func _init():
	id = Fetish.Sadism
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Mean: 0.2,
		PersonalityStat.Subby: -0.2,
		PersonalityStat.Coward: -0.1,
	}

func getVisibleName():
	return "Sadism"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = [SexGoal.SpankSub]
	
	return possible
