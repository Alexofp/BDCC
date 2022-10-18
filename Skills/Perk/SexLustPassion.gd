extends PerkBase

func _init():
	id = Perk.SexLustPassion
	skillGroup = Skill.SexSlave

func getVisibleName():
	return "Interest for lust"

func getVisibleDescription():
	return "Having sex doesn't tire you. Instead, each time you have oral, vaginal or anal sex you recover 10 [color="+DamageType.getColorString(DamageType.Stamina)+"]stamina[/color] back!"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/hearts.png"

func getBuffs():
	return [
		buff(Buff.StaminaRecoverAfterSexBuff, [10]),
	]
