extends SexGoalBase

func _init():
	id = SexGoal.ReceiveVaginal

func getVisibleName():
	return "Ride (Vaginal)"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasReachableVagina() && _subInfo.getChar().hasReachablePenis()):
		return true
	
	return false
