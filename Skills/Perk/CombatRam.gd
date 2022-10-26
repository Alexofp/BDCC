extends PerkBase

func _init():
	id = Perk.CombatRam
	skillGroup = Skill.Combat

func getVisibleName():
	return "Ramming"

func getVisibleDescription():
	return "A bull is trapped inside you. You get a special ability to ram enemies and stun them for 50 stamina"

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/whip.png"

func addsAttacks():
	return ["RamPCAttack"]
