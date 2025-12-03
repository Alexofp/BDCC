extends NpcOwnerTraitBase

func _init():
	id = "Taskmaster"

func getVisibleName() -> String:
	return "Taskmaster"

func getVisibleDescription() -> String:
	return "The owner really likes to give their slave tasks to do."

func getPossiblePCNamesForLevel(_npcOwner, _level:int) -> Array:
	#var ownerHasVagina:bool = _npcOwner.getOwner().hasVagina()
	if(_level <= 1):
		return ["servant"]
	if(_level <= 2):
		return ["asset"]
	return ["proxy"]

func getTraitScore(_npcOwner) -> float:
	var personality:Personality = _npcOwner.getOwner().getPersonality()
	var fetishHolder:FetishHolder = _npcOwner.getOwner().getFetishHolder()
	
	var theNaive:float = personality.getStat(PersonalityStat.Naive)
	var theImpatient:float = personality.getStat(PersonalityStat.Impatient)
	var theRigging:float = max(fetishHolder.getFetish(Fetish.Rigging), 0.0)
	
	return clamp(theRigging - theNaive - theImpatient, 0.1, 1.0)

func getTraitExclusiveType() -> String:
	return "tasks"

func getEventTags(_npcOwner) -> Dictionary:
	return {
		NOET.Tasks: 1.0,
	}

