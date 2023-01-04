extends SexGoalBase

func _init():
	id = SexGoal.StraponVaginal

func getVisibleName():
	return "Strapon vagina"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.isUnconscious()):
		return false
	if(!_domInfo.getChar().hasPenis() && _subInfo.getChar().hasReachableVagina()):
		return true
	
	return false
