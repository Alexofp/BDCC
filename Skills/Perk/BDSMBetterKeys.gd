extends PerkBase

func _init():
	id = Perk.BDSMBetterKeys
	skillGroup = Skill.BDSM

func getVisibleName():
	return "Careful brat"

func getVisibleDescription():
	return "You learned how to better balance the restraint key when your hands are tied. You get 2 more tries with it when you try to unlock something before you drop it."

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/lock-picking.png"

