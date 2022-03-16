extends PerkBase

func _init():
	id = Perk.BDSMGagTalk
	skillGroup = Skill.BDSM

func getVisibleName():
	return "Gag speech"

func getVisibleDescription():
	return "You got used to talking through the gag and people can understand you better now, including yourself. You still drool as much though"

func getCost():
	return 1
func getSkillTier():
	return 0

func getPicture():
	return "res://UI/StatusEffectsPanel/images/gag.png"

