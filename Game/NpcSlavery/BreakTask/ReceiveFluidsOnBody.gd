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

func getNpcOwnerDialogueLines() -> Array:
	return [
		"I want to see you covered in cum from head to toe.",
		"Come back dripping with cum all over your body.",
		"Get as many loads on you as possible.",
		"I want to see you covered in fresh cum."
	]

func getSexGoalWeightModifier(_sexGoalID:String) -> float:
	if(_sexGoalID == SexGoal.FuckOral):
		return 3.0
	return 0.0
