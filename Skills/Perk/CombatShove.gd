extends PerkBase

func _init():
	id = Perk.CombatShove
	skillGroup = Skill.Combat

func getVisibleName():
	return "Shoving"

func getVisibleDescription():
	return "You gain the ability to shove the opponent away with your shoulder, possible making them trip."

func getCost():
	return 1
func getSkillTier():
	return 0

func getPicture():
	return "res://UI/StatusEffectsPanel/images/down.png"

func addsAttacks():
	return ["shoveattack"]
