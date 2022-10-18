extends PerkBase

func _init():
	id = Perk.NakedDodgingV2
	skillGroup = Skill.Exhibitionism

func getVisibleName():
	return "Naked ninja"

func getVisibleDescription():
	return "Oops, you forgot your clothes. But that's their problem! You gain 5% additional dodge chance when you are COMPLETELY naked"

func getRequiredPerks():
	return [Perk.NakedDodging]

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/scrum.png"

func getBuffs():
	if(!npc.isPlayer()):
		return []
	
	if(npc.isFullyNaked()):
		return [
			buff(Buff.DodgeChanceBuff, [5.0])
		]
	return []
