extends PerkBase

func _init():
	id = Perk.StartMaleInfertility
	skillGroup = Skill.Start

func getVisibleName():
	return "Male Infertily"

func getVisibleDescription():
	return "Your cum can't get anyone pregnant no matter what"

func getCost():
	return 0
func getSkillTier():
	return 0

func getPicture():
	return "res://UI/StatusEffectsPanel/images/cuffshands.png"

