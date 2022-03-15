extends PerkBase

func _init():
	id = Perk.TestPerk
	skillGroup = Skill.Combat

func getVisibleName():
	return "Test perk"

func addsAttacks():
	return ["shoveattack"]
