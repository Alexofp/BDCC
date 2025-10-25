extends NpcOwnerTraitBase

func _init():
	id = "Possessive"

func getVisibleName() -> String:
	return "Possessive"

func getVisibleDescription() -> String:
	return "The owner is way less likely to let others fuck their slave."

func getPossiblePCNamesForLevel(_npcOwner, _level:int) -> Array:
	#var ownerHasVagina:bool = _npcOwner.getOwner().hasVagina()
	if(_level <= 1):
		return ["thing", "possession", "property"]
	if(_level <= 2):
		return ["treasure", "prize"]
	return ["obsession", "love"]

func getTraitScore(_npcOwner) -> float:
	var personality:Personality = _npcOwner.getOwner().getPersonality()
	return 0.5 - personality.getStat(PersonalityStat.Coward)*1.0 - personality.getStat(PersonalityStat.Naive)*1.0 + max(-personality.getStat(PersonalityStat.Subby)*2.0, 0.0)

func getTraitExclusiveType() -> String:
	return "sharing"

func getEventTags(_npcOwner) -> Dictionary:
	return {
		NOET.Sharing: 0.01,
	}

func getNOMs(_npcOwner) -> Dictionary:
	return {
		NOM.NoSharing: 1.0,
	}

