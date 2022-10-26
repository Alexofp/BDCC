extends PerkBase

func _init():
	id = Perk.SexDefocusNeverLose
	skillGroup = Skill.SexSlave

func getVisibleName():
	return "Spacing out"

func getVisibleDescription():
	return "You learned to control your horny thoughts, while defocusing you will NEVER lose from [color="+DamageType.getColorString(DamageType.Lust)+"]lust[/color] damage as long as you're not at your peak already"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/loveflame.png"

