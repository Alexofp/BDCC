extends PerkBase

func _init():
	id = Perk.FertilityBetterOvulation
	skillGroup = Skill.Fertility

func getVisibleName():
	return "Better ovulation"

func getVisibleDescription():
	return "Your body is adapting to produce more offspring. Amount of the egg cells you release during each ovulation phase is increased."

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/Skill_Icon_FertilityBetterOvulation.png"

func getBuffs():

	return [
		buff(Buff.OvulationEggsAmountBuff, [50]),
		buff(Buff.MinOvulationEggsAmountBuff, [3]),
	]
