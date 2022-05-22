extends PerkBase

func _init():
	id = Perk.BDSMBetterKeys
	skillGroup = Skill.BDSM

func getVisibleName():
	return "Carefull brat"

func getVisibleDescription():
	return "You learned how to better balance the restraint key when your hands are tied. You get 3 more tries with it when you try to unlock something before you drop it."

func getCost():
	return 1
func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/lock-picking.png"

