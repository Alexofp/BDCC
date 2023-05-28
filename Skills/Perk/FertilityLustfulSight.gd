extends PerkBase

func _init():
	id = Perk.FertilityLustfulSight
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Lustful Sight"

func getVisibleDescription():
	return "Not implemented yet"

func getRequiredPerks():
	return [Perk.FertilityShakyLegs]

func getSkillTier():
	return 2
	
func getCost():
	return 999

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityLustfulSight.png"

