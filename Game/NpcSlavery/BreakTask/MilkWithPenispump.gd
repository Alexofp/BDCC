extends NpcBreakTaskBase

func _init():
	id = "MilkWithPenispump"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.4,
	}

func isPossibleFor(_npc, _isSlaveLevelup):
	if(!_npc.hasReachablePenis()):
		return false
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(_pc.getInventory().getItemsWithTag(ItemTag.PenisPump).size() <= 0):
		return false
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	var thePenis:BodypartPenis = _npc.getBodypart(BodypartSlot.Penis)
	if(thePenis != null):
		var fluidproduction:CumProduction = thePenis.getFluidProduction()
		if(fluidproduction != null):
			var maxMilk = fluidproduction.getCapacity()
			needAmount = int(maxMilk * (0.3 * min(0.6,(_difficulty-1.0)*0.2)))
			if(needAmount < 10):
				needAmount = 10
		else:
			needAmount = 10
	else:
		needAmount = 10

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.PenisPumpMilked):
		if(_event.getTargetChar() == _npc && _event.targetIsSub()):
			advanceTask(_event.getField("loadSize", 0.0))
			return true
	return false

func getTaskString():
	return "Milk with penis pump: "+getProgressStringFluids()

func getTaskHint(_isSlaveLevelup):
	return "Put a penis pupm on them and collect this much seed!"
