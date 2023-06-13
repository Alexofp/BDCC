extends SexGoalBase

func _init():
	id = SexGoal.FuckAnal

func getVisibleName():
	return "Fuck anally"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasReachablePenis() && _subInfo.getChar().hasReachableAnus()):
		return true
	
	return false

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 1.0,
		SexGoal.SubOptionalCondomOnDom: 1.0,
	}

func canLeadToSubsPregnancy(_sexEngine, _domInfo, _subInfo, _data):
	if(_subInfo.getChar().hasWombIn(BodypartSlot.Anus)):
		return true
	return false
