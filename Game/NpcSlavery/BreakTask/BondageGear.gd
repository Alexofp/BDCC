extends NpcBreakTaskBase

var didForce = []

func _init():
	id = "BondageGear"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.Submissive : 1.0,
		SlaveType.All : 0.6,
	}

func getNpcOwnerWeight(_npcOwner) -> float:
	return 0.2

func isPossibleFor(_npc, _isSlaveLevelup):
	if(_npc.getInventory().getEquppedRemovableRestraints().size() >= 3):
		return false
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(_pc.getInventory().getAllCombatUsableRestraints().size() < 3):
		return false
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = Util.mini(3, scaledRangeWithDifficulty(1, 2, _difficulty/2.0))

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.BondageGearForced):
		if(_event.getTargetChar() == _npc):
			var itemID = _event.getField("itemID", "someitem")
			if(!didForce.has(itemID)): # Protection against putting the same restraints on the same npc
				didForce.append(itemID)
				advanceTask()
				return true
	return false

func getTaskString():
	return "Force BDSM gear on: "+getProgressString()

func getTaskStringSlutLock():
	return "Get locked into BDSM gear: "+getProgressString()

func getTaskHint(_isSlaveLevelup):
	return "Put different restraints on them during sex. If there is no space, remove something first."

func getNpcOwnerDialogueLines() -> Array:
	return [
		"I want you locked in gear during your next fuck. Don't be shy.",
		"Your next partner should get to use some toys on you. Get yourself locked up.",
		"You look best when you're restrained. Go get put in some bondage gear.",
		"Find someone to tie you up properly before they use you.",
		"Get yourself into some BDSM gear.",
	]

func getSexGoalWeightModifier(_sexGoalID:String) -> float:
	if(_sexGoalID == SexGoal.TieUp):
		return 3.0
	return 0.0

func saveData():
	var data = .saveData()
	data["didForce"] = didForce
	
	return data

func loadData(data):
	.loadData(data)
	
	didForce = SAVE.loadVar(data, "didForce", [])
