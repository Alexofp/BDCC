extends PerkBase

func _init():
	id = Perk.SexDefocusNeverLose
	skillGroup = Skill.SexSlave

func getVisibleName():
	return "Spacing out"

func getVisibleDescription():
	return "You learned to control your horny thoughts, you can NEVER lose from [color="+DamageType.getColorString(DamageType.Lust)+"]lust[/color] damage as long as you are defocused"

func getCost():
	return 1
func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/loveflame.png"

