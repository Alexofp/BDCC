extends NpcOwnerTraitBase

func _init():
	id = "Mean"

func getVisibleName() -> String:
	return "Mean"

func getVisibleDescription() -> String:
	return "The owner is more likely to do mean things to you."

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
	return 1.0

func getTraitExclusiveType() -> String:
	return "meanness"

func getTraits(_npcOwner) -> Dictionary:
	return {
		NOET.Mean: 3.0,
	}
