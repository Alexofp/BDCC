extends PerkBase

func _init():
	id = Perk.FertilityPainTolerance
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Pain tolerance"

func getVisibleDescription():
	return "Life in prison is tough especially if you are constantly being pregnant, all the challenges that you have overcome made you much sturdier. \n" \
			+ "Resistance to physical damage +10% \n" \
			+ "Maximum stamina +30" #maybe add as percentage total, like +10% total stamina

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityPainTolerance.png"

func getBuffs():
	return [
		buff(Buff.ReceivedPhysicalDamageBuff, [-10]),
		buff(Buff.MaxStaminaBuff, [30.0]),
	]
