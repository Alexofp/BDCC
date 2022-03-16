extends PerkBase

func _init():
	id = Perk.SexBetterTease
	skillGroup = Skill.SexSlave

func getVisibleName():
	return "An eye for kinks"

func getVisibleDescription():
	return "You learn opponent's likes/dislikes faster when teasing"

func getCost():
	return 1
func getSkillTier():
	return 0

func getPicture():
	return "res://UI/StatusEffectsPanel/images/mouth.png"

