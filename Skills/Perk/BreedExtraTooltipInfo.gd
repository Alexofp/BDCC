extends PerkBase

func _init():
	id = Perk.BreedExtraTooltipInfo
	skillGroup = Skill.Breeder
	dungeonWeight = 0.0

func getVisibleName():
	return "Insight of You"

func getVisibleDescription():
	return "Your sense of smell has evolved into an ultimate sixth sense, allowing you to detect the subtle differences in scents that reveal the current phase of a female's menstrual cycle. Bodypart tooltips now show that info. You can also now roughly guess how many cubs/kids someone has in their belly (stacks with the Maternal Intuition perk)."

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/flowers.png"

func getBuffs():
	return [
	]
