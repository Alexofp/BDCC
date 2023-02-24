extends PerkBase

func _init():
	id = Perk.MilkNoSoreNipples
	skillGroup = Skill.Milking

func getVisibleName():
	return "Moo"

func getVisibleDescription():
	return "Your breasts got so used to milking that they no longer feel sore after it. Milk all you want!"

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/milk-carton.png"

func getBuffs():
	return [
	]
