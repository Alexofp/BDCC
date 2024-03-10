extends NpcBreakTaskBase

func _init():
	id = "FuckThroughRinggag"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.1,
	}

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(!_pc.getInventory().hasItemID("ringgag") && !_npc.getInventory().hasItemIDEquipped("ringgag")):
		return false
	if(!_pc.hasReachablePenis() && !_pc.hasStrapons()):
		return false
	
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = 1

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.HolePenetrated):
		if(_event.getTargetChar() == _npc && _event.targetIsSub()):
			var whichPart = _event.getField("hole", BodypartSlot.Vagina)
			if(whichPart == BodypartSlot.Head):
				if(!_npc.isOralBlocked() && _npc.isGagged()):
					advanceTask()
					return true
	return false

func getTaskString():
	return "Fuck through ring-gag"

func getTaskHint(_isSlaveLevelup):
	return "Put a ring-gag into their mouth and use your penis or strapon to fuck their throat"
