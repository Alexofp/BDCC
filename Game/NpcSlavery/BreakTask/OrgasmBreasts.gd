extends NpcBreakTaskBase

func _init():
	id = "OrgasmBreasts"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.15,
	}

func isPossibleFor(_npc, _isSlaveLevelup):
	if(_npc.getFetishHolder().getFetishValue(Fetish.Lactation) < 0.2):
		return false
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(_pc.getFetishHolder().getFetishValue(Fetish.Lactation) < 0.0):
		return false
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(1, 2, _difficulty/2.0)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.UniqueOrgasm):
		if(_event.getTargetChar() == _npc):
			if(_event.getField("orgasmType", "") == "breasts"):
				advanceTask()
				return true
	return false

func getTaskString():
	return "Orgasm (breasts): "+getProgressString()

func getTaskHint(_isSlaveLevelup):
	return "Force them to orgasm just from you stimulating their breasts!"
