extends FetishBase

func _init():
	id = Fetish.Tribadism

func getVisibleName():
	return "Tribadism"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.Tribadism)
	
	return possible

func isPossibleFor(_character):
	if(!_character.hasVagina()):
		return false
	return true
