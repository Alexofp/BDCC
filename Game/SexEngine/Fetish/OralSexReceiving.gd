extends FetishBase

func _init():
	id = Fetish.OralSexReceiving
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Subby: -0.2,
		PersonalityStat.Mean: 0.1,
	}

func getVisibleName():
	return "Oral sex (Receiving)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = [SexGoal.FuckOral]
	
	return possible
