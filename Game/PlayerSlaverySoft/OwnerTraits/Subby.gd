extends NpcOwnerTraitBase

func _init():
	id = "Subby"

func getVisibleName() -> String:
	return "Subby"

func getVisibleDescription() -> String:
	return "The owner can occasionally submit to you. They will also not have an 'Aura of dominance' during fights."

func getPossiblePCNamesForLevel(_npcOwner, _level:int) -> Array:
	if(_level <= 1):
		return ["softy", "servant"]
	if(_level == 2):
		return ["light", "cutie"]
	return ["world", "sweetie"]

func getTraitScore(_npcOwner) -> float:
	var personality:Personality = _npcOwner.getOwner().getPersonality()
	var theSubby:float = personality.getStat(PersonalityStat.Subby)
	if(theSubby <= 0.0):
		return 0.0
	return max(theSubby, 0.2)

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

func shouldPreventAuraOfDominance() -> bool:
	return true
