extends PerkBase

func _init():
	id = Perk.BDSMCollector
	skillGroup = Skill.BDSM

func getVisibleName():
	return "Gear Collector"

func getVisibleDescription():
	return "You learned how to struggle out of restraints without breaking them, you can now store them for later use"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/locked-heart.png"

