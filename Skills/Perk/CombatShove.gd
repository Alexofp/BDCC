extends PerkBase

func _init():
	id = Perk.CombatShove
	skillGroup = Skill.Combat

func getVisibleName():
	return "Shoving"

func getVisibleDescription():
	return "You gain the ability to shove the opponent away with your shoulder, possible making them trip."

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/armor-downgrade.png"

func addsAttacks():
	return ["shoveattack"]
