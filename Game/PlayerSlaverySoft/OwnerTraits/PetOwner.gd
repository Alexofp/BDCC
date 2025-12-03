extends NpcOwnerTraitBase

func _init():
	id = "PetOwner"

func getVisibleName() -> String:
	return "Pet owner"

func getVisibleDescription() -> String:
	return "The owner likes to treat the slave as their pet."

func getPossiblePCNamesForLevel(_npcOwner, _level:int) -> Array:
	if(_level <= 1):
		return ["pet", "mutt", "doggo", "cum-kitten", "creature", "animal", "knotslut"]
	if(_level == 2):
		return ["puppy", "kitty", "knotpocket", "fuckpet", "bitch", "slavepup", "fuckbunny"]
	return ["pup", "kitten", "bunny"]

func getTraitScore(_npcOwner) -> float:
	var personality:Personality = _npcOwner.getOwner().getPersonality()
	var fetishHolder:FetishHolder = _npcOwner.getOwner().getFetishHolder()
	
	var riggingFetish:float = fetishHolder.getFetish(Fetish.Rigging)
	var theBrat:float = max(personality.getStat(PersonalityStat.Brat), 0.0)
	var theSubby:float = personality.getStat(PersonalityStat.Subby)
	
	return clamp(riggingFetish + theBrat - theSubby, 0.2, 1.0)

func getTraitExclusiveType() -> String:
	return "pet"

func getEventTags(_npcOwner) -> Dictionary:
	return {
		NOET.Petplay: 1.0,
	}

func getNOMs(_npcOwner) -> Dictionary:
	return {
	}
