extends PerkBase

func _init():
	id = Perk.FertilityBetterOvulationV3
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Anomalous pregnancy"

func getVisibleDescription():
	return "Ongoing pregnancy doesn't stop you from ovulating or getting into heat. Get more chances to fill your womb with the litter up to its absolute limit."

func getRequiredPerks():
	return [Perk.FertilityBetterOvulationV2]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityBetterOvulationV3.png"

