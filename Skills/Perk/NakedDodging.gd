extends PerkBase

func _init():
	id = Perk.NakedDodging
	skillGroup = Skill.Exhibitionism

func getVisibleName():
	return "Naked agility"

func getVisibleDescription():
	return "You gain (5 + endurance/5)% additional dodge chance when you are COMPLETELY naked"

func getCost():
	return 1
func getSkillTier():
	return 0

func getPicture():
	return "res://UI/StatusEffectsPanel/images/nudity.png"

func getBuffs():
	if(!npc.isPlayer()):
		return []
	
	if(npc.isFullyNaked()):
		return [
			buff(Buff.DodgeChanceBuff, [5.0 + npc.getStat(Stat.Endurance)/5.0])
		]
	return []
