extends PerkBase

func _init():
	id = Perk.FertilityBetterOvulationV2
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Breeding overdrive"

func getVisibleDescription():
	return "Your reproductive organs are pushing themselves to the limit for you to bear as many children as possible. \n" \
			+ "Maximum of the egg cells you release during each ovulation phase is increased even further and fertility is improved by 20%"
	
func getRequiredPerks():
	return [Perk.FertilityBetterOvulation]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityBetterOvulationV2.png"

func getBuffs():
	return [
		buff(Buff.OvulationEggsAmountBuff, [100]),
		buff(Buff.FertilityBuff, [20]),
	]
