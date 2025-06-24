extends FetishBase

func _init():
	id = Fetish.FeetplayReceiving
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Subby: 0.25,
		PersonalityStat.Brat: 0.2,
		PersonalityStat.Naive: 0.1,
	}

func getVisibleName():
	return "Feetplay (Sub)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	return possible
