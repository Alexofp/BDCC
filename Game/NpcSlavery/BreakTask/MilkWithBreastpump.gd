extends NpcBreakTaskBase

func _init():
	id = "MilkWithBreastpump"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.4,
	}

func isPossibleFor(_npc, _isSlaveLevelup):
	if(_npc.hasSmallBreasts()):
		return false
	if(!_npc.isLactating()):
		return false
	if(!_npc.hasBodypart(BodypartSlot.Breasts)):
		return false
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(_pc.getInventory().getItemsWithTag(ItemTag.BreastPump).size() <= 0):
		return false
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	var breasts:BodypartBreasts = _npc.getBodypart(BodypartSlot.Breasts)
	if(breasts != null):
		var lactation:Lactation = breasts.getFluidProduction()
		if(lactation != null):
			var maxMilk = lactation.getCapacity()
			needAmount = int(maxMilk * (0.3 * min(0.6,(_difficulty-1.0)*0.2)))
			if(needAmount < 10):
				needAmount = 10
		else:
			needAmount = 50
	else:
		needAmount = 50

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.BreastsPumpMilked):
		if(_event.getTargetChar() == _npc && _event.targetIsSub()):
			advanceTask(_event.getField("loadSize", 0.0))
			return true
	return false

func getTaskString():
	return "Milk with breast pump: "+getProgressStringFluids()

func getTaskHint(_isSlaveLevelup):
	return "Put a breastpump on them and collect this much milk!"
