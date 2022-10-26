extends PerkBase

func _init():
	id = Perk.CumSloppySeconds
	skillGroup = Skill.CumLover

func getVisibleName():
	return "Sloppy seconds"

func getVisibleDescription():
	return "You love being used as a cum dumpster by different people."

func getMoreDescription():
	return "If you have cum inside your pussy/ass from 2+ different people you get a +20% bonus to your [color="+DamageType.getColorString(DamageType.Lust)+"]Lust damage[/color]."

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/heartburn.png"

func getBuffs():
	if(!npc.isPlayer()):
		return
	
	var ass = npc.getBodypart(BodypartSlot.Anus)
	var assOrifice = ass.getOrifice()
	var uniqueUsersAss = assOrifice.getUniqueCharactersAmount()
	
	var uniqueUsersPussy = 0
	if(npc.hasBodypart(BodypartSlot.Vagina)):
		var pussy = npc.getBodypart(BodypartSlot.Vagina)
		var pussyOrifice = pussy.getOrifice()
		uniqueUsersPussy = pussyOrifice.getUniqueCharactersAmount()
		
	if(uniqueUsersAss > 1 || uniqueUsersPussy > 1):
		return [
			buff(Buff.LustDamageBuff, [20]),
		]
	return []
