extends FetishBase

func _init():
	id = Fetish.BeingBred
	dynamicChangesPersonalityAffectors = {
		PersonalityStat.Subby: 0.25,
		PersonalityStat.Naive: 0.25,
		PersonalityStat.Impatient: 0.1,
		PersonalityStat.Coward: -0.25,
	}

func getVisibleName():
	return "Being bred"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	return possible

func isPossibleFor(_character):
	if(!_character.hasAnyWomb()):
		return false
	return true
