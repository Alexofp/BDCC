extends PerkBase

func _init():
	id = Perk.BDSMInstantEscape
	skillGroup = Skill.BDSM

func getVisibleName():
	return "Instant gratification"

func getVisibleDescription():
	return "You know exactly where to tug to take that damn gag off. The struggling minigame now has an extra small spot that will unlock the restraint instantly if hit."

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/slavery.png"

