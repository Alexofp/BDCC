extends NpcBreakTaskBase

func _init():
	id = "SwallowFluids"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 1.0,
	}

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(_pc.hasReachablePenis()):
		return true
	if(_pc.hasVagina()):
		return true
	if(_pc.hasStrapons()):
		return true
	
	return false

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(50, 100, _difficulty)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.HoleCreampied || _event.getType() == SexEvent.StraponCreampied || _event.getType() == SexEvent.HoleSpitted):
		if(_event.getTargetChar() == _npc && _event.targetIsSub()):
			if(_event.getField("hole", BodypartSlot.Head) in [BodypartSlot.Head]):
				advanceTask(_event.getField("loadSize", 0))
				return true
	return false

func getTaskString():
	return "Swallow cum: "+str(Util.roundF(currentAmount, 1))+"/"+str(Util.roundF(needAmount, 1))+"ml"

func getTaskHint(_isSlaveLevelup):
	return "Force them to swallow this much fluids."
