extends PerkBase

func _init():
	id = Perk.SexEdging
	skillGroup = Skill.SexSlave

func getVisibleName():
	return "Edging"

func getVisibleDescription():
	return "You love being on the edge. You do 50% more [color="+DamageType.getColorString(DamageType.Lust)+"]lust[/color] damage when your lust level is above 90%"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/leak.png"

func getBuffs():
	if(npc.getLustLevel() >= 0.9):
		return [
			buff(Buff.LustDamageBuff, [50])
		]

	return []
