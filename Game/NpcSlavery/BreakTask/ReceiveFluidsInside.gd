extends NpcBreakTaskBase

func _init():
	id = "ReceiveFluidsInside"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 1.0,
	}

func getSlutlockWeight() -> float:
	return 1.0

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(_pc.hasReachablePenis()):
		return true
	if(_pc.hasVagina()):
		return true
	if(_pc.hasStrapons()):
		return true
	if(_isSlaveLevelup):
		return true
	
	return false

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(50, 100, _difficulty)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.HoleCreampied || _event.getType() == SexEvent.StraponCreampied || _event.getType() == SexEvent.HoleSpitted):
		if(_event.getTargetChar() == _npc):
			if(_event.getField("hole", BodypartSlot.Head) in [BodypartSlot.Vagina, BodypartSlot.Anus]):
				advanceTask(_event.getField("loadSize", 0))
				return true
	return false

func getTaskString():
	return "Receive cum inside: "+getProgressStringFluids()

func getTaskHint(_isSlaveLevelup):
	return "Cum or spit inside their pussy/ass."

func getNpcOwnerDialogueLines() -> Array:
	return [
		"I want to see someone's seed dripping from your hole"+("s" if GM.pc.hasVagina() else "")+".",
		"Find someone to leave their load deep inside you.",
		"I want you leaking someone's cum.",
		"Your insides should be swimming in fresh cum.",
		"Find a cock to pump its seed deep into you.",
	]

func getSexGoalWeightModifier(_sexGoalID:String) -> float:
	if(_sexGoalID == SexGoal.FuckAnal):
		return 3.0
	if(_sexGoalID == SexGoal.FuckVaginal):
		return 3.0
	return 0.0
