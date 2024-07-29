extends NpcBreakTaskBase

func _init():
	id = "Orgasms"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 1.0,
	}

func getSlutlockWeight() -> float:
	return 1.0

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(2, 4, _difficulty)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.Orgasmed):
		if(_event.getTargetChar() == _npc):
			advanceTask()
			return true
	return false

func getTaskString():
	return "Forced orgasms: "+getProgressString()

func getTaskStringSlutLock():
	return "Orgasm: "+getProgressString()

func getTaskHint(_isSlaveLevelup):
	return "Force them to orgasm during sex"
