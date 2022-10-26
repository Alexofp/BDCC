extends PerkBase

func _init():
	id = Perk.SexLustPassionV2
	skillGroup = Skill.SexSlave

func getVisibleName():
	return "Passion for lust"

func getVisibleDescription():
	return "You love sex! Each time you have oral, vaginal or anal sex you recover 20 [color="+DamageType.getColorString(DamageType.Stamina)+"]stamina[/color] back!"

func getRequiredPerks():
	return [Perk.SexLustPassion]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/cherish.png"

func getBuffs():
	return [
		buff(Buff.StaminaRecoverAfterSexBuff, [20]),
	]
