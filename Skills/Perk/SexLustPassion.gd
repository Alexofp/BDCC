extends PerkBase

func _init():
	id = Perk.SexLustPassion
	skillGroup = Skill.SexSlave

func getVisibleName():
	return "Passion for lust"

func getVisibleDescription():
	return "Having sex doesn't tire you. Instead, each orgasm gives you some [color="+DamageType.getColorString(DamageType.Stamina)+"]stamina[/color] back!"

func getCost():
	return 1
func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/hearts.png"

