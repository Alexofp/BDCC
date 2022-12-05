extends FetishBase

func _init():
	id = Fetish.AnalSexReceiving

func getVisibleName():
	return "Anal sex (Receiving)"

func getGoals(_sexEngine, _dom, _sub):
	var possible = []
	
	possible.append(SexGoal.ReceiveAnal)
	
	return possible
