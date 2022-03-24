extends RestraintData
class_name RestraintButtplug

func doStruggle(_pc):
	var _handsFree = !_pc.hasBlockedHands()
	var _armsFree = !_pc.hasBoundArms()
	var _legsFree = !_pc.hasBoundLegs()
	var _canSee = !_pc.isBlindfolded()
	var _canBite = !_pc.isGagged()
	
	var text = "error?"
	var lust = 0
	var pain = 0
	var damage = 0
	var stamina = 0
	
	if(_handsFree):
		text = "Because your hands are free you manage to just remove the buttplug"
		damage = 1.0
		lust = 10
	elif(_legsFree):
		text = "You squirm and wiggle your rear, trying to push the buttplug out of your butt"
		damage = calcDamage()
		stamina = 5
		lust = 5
	else:
		text = "You desperatelly squirm, trying to make the buttplug fall out. Not being able to spread your legs makes it very hard"
		damage = calcDamage(0.5)
		stamina = 10
		lust = 5
	
	if(damage < 1.0):
		if(failChance(40) && GM.pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
			if(GM.pc.getInventory().getEquippedItem(InventorySlot.UnderwearBottom).coversBodypart(BodypartSlot.Vagina)):
				text += " The plug presses into your panties."
				damage /= 2.0
				
				if(failChance(30)):
					text += " [b]Your panties slipped down, oops.[/b]"
					GM.pc.getInventory().unequipSlot(InventorySlot.UnderwearBottom)
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func processStruggleTurn():
	if(failChance(10)):
		return {"text": "The buttplug shifts inside you while you squirm", "lust": 5}
	
	
