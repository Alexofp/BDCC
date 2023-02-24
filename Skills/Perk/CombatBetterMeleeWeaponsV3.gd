extends PerkBase

func _init():
	id = Perk.CombatBetterMeleeWeaponsV3
	skillGroup = Skill.Combat

func getVisibleName():
	return "Force of Destruction"

func getVisibleDescription():
	return "You love watching your foes fall before you. And knowing how to wield a weapon sure helps with that. You do [b]50%[/b] more damage with melee weapons."

func getRequiredPerks():
	return [Perk.CombatBetterMeleeWeapons, Perk.CombatBetterMeleeWeaponsV2]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/spiked-bat.png"

func getBuffs():
	return [
		buff(Buff.MeleeDamageBuff, [50]),
	]
