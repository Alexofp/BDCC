extends FetishBase

func _init():
	id = Fetish.OralSexGiving

func getVisibleName():
	return "Oral sex (Performing)"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = [SexGoal.DoOralOnSub]
	if(_domFetishHolder.getFetishValue(Fetish.OralSexReceiving) >= 0.0):
		possible.append(SexGoal.Fuck69)
	
	return possible
