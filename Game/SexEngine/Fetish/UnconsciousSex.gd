extends FetishBase

func _init():
	id = Fetish.UnconsciousSex
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Mean: 0.3,
		PersonalityStat.Coward: -0.2,
	}

func getVisibleName():
	return "Unconscious sex"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	return possible
