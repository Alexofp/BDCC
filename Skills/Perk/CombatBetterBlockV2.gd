extends PerkBase

func _init():
	id = Perk.CombatBetterBlockV2
	skillGroup = Skill.Combat

func getVisibleName():
	return "Body armor"

func getVisibleDescription():
	return "You learned how to block with your hands better. You now receive extra 20 armor when blocking an attack"

func getRequiredPerks():
	return [Perk.CombatBetterBlock]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/armor.png"

func getBuffs():
	return [
		buff(Buff.BlockArmorBuff, [20]),
	]
