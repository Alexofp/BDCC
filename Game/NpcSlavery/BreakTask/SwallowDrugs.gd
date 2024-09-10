extends NpcBreakTaskBase

func _init():
	id = "SwallowDrugs"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.3,
	}

func getSlutlockWeight() -> float:
	return 0.2

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(1, 1, _difficulty / 2.0)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.DrugSwallowed):
		if(_event.getTargetChar() == _npc && _event.targetIsSub()):
			advanceTask()
			return true
	return false

func getTaskString():
	return "Swallow drugs: "+getProgressString()

func getTaskStringSlutLock():
	return "Get forced to swallow drugs: "+getProgressString()

func getTaskHint(_isSlaveLevelup):
	return "Make them take any kind of drug during sex!"


