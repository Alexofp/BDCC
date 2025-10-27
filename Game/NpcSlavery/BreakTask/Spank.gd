extends NpcBreakTaskBase

func _init():
	id = "Spank"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.4,
	}

func getSlutlockWeight() -> float:
	return 0.1

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(3, 6, _difficulty)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.Spanked):
		if(_event.getTargetChar() == _npc):
			advanceTask()
			return true
	return false

func getTaskString():
	return "Receive spanks: "+getProgressString()

func getTaskHint(_isSlaveLevelup):
	return "Spank their butt during sex, any spank will do"

func getNpcOwnerDialogueLines() -> Array:
	return [
		"Your ass needs some color. Go get it reddened.",
		"Find someone to put handprints on your cheeks.",
		"I want your ass sore and marked when I find you.",
		"Your backside deserves some attention. Get it spanked hard.",
		"Go get your ass slapped until it's nice and warm.",
	]

func getSexGoalWeightModifier(_sexGoalID:String) -> float:
	if(_sexGoalID == SexGoal.SpankSub):
		return 3.0
	return 0.0
