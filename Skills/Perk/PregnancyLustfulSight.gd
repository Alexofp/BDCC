extends PerkBase

func _init():
	id = Perk.PregnancyLustfulSight
	skillGroup = Skill.Pregnancy

func getVisibleName():
	return "Lustful Sight"

func getVisibleDescription():
	return "Not implemented yet"

func getRequiredPerks():
	return [Perk.PregnancyShakyLegs]

func getSkillTier():
	return 2
	
func getCost():
	return 999

func getPicture():
	return "res://Images/Perks/Skill_Icon_PregnancyLustfulSight.png"

