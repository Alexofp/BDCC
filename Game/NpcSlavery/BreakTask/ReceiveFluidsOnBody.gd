extends NpcBreakTaskBase

func _init():
	id = "ReceiveFluidsOnBody"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 1.0,
	}

func isPossibleFor(_npc):
	return true

func isPossibleForPC(_pc, _npc):
	if(_pc.hasReachablePenis()):
		return true
	if(_pc.hasVagina()):
		return true
	if(_pc.hasStrapons()):
		return true
	
	return false

func generateFor(_npc, _difficulty = 1.0):
	needAmount = RNG.randi_range(100, 500)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.ReceivedFluidsOnBody):
		if(_event.getTargetChar() == _npc && _event.targetIsSub()):
			currentAmount += _event.getField("loadSize", 0)
			if(currentAmount > needAmount):
				completeSelf()
			return true
	return false

func getTaskString():
	return "Cum on body: "+str(Util.roundF(currentAmount, 1))+"/"+str(Util.roundF(needAmount, 1))+"ml"

func getTaskHint():
	return "Cum or squirt on them"

#func saveData():
#	var data = .saveData()
#
#	return data
#
#func loadData(data):
#	.loadData(data)
#
