extends FetishBase

func _init():
	id = Fetish.Choking

func getVisibleName():
	return "Choking"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.Choke)
	
	if(_domFetishHolder.getFetishValue(Fetish.VaginalSexGiving) >= 0.0):
		possible.append(SexGoal.ChokeSexVaginal)
	if(_domFetishHolder.getFetishValue(Fetish.AnalSexGiving) >= 0.0):
		possible.append(SexGoal.ChokeSexAnal)
	if(_domFetishHolder.getFetishValue(Fetish.VaginalSexReceiving) >= 0.0):
		possible.append(SexGoal.ChokeReceiveVaginal)
	if(_domFetishHolder.getFetishValue(Fetish.AnalSexReceiving) >= 0.0):
		possible.append(SexGoal.ChokeReceiveAnal)

	return possible

func isPossibleFor(_character):
	#if(_character.hasPenis()):
	#	return false
	return true
