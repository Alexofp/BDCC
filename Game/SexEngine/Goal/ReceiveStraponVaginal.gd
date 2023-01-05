extends SexGoalBase

func _init():
	id = SexGoal.ReceiveStraponVaginal

func getVisibleName():
	return "Ride strapon (Vaginal)"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasReachableVagina() && !_subInfo.getChar().hasPenis()):
		return true
	
	return false
