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
		return ["thing", "possession", "property", "bitch"]
	if(_level <= 2):
		return ["treasure", "prize", "toy"]
	return ["obsession", "love", "sweetie"]

func getTraitScore(_npcOwner) -> float:
	var personality:Personality = _npcOwner.getOwner().getPersonality()
	var theCoward:float = personality.getStat(PersonalityStat.Coward)
	var theNaive:float = personality.getStat(PersonalityStat.Naive)
	var theDommy:float = max(-personality.getStat(PersonalityStat.Subby)*2.0, 0.0)
	
	return clamp(-theCoward - theNaive + theDommy, 0.2, 1.0)

func getTraitExclusiveType() -> String:
	return "sharing"

func getEventWeightMults(_npcOwner) -> Dictionary:
	return {
		NOET.Sharing: 0.01,
	}

func getNOMs(_npcOwner) -> Dictionary:
	return {
		NOM.NoSharing: 1.0,
	}

