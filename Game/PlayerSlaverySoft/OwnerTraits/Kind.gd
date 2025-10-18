extends NpcOwnerTraitBase

func _init():
	id = "Kind"

func getVisibleName() -> String:
	return "Kind"

func getVisibleDescription() -> String:
	return "The owner is less likely to do mean things to you."

func getPossiblePCNamesForLevel(_npcOwner, _level:int) -> Array:
	var ownerHasVagina:bool = _npcOwner.getOwner().hasVagina()
	if(_level <= 0):
		return ["bitch", "fuckdoll", "property"]
	if(_level <= 1):
		return ["cocksucker" if !ownerHasVagina else "cunt-licker", "whore", "cocksleeve" if !ownerHasVagina else "pussy"]
	if(_level == 2):
		return ["fuckmeat", "fucktoy", "playtoy", "painslut"]
	return ["cockslave", "sextoy", "cum-dumpster", "paintoy"]

func getTraitScore(_npcOwner) -> float:
	var personality:Personality = _npcOwner.getOwner().getPersonality()
	return -personality.getStat(PersonalityStat.Mean)*2.0

func getTraitExclusiveType() -> String:
	return "meanness"

func getEventTags(_npcOwner) -> Dictionary:
	return {
		NOET.Mean: 0.2,
	}
