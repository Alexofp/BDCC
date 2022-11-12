extends SexGoalBase

func _init():
	id = SexGoal.ReceiveAnal

func getVisibleName():
	return "Ride (Anal)"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasReachableAnus() && _subInfo.getChar().hasReachablePenis()):
		return true
	
	return false
