extends FetishBase

func _init():
	id = Fetish.StraponSexVaginal

func getVisibleName():
	return "Strapon sex (Vaginal)"

func getGoals(_sexEngine, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.StraponVaginal)
	
	return possible

func isPossibleFor(_character):
	if(_character.hasPenis()):
		return false
	return true
