extends PerkBase

func _init():
	id = Perk.FertilityShakyLegs
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Shaky legs"

func getVisibleDescription():
	# For now this works as - if you see a 20+ cm dick you go in heat, might make it chance based depending on the length
	return "You are wild about big hard juicy cocks and the thoughts of getting filled and knocked up by them. Seeing one, your legs become all shaky and you are forced into heat."

func getRequiredPerks():
	return [Perk.FertilityDesireToBreed]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityShakyLegs.png"

