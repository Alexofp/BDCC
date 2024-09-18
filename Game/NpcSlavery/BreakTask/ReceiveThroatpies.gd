extends NpcBreakTaskBase

func _init():
	id = "ReceiveThroatpies"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 1.0,
	}

func getSlutlockWeight() -> float:
	return 0.4

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func isPossibleForSlutlock(_npc):
	if(_npc.isOralBlocked()):
		return false
	return .isPossibleForSlutlock(_npc)

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(_pc.hasReachablePenis()):
		return true
	if(_pc.hasStrapons()):
		return true
	if(_isSlaveLevelup):
		return true
	
	return false

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(1, 2, _difficulty)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.HoleCreampied || _event.getType() == SexEvent.StraponCreampied):
		if(_event.getTargetChar() == _npc):
			if(_event.getField("hole", BodypartSlot.Head) in [BodypartSlot.Head]):
				advanceTask()
				return true
	return false

func getTaskString():
	return "Received throatpies: "+getProgressString()

func getTaskHint(_isSlaveLevelup):
	return "Cum down their throat. If you don't have a penis, you can use a loaded strapon!"
