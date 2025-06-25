extends FetishBase

func _init():
	id = Fetish.TFReceiving
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Naive: 0.2,
		PersonalityStat.Subby: 0.2,
	}

func getVisibleName():
	return "TF subject"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	return possible

func getDynamicChangeThreshold() -> float:
	return 1.0
	
func getDynamicChangeThresholdMax() -> float:
	return 5.0
