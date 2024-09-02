extends SexGoalBase

func _init():
	id = SexGoal.DoFeetplay

func getVisibleName():
	return "Feetplay"

func isPossible(_sexEngine, _domInfo, _subInfo, _data):
	if(_domInfo.getChar().hasBoundLegs()):
		return false
	if(_subInfo.getChar().hasReachablePenis() || _subInfo.getChar().isWearingChastityCage() || _subInfo.getChar().hasReachableVagina()):
		return true
	
	return false

func getSubGoals(_sexEngine, _domInfo, _subInfo, _data):
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func getGoalDefaultWeight():
	return 0.3

func doFastSex(_sexEngine, _domInfo, _subInfo, _data):
	var sub = _subInfo.getChar()
	#var dom = _domInfo.getChar()
	
	if(sub.hasReachablePenis() || sub.isWearingChastityCage()):
		sub.cummedOnBy(sub.getID())
	elif(sub.hasReachableVagina()):
		sub.cummedOnBy(sub.getID(), FluidSource.Vagina)
	
	sendSexEvent(_sexEngine, SexEvent.UniqueOrgasm, _domInfo, _subInfo, {orgasmType="feet"})

	if(RNG.chance(50)):
		sendSexEvent(_sexEngine, SexEvent.PainInflicted, _domInfo, _subInfo, {pain=RNG.randi_range(1, 20),isDefense=false,intentional=false})
