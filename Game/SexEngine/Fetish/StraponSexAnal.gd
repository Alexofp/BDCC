extends FetishBase

func _init():
	id = Fetish.StraponSexAnal

func getVisibleName():
	return "Strapon sex (Anal)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.StraponAnal)
	
	if(_domFetishHolder.getFetishValue(Fetish.AnalSexReceiving) >= 0.0):
		possible.append(SexGoal.ReceiveStraponAnal)
	
	return possible

func isPossibleFor(_character):
	#if(_character.hasPenis()):
	#	return false
	return true
