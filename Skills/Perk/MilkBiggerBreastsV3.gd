extends PerkBase

func _init():
	id = Perk.MilkBiggerBreastsV3
	skillGroup = Skill.Milking

func getVisibleName():
	return "Giga milk"

func getVisibleDescription():
	return "Milking feels so good! Your udders must produce more milk! Milk, milk, milk! Your breasts can get bigger by [b]TWO[/b] additional sizes when lactating"

func getRequiredPerks():
	return [Perk.MilkBiggerBreasts, Perk.MilkBiggerBreastsV2]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/verybigbreast.png"

func getBuffs():
	return [
		buff(Buff.BreastsLactatingSizeLimitBuff, [2]),
	]
