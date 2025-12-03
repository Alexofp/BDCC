extends NpcOwnerTraitBase

func _init():
	id = "Pimp"

func getVisibleName() -> String:
	return "Pimp"

func getVisibleDescription() -> String:
	return "The owner is way more likely to let others fuck their slave. The owner is also much more eager to make the slave do prostitution."

func getPossiblePCNamesForLevel(_npcOwner, _level:int) -> Array:
	#var ownerHasVagina:bool = _npcOwner.getOwner().hasVagina()
	if(_level <= 1):
		return ["slut", "hole", "asset", "cunt", "toy", "property", "onahole"]
	if(_level <= 2):
		return ["whore", "fucktoy", "fuckdoll", "cumdump"]
	return ["star", "gem", "doll"]

func getTraitScore(_npcOwner) -> float:
	var personality:Personality = _npcOwner.getOwner().getPersonality()
	var theBrat:float = personality.getStat(PersonalityStat.Brat)
	var theNaive:float = personality.getStat(PersonalityStat.Naive)
	var theDommy:float = max(-personality.getStat(PersonalityStat.Subby)*2.0, 0.0)
	
	return clamp(0.1 + theBrat*0.3 - theNaive + theDommy, 0.2, 1.0)

func getTraitExclusiveType() -> String:
	return "sharing"

func getEventTags(_npcOwner) -> Dictionary:
	return {
		NOET.Sharing: 1.0,
		NOET.Credits: 1.0,
		NOET.Prostitution: 1.0,
	}

func getNOMs(_npcOwner) -> Dictionary:
	return {
		NOM.Sharing: 1.0,
	}

