extends PerkBase

func _init():
	id = Perk.BDSMBlindfold
	skillGroup = Skill.BDSM

func getVisibleName():
	return "True sight"

func getVisibleDescription():
	return "You got used to wearing tight blindfolds that you can't see through. But you don't need eyes to see anymore. By using your others senses you learned to orient yourself in almost any space"

func getCost():
	return 1
func getSkillTier():
	return 0

func getPicture():
	return "res://UI/StatusEffectsPanel/images/blind.png"

