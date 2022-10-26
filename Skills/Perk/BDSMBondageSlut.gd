extends PerkBase

func _init():
	id = Perk.BDSMBondageSlut
	skillGroup = Skill.BDSM

func getVisibleName():
	return "Bondage slut"

func getVisibleDescription():
	return "You love any cuffs, blindfolds, ropes and gags! Freedom is achieved through restriction, if you're wearing at least one piece of BDSM equipment you receive 15% less physical damage in combat"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/chained-heart.png"

func getBuffs():
	if(!npc.isPlayer()):
		return []
	
	var pc = npc
	var bdsmItems = pc.getInventory().getEquippedItemsWithTag(ItemTag.BDSMRestraint)
	if(bdsmItems.size() > 0):
		return [
			buff(Buff.ReceivedPhysicalDamageBuff, [-15])
		]
	return []

