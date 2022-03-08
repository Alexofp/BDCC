extends PerkBase

func _init():
	id = Perk.TestPerk
	skillGroup = Skill.Fighting

func getVisibleName():
	return "Test perk"
