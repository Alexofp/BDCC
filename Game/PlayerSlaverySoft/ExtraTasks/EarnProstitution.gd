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

func getWhoreRepMult(_npc) -> float:
	var rep:ReputationPlaceholder = _npc.getReputation()
	if(!rep):
		return 1.0
	var whoreLevel:int = rep.getRepLevel(RepStat.Whore)
	if(whoreLevel <= 1):
		return 1.0
	
	var finalValue:float = 1.0
	finalValue += sqrt(float(whoreLevel * 2))
	return finalValue

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	var _whoreMult:float = getWhoreRepMult(_npc)
	
	needAmount = scaledRangeWithDifficulty(5, 20, _difficulty*_whoreMult)

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
		"It's time for you to earn your keep. I want you to earn credits by selling your body.",
		"Your body is my business. Get out there and start earning credits by selling your holes.",
		"Time to make you work your body. Start earning credits by whoring your body out.",
		"Put that slutty body to work and earn some credits.",
	]
#
#func getSexGoalWeightModifier(_sexGoalID:String) -> float:
#	if(_sexGoalID == SexGoal.Choke):
#		return 3.0
#	return 0.0
