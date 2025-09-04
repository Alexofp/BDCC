extends FetishBase

func _init():
	id = Fetish.TFGiving
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Subby: -0.2,
		PersonalityStat.Mean: 0.2,
	}

func getVisibleName():
	return "TF giver"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	#if(_domFetishHolder.getFetishValue(Fetish.DrugUse) >= 0.0):
	possible.append(SexGoal.UseTFDrug)
	
	return possible

func getDynamicChangeThreshold() -> float:
	return 1.0
	
func getDynamicChangeThresholdMax() -> float:
	return 5.0
