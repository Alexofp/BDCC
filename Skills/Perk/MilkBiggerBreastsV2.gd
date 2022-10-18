extends PerkBase

func _init():
	id = Perk.MilkBiggerBreastsV2
	skillGroup = Skill.Milking

func getVisibleName():
	return "Mega milk"

func getVisibleDescription():
	return "Bigger breasts means more milk! And you want more milk! Your breasts can get bigger by one additional size when lactating"

func getRequiredPerks():
	return [Perk.MilkBiggerBreasts]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/biggerbreasts.png"

func getBuffs():
	return [
		buff(Buff.BreastsLactatingSizeLimitBuff, [1]),
	]
