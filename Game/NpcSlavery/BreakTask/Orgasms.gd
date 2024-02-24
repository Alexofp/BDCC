extends NpcBreakTaskBase

func _init():
	id = "Orgasms"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 1.0,
	}

func isPossibleFor(_npc):
	return true

func generateFor(_npc, _difficulty = 1.0):
	needAmount = round(RNG.randi_range(2, 4)*_difficulty)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.Orgasmed):
		if(_event.getTargetChar() == _npc && _event.targetIsSub()):
			advanceTask()
			return true
	return false

func getTaskString():
	return "Forced orgasms: "+getProgressString()

func getTaskHint():
	return "Force them to orgasm during sex"

#func saveData():
#	var data = .saveData()
#
#	return data
#
#func loadData(data):
#	.loadData(data)
#
