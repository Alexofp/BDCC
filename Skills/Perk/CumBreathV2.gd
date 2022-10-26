extends PerkBase

func _init():
	id = Perk.CumBreathV2
	skillGroup = Skill.CumLover

func getVisibleName():
	return "Cum Addict"

func getVisibleDescription():
	return "Your body adapted to use cum as a source of protein. Fighting while having cum inside your belly OR ass will additionally remove [color="+DamageType.getColorString(DamageType.Physical)+"]4 pain[/color] each turn"

func getRequiredPerks():
	return [Perk.CumBreath]

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/addiction.png"

func processBattleTurn():
	if(!npc.isPlayer()):
		return
	
	var head: BodypartHead = npc.getBodypart(BodypartSlot.Head)
	if(head.isOrificeStuffed()):
		npc.addPain(-4)
	var anus: BodypartAnus = npc.getBodypart(BodypartSlot.Anus)
	if(anus.isOrificeStuffed()):
		npc.addPain(-4)
