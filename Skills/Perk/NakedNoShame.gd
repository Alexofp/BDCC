extends PerkBase

func _init():
	id = Perk.NakedNoShame
	skillGroup = Skill.Exhibitionism

func getVisibleName():
	return "Naked'n'proud"

func getVisibleDescription():
	return "You no longer feel ashamed when you don't wear any clothes, you are comfortable being naked"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/nudity.png"

