extends PerkBase

func _init():
	id = Perk.MilkFasterProductionV2
	skillGroup = Skill.Milking

func getVisibleName():
	return "Milk enthusiast"

func getVisibleDescription():
	return "You're a very milky cow. Your proud girls began producing milk 50% faster"

func getRequiredPerks():
	return [Perk.MilkFasterProduction]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/breast-pump.png"

func getBuffs():
	return [
		buff(Buff.BreastsMilkProductionBuff, [50]),
	]
