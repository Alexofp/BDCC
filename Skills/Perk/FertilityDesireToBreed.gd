extends PerkBase

func _init():
	id = Perk.FertilityDesireToBreed
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Reckless Desires"

func getVisibleDescription():
	return "Your lustful cravings are so intense that you deliberately try to sabotage condoms, increasing the chance of them breaking during intimate encounters with you by 3 times.\n"\
			+ "Each sabotaged condom sends a rush of adrenaline through you that removes [color="+DamageType.getColorString(DamageType.Physical)+"]20 pain[/color]!"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityDesireToBreed.png"

func getBuffs():
	return []
