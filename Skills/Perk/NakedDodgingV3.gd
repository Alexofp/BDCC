extends PerkBase

func _init():
	id = Perk.NakedDodgingV3
	skillGroup = Skill.Exhibitionism

func getVisibleName():
	return "Naked fun"

func getVisibleDescription():
	return "Let's get naked! You gain [b]10%[/b] additional dodge chance when you are COMPLETELY naked"

func getRequiredPerks():
	return [Perk.NakedDodging, Perk.NakedDodgingV2]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/acrobatic.png"

func getBuffs():
	if(!npc.isPlayer()):
		return []
	
	if(npc.isFullyNaked()):
		return [
			buff(Buff.DodgeChanceBuff, [10.0])
		]
	return []
