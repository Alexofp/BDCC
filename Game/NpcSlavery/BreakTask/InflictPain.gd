extends NpcBreakTaskBase

func _init():
	id = "InflictPain"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.5,
	}

func getSlutlockWeight() -> float:
	return 0.5

func isPossibleFor(_npc, _isSlaveLevelup):
	if(_npc.getFetishHolder().getFetishValue(Fetish.Masochism) <= 0.0):
		return false
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = Util.mini(100, scaledRangeWithDifficulty(10, 33, _difficulty))

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.PainInflicted):
		if(_event.getTargetChar() == _npc):
			advanceTask(_event.getField("pain", 0))
			return true
	return false

func getTaskString():
	return "Receive pain during sex: "+getProgressString("pain")

func getTaskHint(_isSlaveLevelup):
	return "Make them receive pain during sex"
