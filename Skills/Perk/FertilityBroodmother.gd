extends PerkBase

func _init():
	id = Perk.FertilityBroodmother
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Broodmother"

func getVisibleDescription():
	return "Your womb is ripe for breeding, ready to bear the offspring of anyone dominant enough to claim you. \n"  \
			+ "Pregnancy debuffs are reduced by 50%. \n" \
			+ "Fertility debuffs are reduced by 70%.\n" \
			+ "Cross-species impregnation is now just as likely for you as an impregnation from the same species!" 
	
func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityBroodmother.png"

func getBuffs():
	return [
	]
