extends NpcBreakTaskBase

func _init():
	id = "ForceLactation"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.2,
	}

func isPossibleFor(_npc, _isSlaveLevelup):
	if(!_npc.hasNonFlatBreasts()):
		return false
	if(_npc.isLactating()):
		return false
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	return true

func isCompletedFor(_npc):
	if(_npc.isLactating()):
		return true
	return false

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = 1

func onSexEvent(_npc, _event:SexEvent):
	return false

func getTaskString():
	return "Force to lactate"

func getTaskHint(_isSlaveLevelup):
	return "Squeeze their breasts until the milk starts coming out"


