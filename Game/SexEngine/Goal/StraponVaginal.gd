extends SexGoalBase

func _init():
	id = SexGoal.StraponVaginal

func getVisibleName():
	return "Strapon vagina"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundArms() || _domInfo.getChar().hasBlockedHands()):
		return false
	if(_subInfo.isUnconscious()):
		return false
	if(!_domInfo.getChar().hasPenis() && _subInfo.getChar().hasReachableVagina()):
		return true
	
	return false
	
func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
		SexGoal.SubUndressDom: 1.0,
		SexGoal.SubWearStraponOnDom: 1.0,
		SexGoal.SubOptionalApplyLubeOnSub: 0.5,
	}
