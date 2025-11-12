extends NpcOwnerTraitBase

func _init():
	id = "Asexual"

func getVisibleName() -> String:
	return "Asexual"

func getVisibleDescription() -> String:
	return "The owner is much less likely to have sex with you. Doesn't affect their chance to share you."

func getPossiblePCNamesForLevel(_npcOwner, _level:int) -> Array:
	#var ownerHasVagina:bool = _npcOwner.getOwner().hasVagina()
	if(_level <= 1):
		return ["cupcake"]
	if(_level <= 2):
		return ["servant", "dear"]
	return ["sweetie", "flower","hun"]

func getTraitScore(_npcOwner) -> float:
	var personality:Personality = _npcOwner.getOwner().getPersonality()
	return -personality.getStat(PersonalityStat.Impatient)*1.0

func getTraitExclusiveType() -> String:
	return "ownersex"

func getEventTags(_npcOwner) -> Dictionary:
	return {
		#NOET.Kind: 1.0,
	}

func getEventWeightMults(_npcOwner) -> Dictionary:
	return {
		NOET.OwnerSex: 0.1,
	}

func getNOMs(_npcOwner) -> Dictionary:
	return {
		NOM.Asexual: 1.0,
	}
