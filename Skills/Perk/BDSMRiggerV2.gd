extends PerkBase

func _init():
	id = Perk.BDSMRiggerV2
	skillGroup = Skill.BDSM

func getVisibleName():
	return "Eager Rigger"

func getVisibleDescription():
	return "You got more experienced at tying up people. Your chances at forcing a restraint onto someone are increased by 10% and you also recover 20% of the restraints when the enemy struggles out of them."

func getRequiredPerks():
	return [Perk.BDSMRigger]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/cage.png"

func getBuffs():
	return [
		buff(Buff.RestraintRecoveryBuff, [20]),
		buff(Buff.RestraintForcingSuccessBuff, [10]),
	]
