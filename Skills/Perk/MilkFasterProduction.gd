extends PerkBase

func _init():
	id = Perk.MilkFasterProduction
	skillGroup = Skill.Milking

func getVisibleName():
	return "Milk lover"

func getVisibleDescription():
	return "You are being milked so much that your breasts began producing milk 30% faster"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/drop.png"

func getBuffs():
	return [
		buff(Buff.BreastsMilkProductionBuff, [30]),
	]
