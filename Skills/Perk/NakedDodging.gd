extends PerkBase

func _init():
	id = Perk.NakedDodging
	skillGroup = Skill.Exhibitionism

func getVisibleName():
	return "Naked agility"

func getVisibleDescription():
	return "You gain (5 + Exhibitionism * 2)% additional dodge chance when you are COMPLETELY naked"

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
			buff(Buff.DodgeChanceBuff, [5.0 + npc.getSkillLevel(Skill.Exhibitionism)*2.0])
		]
	return []
