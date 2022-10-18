extends PerkBase

func _init():
	id = Perk.NakedExtraStaminaV2
	skillGroup = Skill.Exhibitionism

func getVisibleName():
	return "Raw power"

func getVisibleDescription():
	return "You can do so much more when the clothes don't get in the way, you get [b]100[/b] extra stamina if you're COMPLETELY naked"

func getRequiredPerks():
	return [Perk.NakedExtraStamina]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/speedometer.png"

func getBuffs():
	if(!npc.isPlayer()):
		return []
	
	if(npc.isFullyNaked()):
		return [
			buff(Buff.MaxStaminaBuff, [100.0])
		]
	return []
