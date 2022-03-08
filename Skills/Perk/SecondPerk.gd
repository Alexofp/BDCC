extends PerkBase

func _init():
	id = Perk.SecondPerk
	skillGroup = Skill.Fighting

func getVisibleName():
	return "Second test perk"

func getCost():
	return 5
func getSkillTier():
	return 1

func getPicture():
	return "res://UI/StatusEffectsPanel/images/butt.png"
