extends PerkBase

func _init():
	id = Perk.CombatFullStaminaBonus
	skillGroup = Skill.Combat

func getVisibleName():
	return "Power-trip"

func getVisibleDescription():
	return "Fuck feeling tired. Having 100 or more stamina means you do 20% more [color="+DamageType.getColorString(DamageType.Physical)+"]Physical damage[/color]."

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/biceps.png"

func getBuffs():
	if(npc.getStamina() >= 100):
		return [
			buff(Buff.PhysicalDamageBuff, [20]),
		]
	return []
