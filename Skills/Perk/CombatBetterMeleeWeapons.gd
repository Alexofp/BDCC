extends PerkBase

func _init():
	id = Perk.CombatBetterMeleeWeapons
	skillGroup = Skill.Combat

func getVisibleName():
	return "Blunt Force"

func getVisibleDescription():
	return "You like using melee weapons to get that extra edge in combat. You do 15% more damage with melee weapons."

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/telescopic-baton.png"

func getBuffs():
	return [
		buff(Buff.MeleeDamageBuff, [15]),
	]
