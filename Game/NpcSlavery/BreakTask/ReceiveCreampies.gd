extends NpcBreakTaskBase

func _init():
	id = "ReceiveCreampies"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 1.0,
	}

func isPossibleFor(_npc):
	return true

func isPossibleForPC(_pc, _npc):
	if(_pc.hasReachablePenis()):
		return true
	if(_pc.hasStrapons()):
		return true
	
	return false

func generateFor(_npc, _difficulty = 1.0):
	needAmount = RNG.randi_range(1, 3)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.HoleCreampied || _event.getType() == SexEvent.StraponCreampied):
		if(_event.getTargetChar() == _npc && _event.targetIsSub()):
			if(_event.getField("hole", BodypartSlot.Head) in [BodypartSlot.Vagina, BodypartSlot.Anus]):
				advanceTask()
				return true
	return false

func getTaskString():
	return "Received creampies: "+getProgressString()

func getTaskHint():
	return "Cum inside their pussy or ass. If you don't have a penis, you can use a loaded strapon!"

#func saveData():
#	var data = .saveData()
#
#	return data
#
#func loadData(data):
#	.loadData(data)
#
