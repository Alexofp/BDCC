extends FetishBase

func _init():
	id = Fetish.Breeding

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
