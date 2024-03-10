extends NpcBreakTaskBase

func _init():
	id = "Spank"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.4,
	}

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(3, 6, _difficulty)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.Spanked):
		if(_event.getTargetChar() == _npc && _event.targetIsSub()):
			advanceTask()
			return true
	return false

func getTaskString():
	return "Receive spanks: "+getProgressString()

func getTaskHint(_isSlaveLevelup):
	return "Spank their butt during sex, any spank will do"
