extends PerkBase

func _init():
	id = Perk.FertilitySubmissiveAndBreedable
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Submissive and breedable"

func getVisibleDescription():
	return "Others view you as a subservient, perfect toy to please their carnal desires, most noticeably breeding. " \
			+ "Dominant partners may go an extra round or two, and gain a breeder fetish if not having one already."

func getRequiredPerks():
	return [Perk.FertilityDesireToBreed]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilitySubmissiveAndBreedable.png"

