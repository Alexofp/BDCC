extends NpcOwnerTraitBase

func _init():
	id = "Subby"

func getVisibleName() -> String:
	return "Subby"

func getVisibleDescription() -> String:
	return "The owner can occasionally submit to you."

func getPossiblePCNamesForLevel(_npcOwner, _level:int) -> Array:
	if(_level <= 1):
		return ["softy", "servant"]
	if(_level == 2):
		return ["light"]
	return ["world"]

func getTraitScore(_npcOwner) -> float:
	var personality:Personality = _npcOwner.getOwner().getPersonality()
	return personality.getStat(PersonalityStat.Subby)*2.0

func getTraitExclusiveType() -> String:
	return "subbyness"

func getEventTags(_npcOwner) -> Dictionary:
	return {
		NOET.SubbyOwner: 1.0,
	}

func getNOMs(_npcOwner) -> Dictionary:
	return {
		NOM.Subby: 1.0,
	}

func getTalkActions(_npcOwner, _event) -> Array:
	return [
		talkAction("Fuck owner", "(Subby trait) Ask if your owner wants to be fucked!", "subby_fuckowner")
	]

func doTalkAction(_npcOwner, _event, _actionID:String, _args:Array):
	if(_actionID == "subby_fuckowner"):
		_event.runEvent("", "AskFuckOwner")
