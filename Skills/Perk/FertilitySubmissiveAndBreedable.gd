extends PerkBase

func _init():
	id = Perk.FertilitySubmissiveAndBreedable
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Submissive and Breedable"

func getVisibleDescription():
	return "You are a famous breeding toy. Doms will fuck you longer and will never pull out of you during vaginal or anal sex."

func getRequiredPerks():
	return [Perk.FertilityDesireToBreed]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilitySubmissiveAndBreedable.png"

