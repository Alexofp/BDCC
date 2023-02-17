extends PerkBase

func _init():
	id = Perk.CumBreathV1
	skillGroup = Skill.CumLover

func getVisibleName():
	return "Fluid Experimenter"

func getVisibleDescription():
	return "Why stop at just eating cum, they are so many other flavors to try. Having different fluids in your belly will provide you with different (or better) buffs."

func getRequiredPerks():
	return [Perk.CumBreath]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/funnel.png"

