extends NpcOwnerTraitBase

func _init():
	id = "Pimp"

func getVisibleName() -> String:
	return "Pimp"

func getVisibleDescription() -> String:
	return "The owner is way more likely to let others fuck their slave."

func getPossiblePCNamesForLevel(_npcOwner, _level:int) -> Array:
	#var ownerHasVagina:bool = _npcOwner.getOwner().hasVagina()
	if(_level <= 1):
		return ["slut"]
	if(_level <= 2):
		return ["whore"]
	return ["star"]

func getTraitScore(_npcOwner) -> float:
	var personality:Personality = _npcOwner.getOwner().getPersonality()
	return 0.5 + personality.getStat(PersonalityStat.Brat)*1.0 - personality.getStat(PersonalityStat.Naive)*1.0 + max(-personality.getStat(PersonalityStat.Subby)*2.0, 0.0)

func getTraitExclusiveType() -> String:
	return "sharing"

func getEventTags(_npcOwner) -> Dictionary:
	return {
		NOET.Sharing: 1.5,
		NOET.Prostitution: 3.0,
	}

func getNOMs(_npcOwner) -> Dictionary:
	return {
		NOM.Sharing: 1.0,
	}

