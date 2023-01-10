extends FetishBase

func _init():
	id = Fetish.StraponSexVaginal

func getVisibleName():
	return "Strapon sex (Vaginal)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.StraponVaginal)
	
	if(_domFetishHolder.getFetishValue(Fetish.VaginalSexReceiving) >= 0.0):
		possible.append(SexGoal.ReceiveStraponVaginal)
	
	return possible

func isPossibleFor(_character):
	#if(_character.hasPenis()):
	#	return false
	return true
