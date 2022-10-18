extends PerkBase

func _init():
	id = Perk.SexBetterDefocus
	skillGroup = Skill.SexSlave

func getVisibleName():
	return "Meditation"

func getVisibleDescription():
	return "Having so much experience you now know how to better distance yourself from enemy's [color="+DamageType.getColorString(DamageType.Lust)+"]lust[/color] attacks, defocussing will now half the amount of lust you receive"

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/distraction.png"

func getBuffs():
	return [
		buff(Buff.DefocusArmorBuff, [30]),
	]
