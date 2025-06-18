extends NpcBreakTaskBase

func _init():
	id = "ReceiveFluidsOnBody"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 1.0,
	}

func getSlutlockWeight() -> float:
	return 1.0

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(_pc.hasReachablePenis()):
		return true
	if(_pc.hasVagina()):
		return true
	if(_pc.hasStrapons()):
		return true
	if(_isSlaveLevelup):
		return true
	
	return false

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(100, 200, _difficulty)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.ReceivedFluidsOnBody):
		if(_event.getTargetChar() == _npc):
			currentAmount += _event.getField("loadSize", 0)
			if(currentAmount > needAmount):
				completeSelf()
			return true
	return false

func getTaskString():
	return "Cum on body: "+getProgressStringFluids()

func getTaskHint(_isSlaveLevelup):
	return "Cum or squirt on them"

func getSexGoalWeightModifier(_sexGoalID:String) -> float:
	if(_sexGoalID == SexGoal.FuckOral):
		return 3.0
	return 0.0
