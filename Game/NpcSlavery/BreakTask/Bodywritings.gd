extends NpcBreakTaskBase

func _init():
	id = "Bodywritings"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.Slut : 1.0,
		SlaveType.Submissive : 1.0,
		SlaveType.All : 0.2,
	}

func getSlutlockWeight() -> float:
	return 0.2

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	return true

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = scaledRangeWithDifficulty(1, 3, _difficulty)
	currentAmount = getBodywritingsAmount(_npc)
	needAmount += currentAmount

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.BodyWritingAdded):
		if(_event.getTargetChar() == _npc):
			advanceTask()
			return true
	return false

func getTaskString():
	return "Bodywritings: "+getProgressString()

func getTaskHint(_isSlaveLevelup):
	return "Draw dirty things on them!"

func getNpcOwnerDialogueLines() -> Array:
	return [
		"Your skin is looking too clean. Go get it marked up.",
		"I want you covered in ink. Get some lewd writings on you.",
		"You're a canvas. Go have someone paint some filthy words on you.",
		"Your body should advertise your purpose. Get it written on.",
		"Go get some bodywritings. Make sure they're appropriately slutty.",
	]

func getBodywritingsAmount(_npc) -> int:
	var theNpc:BaseCharacter = _npc
	if(theNpc.hasEffect(StatusEffect.HasBodyWritings)):
		var theEffect = theNpc.getEffect(StatusEffect.HasBodyWritings)
		return theEffect.getAmount()
	return 0

func getSexGoalWeightModifier(_sexGoalID:String) -> float:
	return 0.0
