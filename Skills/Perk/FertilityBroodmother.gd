extends PerkBase

func _init():
	id = Perk.FertilityBroodmother
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Broodmother"

func getVisibleDescription():
	return "Your womb is ripe for breeding, ready to bear the offspring of anyone dominant enough to claim you. \n"  \
			+ "Pregnancy debuff penalty is reduced by half. \n" \
			+ "Increased cross species compatibility by 20% \n" \
			+ "Fertility reduction medication has significantly less effect on you." #by 70%
	
func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityBroodmother.png"

func getBuffs():
	return [
		buff(Buff.CrossSpeciesCompatibilityBuff, [20]),
	]
