extends PerkBase

func _init():
	id = Perk.BDSMBlindfold
	skillGroup = Skill.BDSM

func getVisibleName():
	return "True sight"

func getVisibleDescription():
	return "You got used to being blindfolded, you learned to not rely on your eyes as much anymore. By using your others senses you can orient yourself in almost any space"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/warlock-eye.png"

