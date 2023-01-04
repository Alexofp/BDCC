extends SexGoalBase

func _init():
	id = SexGoal.StraponAnal

func getVisibleName():
	return "Strapon anus"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.isUnconscious()):
		return false
	if(!_domInfo.getChar().hasPenis() && _subInfo.getChar().hasReachableAnus()):
		return true
	
	return false
