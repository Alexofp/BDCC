extends NpcOwnerBase

func _init():
	id = "Mean"

func getVisibleName() -> String:
	return "Mean"

func getPossiblePCNamesForLevel(_level:int) -> Array:
	var ownerHasVagina:bool = getOwner().hasVagina()
	if(_level <= 0):
		return ["slave", "bitch", "fuckdoll", "property"]
	if(_level <= 1):
		return ["cocksucker" if !ownerHasVagina else "cunt-licker", "whore", "cocksleeve" if !ownerHasVagina else "pussy"]
	if(_level == 2):
		return ["fuckmeat", "fucktoy", "playtoy", "painslut"]
	return ["cockslave", "sextoy", "cum-dumpster"]

#doormat toy
