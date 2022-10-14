extends PerkBase

func _init():
	id = Perk.BDSMRiggerV3
	skillGroup = Skill.BDSM

func getVisibleName():
	return "Professional Rigger"

func getVisibleDescription():
	return "You're a real pro at making rope bunnies out of people. Even if they never asked for it. Your chances at forcing a restraint onto someone are increased by 20% and you also recover additional 50% of the restraints when the fight ends."

func getRequiredPerks():
	return [Perk.BDSMRigger, Perk.BDSMRiggerV2]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/chained-heart.png"

func getBuffs():
	return [
		buff(Buff.RestraintRecoveryBuff, [50]),
	]
