extends PerkBase

func _init():
	id = Perk.FertilityMotherOfTheYear
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Mother of the Year"

func getVisibleDescription():
	return "The corporation has noticed your efforts and wants to reward you!\n" \
			+ "You receive a 'Maternal Glow' status effect for 2 days after giving birth.\n" \
			+ "AlphaCorp will transfer credits to you for each birth (up to 20 per birth)."
	
func getRequiredPerks():
	return [Perk.FertilitySubmissiveAndBreedable]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityMotherOfTheYear.png"

