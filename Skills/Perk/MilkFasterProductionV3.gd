extends PerkBase

func _init():
	id = Perk.MilkFasterProductionV3
	skillGroup = Skill.Milking

func getVisibleName():
	return "Milk factory"

func getVisibleDescription():
	return "Your tits feel so good when they're heavy that it's all that you can focus on. Your udders began producing milk [b]120%[/b] faster"

func getRequiredPerks():
	return [Perk.MilkFasterProduction, Perk.MilkFasterProductionV2]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/udder.png"

func getBuffs():
	return [
		buff(Buff.BreastsMilkProductionBuff, [120]),
	]
