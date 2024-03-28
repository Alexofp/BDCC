extends NpcBreakTaskBase

func _init():
	id = "ReceiveFluidsInside"

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
	if(_isSlaveLevelup):
		return true
	
	return false

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(50, 100, _difficulty)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.HoleCreampied || _event.getType() == SexEvent.StraponCreampied || _event.getType() == SexEvent.HoleSpitted):
		if(_event.getTargetChar() == _npc && _event.targetIsSub()):
			if(_event.getField("hole", BodypartSlot.Head) in [BodypartSlot.Vagina, BodypartSlot.Anus]):
				advanceTask(_event.getField("loadSize", 0))
				return true
	return false

func getTaskString():
	return "Receive cum inside: "+getProgressStringFluids()

func getTaskHint(_isSlaveLevelup):
	return "Cum or spit inside their pussy/ass."
