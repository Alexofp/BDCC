extends NpcBreakTaskBase

func _init():
	id = "EarnProstitution"
	taskPools = [NpcTaskPool.Prostitution]

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
	}

func getNpcOwnerWeight(_npcOwner) -> float:
	return 1.0

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(3, 6, _difficulty)

#func onSexEvent(_npc, _event:SexEvent):
#	if(_event.getType() == SexEvent.Choking):
#		if(_event.getTargetChar() == _npc):
#			advanceTask()
#			return true
#	return false

func onInteractionEvent(_eventID:String, _args:Dictionary):
	if(_eventID == "slutPaid"):
		var _howMuch:int = _args["credits"] if _args.has("credits") else 1
		if(_howMuch > 0):
			advanceTask(_howMuch)

func getTaskStringSlutLock():
	return "Earn from prostitution: "+getProgressString("credits")

func getNpcOwnerDialogueLines() -> Array:
	return [
		"PROSTITUION PROSTITUION PROSTITUION.",
	]
#
#func getSexGoalWeightModifier(_sexGoalID:String) -> float:
#	if(_sexGoalID == SexGoal.Choke):
#		return 3.0
#	return 0.0
