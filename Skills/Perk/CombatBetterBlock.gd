extends PerkBase

func _init():
	id = Perk.CombatBetterBlock
	skillGroup = Skill.Combat

func getVisibleName():
	return "The fortress"

func getVisibleDescription():
	return "You learned how to block with your hands better, blocking 50% of the physical damage"

func getCost():
	return 1
func getSkillTier():
	return 0

func getPicture():
	return "res://UI/StatusEffectsPanel/images/cuffshands.png"
