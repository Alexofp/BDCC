extends PerkBase

func _init():
	id = Perk.PregnancyBetterOvulationV2
	skillGroup = Skill.Pregnancy

func getVisibleName():
	return "Breeding overdrive"

func getVisibleDescription():
	return "Your reproductive organs are pushing themselves to the limit for you to bear as many children as possible. \n" \
			+ "Maximum of the egg cells you release during each ovulation phase is increased even further and fertility is improved by 20%"
	
func getRequiredPerks():
	return [Perk.PregnancyBetterOvulation]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/Skill_Icon_PregnancyBetterOvulationV2.png"

#func getBuffs():
#	return [
#		buff(Buff.OvulationEggsAmountBuff, [200]),
#		buff(Buff.FertilityBuff, [20])
#	]

