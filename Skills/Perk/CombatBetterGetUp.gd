extends PerkBase

func _init():
	id = Perk.CombatBetterGetUp
	skillGroup = Skill.Combat

func getVisibleName():
	return "Leap up"

func getVisibleDescription():
	return "With all your combat practice you have learned how to fall properly. You will get up with a 100% chance and can even do it the same turn you were knocked down"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/upgrade.png"
