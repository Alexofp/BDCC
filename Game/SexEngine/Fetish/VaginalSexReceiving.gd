extends FetishBase

func _init():
	id = Fetish.VaginalSexReceiving

func getVisibleName():
	return "Vaginal sex (Bottom)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.ReceiveVaginal)
	
	return possible

func isPossibleFor(_character):
	if(!_character.hasVagina()):
		return false
	return true
