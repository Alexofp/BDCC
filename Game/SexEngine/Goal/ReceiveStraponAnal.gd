extends SexGoalBase

func _init():
	id = SexGoal.ReceiveStraponAnal

func getVisibleName():
	return "Ride strapon (Anal)"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasReachableAnus() && !_subInfo.getChar().hasPenis()):
		return true
	
	return false
