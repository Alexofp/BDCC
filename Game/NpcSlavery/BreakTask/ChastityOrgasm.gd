extends NpcBreakTaskBase

func _init():
	id = "ChastityOrgasm"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.25,
	}

func getSlutlockWeight() -> float:
	return 0.2

func isPossibleFor(_npc, _isSlaveLevelup):
	if(_npc.getFetishHolder().getFetishValue(Fetish.AnalSexReceiving) < 0.0):
		return false
	if(!_npc.hasReachablePenis()):
		return false
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(!_pc.hasChastityCages()):
		return false
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(1, 2, _difficulty)

func onSexEvent(_npc, _event:SexEvent):
	if(_npc.isWearingChastityCage() && _event.getType() == SexEvent.Orgasmed):
		if(_event.getTargetChar() == _npc):
			advanceTask()
			return true
	return false

func getTaskString():
	return "Orgasm while chasted: "+getProgressString()

func getTaskHint(_isSlaveLevelup):
	return "Force them to orgasm while they are wearing a chastity cage"

func getSexGoalWeightModifier(_sexGoalID:String) -> float:
	if(_sexGoalID == SexGoal.FuckAnal):
		return 3.0
	if(_sexGoalID == SexGoal.StraponAnal):
		return 3.0
	if(_sexGoalID == SexGoal.FuckVaginal):
		return 2.0
	if(_sexGoalID == SexGoal.StraponVaginal):
		return 2.0
	return 0.0
