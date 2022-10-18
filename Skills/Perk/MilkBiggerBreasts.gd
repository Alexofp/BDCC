extends PerkBase

func _init():
	id = Perk.MilkBiggerBreasts
	skillGroup = Skill.Milking

func getVisibleName():
	return "Extra milk"

func getVisibleDescription():
	return "You love being milked! Your breasts can get bigger by one additional size when lactating, allowing them to hold more milk"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/augmentation.png"

func getBuffs():
	return [
		buff(Buff.BreastsLactatingSizeLimitBuff, [1]),
	]
