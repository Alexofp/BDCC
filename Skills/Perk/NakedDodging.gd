extends PerkBase

func _init():
	id = Perk.NakedDodging
	skillGroup = Skill.Exhibitionism

func getVisibleName():
	return "Naked agility"

func getVisibleDescription():
	return "The less clothes on you, the harder for them to grab you! You gain 5% additional dodge chance when you are COMPLETELY naked"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/avoidance.png"

func getBuffs():
	if(!npc.isPlayer()):
		return []
	
	if(npc.isFullyNaked()):
		return [
			buff(Buff.DodgeChanceBuff, [5.0])
		]
	return []
