extends FetishBase

func _init():
	id = Fetish.AnalSexGiving

func getVisibleName():
	return "Anal sex (Giving)"

func getGoals(_sexEngine, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.FuckAnal)
	
	return possible

func isPossibleFor(_character):
	if(!_character.hasPenis()):
		return false
	return true
