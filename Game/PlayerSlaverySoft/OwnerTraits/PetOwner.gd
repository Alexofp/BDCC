extends NpcOwnerTraitBase

func _init():
	id = "PetOwner"

func getVisibleName() -> String:
	return "Pet owner"

func getVisibleDescription() -> String:
	return "The owner likes to treat the slave as their pet."

func getPossiblePCNamesForLevel(_npcOwner, _level:int) -> Array:
	if(_level <= 1):
		return ["pet"]
	if(_level == 2):
		return ["puppy", "kitty"]
	return ["pup"]

func getTraitScore(_npcOwner) -> float:
	var personality:Personality = _npcOwner.getOwner().getPersonality()
	return max(personality.getStat(PersonalityStat.Brat)*1.0, 0.0)-personality.getStat(PersonalityStat.Subby)*1.0

func getTraitExclusiveType() -> String:
	return "pet"

func getEventTags(_npcOwner) -> Dictionary:
	return {
		NOET.Petplay: 3.0,
	}

func getNOMs(_npcOwner) -> Dictionary:
	return {
	}
