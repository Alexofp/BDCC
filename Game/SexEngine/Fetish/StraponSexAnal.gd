extends FetishBase

func _init():
	id = Fetish.StraponSexAnal

func getVisibleName():
	return "Strapon sex (Anal)"

func getGoals(_sexEngine, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.StraponAnal)
	
	return possible

func isPossibleFor(_character):
	if(_character.hasPenis()):
		return false
	return true
