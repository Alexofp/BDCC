extends FetishBase

func _init():
	id = Fetish.Exhibitionism
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Coward: -0.4,
		PersonalityStat.Naive: 0.2,
		PersonalityStat.Subby: 0.2,
	}

func getVisibleName():
	return "Exhibitionism"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	if(_sexEngine.getSexTypeID() == SexType.TentaclesSex):
		possible.append(SexGoal.Cuddle)
	
	return possible

func getDynamicChangeThreshold() -> float:
	return 1.0
	
func getDynamicChangeThresholdMax() -> float:
	return 5.0
