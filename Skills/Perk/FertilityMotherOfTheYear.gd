extends PerkBase

func _init():
	id = Perk.FertilityMotherOfTheYear
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Mother of the year"

func getVisibleDescription():
	return "AlphaCorp can't thank you enough for providing more cannon fodder for their global operations. Oh! we meant to say what a nice kids you have we always happy to help them grow and prosper, right! \n" \
			+ "You get a stats boost buff for 2 days after giving birth. \n" \
			+ "You get a credits payment based on the amout of children you provide (up to 20 per birth)."
	
func getRequiredPerks():
	return [Perk.FertilitySubmissiveAndBreedable]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityMotherOfTheYear.png"

