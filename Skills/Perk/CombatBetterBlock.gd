extends PerkBase

func _init():
	id = Perk.CombatBetterBlock
	skillGroup = Skill.Combat

func getVisibleName():
	return "The wall"

func getVisibleDescription():
	return "You learned how to block with your hands better. You now receive extra 10 armor when blocking an attack. Each 50 armor halves the incoming damage."

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/mansory.png"

func getBuffs():
	return [
		buff(Buff.BlockArmorBuff, [10]),
	]
