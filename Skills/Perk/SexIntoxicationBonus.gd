extends PerkBase

func _init():
	id = Perk.SexIntoxicationBonus
	skillGroup = Skill.SexSlave

func getVisibleName():
	return "Nymphoholic"

func getVisibleDescription():
	return "Being drunk and having sex is what you love. Preferably at the same time. You get less negative effects from being intoxicated"

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/boba.png"

