extends FetishBase

func _init():
	id = Fetish.Breeding
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Subby: -0.25,
		PersonalityStat.Mean: 0.25,
		PersonalityStat.Impatient: 0.1,
		PersonalityStat.Coward: -0.25,
	}

func getVisibleName():
	return "Breeding others"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	if(_sub.hasAnyWomb()):
		if(_sub.hasVagina()):
			possible.append(SexGoal.FuckVaginal)
		else:
			possible.append(SexGoal.FuckAnal)
	
	return possible

func isPossibleFor(_character):
	if(!_character.hasPenis()):
		return false
	return true
