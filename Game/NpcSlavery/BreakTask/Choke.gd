extends NpcBreakTaskBase

func _init():
	id = "Choke"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.4,
	}

func getSlutlockWeight() -> float:
	return 0.2

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(_pc.getFetishHolder().getFetishValue(Fetish.Choking) < 0.2):
		return false
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(3, 6, _difficulty)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.Choking):
		if(_event.getTargetChar() == _npc):
			advanceTask()
			return true
	return false

func getTaskString():
	return "Receive choking: "+getProgressString("times")

func getTaskHint(_isSlaveLevelup):
	return "Choke them during sex"

func getNpcOwnerDialogueLines() -> Array:
	return [
		"I want your throat bruised. Get yourself choked properly.",
		"You need to feel owned. Go get choked during sex.",
		"Your air is a privilege. Find someone to choke you until you see stars.",
		"A good fuck includes a hand on your throat. Go get choked.",
		"Show me you can take it. Get choked until you're dizzy.",
	]

func getSexGoalWeightModifier(_sexGoalID:String) -> float:
	if(_sexGoalID == SexGoal.Choke):
		return 3.0
	return 0.0
