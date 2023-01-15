extends PerkBase

func _init():
	id = Perk.CombatBetterMeleeWeaponsV2
	skillGroup = Skill.Combat

func getVisibleName():
	return "Force Multiplier"

func getVisibleDescription():
	return "Why use your fists when the prison is littered with all those contraband weapons. You do 35% more damage with melee weapons."

func getRequiredPerks():
	return [Perk.CombatBetterMeleeWeapons]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/stiletto.png"

func getBuffs():
	return [
		buff(Buff.MeleeDamageBuff, [35]),
	]
