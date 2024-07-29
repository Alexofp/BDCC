extends NpcBreakTaskBase

func _init():
	id = "ChastityFeetOrgasm"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.05, # More of a gimmick
	}

func isPossibleFor(_npc, _isSlaveLevelup):
	if(_npc.getFetishHolder().getFetishValue(Fetish.FeetplayReceiving) < 0.2):
		return false
	if(_npc.isWearingChastityCage()):
		return true
	if(!_npc.hasReachablePenis()):
		return false
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(!_pc.hasChastityCages()):
		return false
	if(_pc.getFetishHolder().getFetishValue(Fetish.FeetplayGiving) < 0.2):
		return false
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = 1

func onSexEvent(_npc, _event:SexEvent):
	if(_npc.isWearingChastityCage() && _event.getType() == SexEvent.UniqueOrgasm):
		if(_event.getTargetChar() == _npc):
			if(_event.getField("orgasmType", "") == "feet"):
				advanceTask()
				return true
	return false

func getTaskString():
	return "Cum from feet with chastity on"

func getTaskHint(_isSlaveLevelup):
	return "Force them to orgasm from feetplay while they are wearing a chastity cage"
