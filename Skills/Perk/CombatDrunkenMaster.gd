extends PerkBase

func _init():
	id = Perk.CombatDrunkenMaster
	skillGroup = Skill.Combat

func getVisibleName():
	return "Drunken master"

func getVisibleDescription():
	return "Being drunk makes you less predictable. If your intoxication is above 50% you get 10% bonus to your dodging"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/booze.png"

func getBuffs():
	if(npc.has_method("getIntoxicationLevel") && npc.getIntoxicationLevel() >= 0.5):
		return [
			buff(Buff.DodgeChanceBuff, [10]),
		]
	return []
