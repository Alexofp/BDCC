extends PerkBase

func _init():
	id = Perk.CombatBetterBlockV3
	skillGroup = Skill.Combat

func getVisibleName():
	return "The fortress"

func getVisibleDescription():
	return "You learned how to block with your hands better. You now receive extra [b]50[/b] armor when blocking an attack"

func getRequiredPerks():
	return [Perk.CombatBetterBlock, Perk.CombatBetterBlockV2]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/armor-upgrade.png"

func getBuffs():
	return [
		buff(Buff.BlockArmorBuff, [50]),
	]
