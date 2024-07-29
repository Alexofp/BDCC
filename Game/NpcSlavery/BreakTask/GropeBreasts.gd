extends NpcBreakTaskBase

func _init():
	id = "GropeBreasts"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.4,
	}

func isPossibleFor(_npc, _isSlaveLevelup):
	if(_npc.hasSmallBreasts()):
		return false
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(3, 6, _difficulty)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.BreastsGroped):
		if(_event.getTargetChar() == _npc):
			advanceTask()
			return true
	return false

func getTaskString():
	return "Grope breasts: "+getProgressString("times")

func getTaskHint(_isSlaveLevelup):
	return "Grope their breasts for this long"
