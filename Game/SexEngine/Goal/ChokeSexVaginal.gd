extends SexGoalBase

func _init():
	id = SexGoal.ChokeSexVaginal

func getVisibleName():
	return "Choke-Fuck vaginally"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasReachablePenis() && _subInfo.getChar().hasReachableVagina()):
		return true
	
	return false

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubChoking: 1.0,
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 1.0,
		SexGoal.SubOptionalCondomOnDom: 0.5,
	}

func canLeadToSubsPregnancy(_sexEngine, _domInfo, _subInfo, _data):
	return true

func getGoalDefaultWeight():
	return 0.5
