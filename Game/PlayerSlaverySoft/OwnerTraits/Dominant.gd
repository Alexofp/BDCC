extends NpcOwnerTraitBase

func _init():
	id = "Dominant"

func getVisibleName() -> String:
	return "Dominant"

func getVisibleDescription() -> String:
	return "The owner is extra dominant and will be more eager to lock the slave up."

func getPossiblePCNamesForLevel(_npcOwner, _level:int) -> Array:
	if(_level <= 1):
		return ["sub", "pet", "toy", "property", "slut", "doll"]
	if(_level == 2):
		return ["servant", "dear", "sweetie", "princess", "painslut", "fuckdoll", "cumslut"]
	return ["submissive", "love", "kitten", "cutie", "cupcake", "brat"]

func getTraitScore(_npcOwner) -> float:
	var personality:Personality = _npcOwner.getOwner().getPersonality()
	var theSubby:float = personality.getStat(PersonalityStat.Subby)
	if(theSubby > 0.0):
		return 0.0
	return max(-theSubby, 0.2)

func getTraitExclusiveType() -> String:
	return "subbyness"

func getEventTags(_npcOwner) -> Dictionary:
	return {
		NOET.BDSM: 1.0,
		NOET.Bondage: 1.0,
		NOET.Tasks: 0.5,
	}

func getNOMs(_npcOwner) -> Dictionary:
	return {
		NOM.Dominant: 1.0,
	}
