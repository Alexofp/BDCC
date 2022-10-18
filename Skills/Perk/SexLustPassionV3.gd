extends PerkBase

func _init():
	id = Perk.SexLustPassionV3
	skillGroup = Skill.SexSlave

func getVisibleName():
	return "Addiction for lust"

func getVisibleDescription():
	return "You can't live without sex! Each time you have oral, vaginal or anal sex you recover 50 [color="+DamageType.getColorString(DamageType.Stamina)+"]stamina[/color] back!"

func getRequiredPerks():
	return [Perk.SexLustPassion, Perk.SexLustPassionV2]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/heartwings.png"

func getBuffs():
	return [
		buff(Buff.StaminaRecoverAfterSexBuff, [50]),
	]
