extends FetishBase

func _init():
	id = Fetish.SeedMilking
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Mean: 0.2,
	}

func getVisibleName():
	return "Seed Milking"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	if(_sub.hasReachablePenis()):
		possible.append(SexGoal.MilkWithPenisPump)
	
	return possible

func isPossibleFor(_character):
	return true
