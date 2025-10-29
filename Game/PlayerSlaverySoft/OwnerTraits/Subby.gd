extends NpcOwnerTraitBase

func _init():
	id = "Subby"

func getVisibleName() -> String:
	return "Subby"

func getVisibleDescription() -> String:
	return "The owner is more likely to occasionally submit to you."

func getPossiblePCNamesForLevel(_npcOwner, _level:int) -> Array:
	if(_level <= 1):
		return ["softy"]
	if(_level == 2):
		return ["light"]
	return ["world"]

func getTraitScore(_npcOwner) -> float:
	var personality:Personality = _npcOwner.getOwner().getPersonality()
	return personality.getStat(PersonalityStat.Subby)*2.0

func getTraitExclusiveType() -> String:
	return "subbyness"

func getEventTags(_npcOwner) -> Dictionary:
	return {
		NOET.SubbyOwner: 3.0,
	}

func getNOMs(_npcOwner) -> Dictionary:
	return {
		NOM.Subby: 1.0,
	}
