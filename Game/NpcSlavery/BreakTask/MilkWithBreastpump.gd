extends NpcBreakTaskBase

func _init():
	id = "MilkWithBreastpump"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.4,
	}

func getNpcOwnerWeight(_npcOwner) -> float:
	return 0.2

func isPossibleFor(_npc, _isSlaveLevelup):
	if(!_npc.hasBodypart(BodypartSlot.Breasts)):
		return false
	if(_npc.hasSmallBreasts()):
		return false
	if(!_npc.isLactating()):
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
		if(_event.getTargetChar() == _npc):
			advanceTask(_event.getField("loadSize", 0.0))
			return true
	return false

func getTaskString():
	return "Milk with breast pump: "+getProgressStringFluids()

func getTaskStringSlutLock():
	return "Get milked with a breast pump: "+getProgressStringFluids()

func getTaskHint(_isSlaveLevelup):
	return "Put a breastpump on them and collect this much milk!"

func getNpcOwnerDialogueLines() -> Array:
	return [
		"Find someone who will get you milked with a breast pump.",
		"Your udders need pumping. Get someone to do it.",
		"I want your tits swollen and milked with a pump by someone.",
		"Go find someone to milk you with a breast pump until you're dry.",
		"Time to milk those tits. Find someone who will do it.",
	]

func getSexGoalWeightModifier(_sexGoalID:String) -> float:
	if(_sexGoalID == SexGoal.MilkWithBreastPump):
		return 3.0
	return 0.0
