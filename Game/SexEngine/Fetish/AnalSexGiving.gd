extends FetishBase

func _init():
	id = Fetish.AnalSexGiving
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Subby: -0.25,
	}

func getVisibleName():
	return "Anal sex (Top)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.FuckAnal)
	
	return possible

func isPossibleFor(_character):
	if(!_character.hasPenis()):
		return false
	return true
