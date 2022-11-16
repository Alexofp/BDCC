extends SexGoalBase

func _init():
	id = SexGoal.Tribadism

func getVisibleName():
	return "Tribadism"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasReachableVagina() && _subInfo.getChar().hasReachableVagina()):
		return true
	
	return false
