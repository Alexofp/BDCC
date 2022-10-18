extends PerkBase

func _init():
	id = Perk.NakedExtraStamina
	skillGroup = Skill.Exhibitionism

func getVisibleName():
	return "Swift rolls"

func getVisibleDescription():
	return "All that clothing only slows you down, you get 50 extra stamina if you're COMPLETELY naked"

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/running.png"

func getBuffs():
	if(!npc.isPlayer()):
		return []
	
	if(npc.isFullyNaked()):
		return [
			buff(Buff.MaxStaminaBuff, [50.0])
		]
	return []
