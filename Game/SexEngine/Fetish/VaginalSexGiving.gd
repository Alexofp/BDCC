extends FetishBase

func _init():
	id = Fetish.VaginalSexGiving
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Subby: -0.25,
	}

func getVisibleName():
	return "Vaginal sex (Top)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.FuckVaginal)
	
	return possible

func isPossibleFor(_character):
	if(!_character.hasPenis()):
		return false
	return true
