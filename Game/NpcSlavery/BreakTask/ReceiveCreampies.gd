extends NpcBreakTaskBase

func _init():
	id = "ReceiveCreampies"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 1.0,
	}

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(_pc.hasReachablePenis()):
		return true
	if(_pc.hasStrapons()):
		return true
	if(_isSlaveLevelup):
		return true
	
	return false

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(1, 3, _difficulty)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.HoleCreampied || _event.getType() == SexEvent.StraponCreampied || _event.getType() == SexEvent.HoleSpitted):
		if(_event.getTargetChar() == _npc && _event.targetIsSub()):
			if(_event.getField("hole", BodypartSlot.Head) in [BodypartSlot.Vagina, BodypartSlot.Anus]):
				advanceTask()
				return true
	return false

func getTaskString():
	return "Received creampies: "+getProgressString()

func getTaskHint(_isSlaveLevelup):
	return "Cum inside their pussy or ass. If you don't have a penis, you can use a loaded strapon! Worst case, just spit cum into it."
