extends PerkBase

func _init():
	id = Perk.CumBreath
	skillGroup = Skill.CumLover

func getVisibleName():
	return "Cum Breath"

func getVisibleDescription():
	return "You're used to the taste of cum and even kinda like it. Fighting while having cum inside your belly will remove [color="+DamageType.getColorString(DamageType.Physical)+"]1 pain[/color] each turn"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/mouth-watering.png"

func processBattleTurn():
	if(!npc.isPlayer()):
		return
	
	var head: BodypartHead = npc.getBodypart(BodypartSlot.Head)
	if(head.isOrificeStuffed()):
		npc.addPain(-1)
