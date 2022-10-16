extends RestraintData
class_name RestraintButtplug

func _init():
	npcDodgeDifficultyMod = 0.5

func canUnlockWithKey():
	return false

func alwaysSavedWhenStruggledOutOf():
	return true

func shouldDoStruggleMinigame(_pc):
	var _handsFree = !_pc.hasBlockedHands()
	if(_handsFree):
		return false
	return .shouldDoStruggleMinigame(_pc)

func doStruggle(_pc, _minigame):
	var _handsFree = !_pc.hasBlockedHands()
	var _armsFree = !_pc.hasBoundArms()
	var _legsFree = !_pc.hasBoundLegs()
	var _canSee = !_pc.isBlindfolded()
	var _canBite = !_pc.isBitingBlocked()
	
	var text = "error?"
	var lust = 0
	var pain = 0
	var damage = 0
	var stamina = 0
	
	if(_handsFree):
		text = "Because {user.name}'s hands are free {user.he} {user.verbS('manage')} to just remove the buttplug"
		damage = 1.0
		lust = 10
	elif(_legsFree):
		text = "{user.name} squirms and wiggles {user.his} rear, trying to push the buttplug out of {user.his} butt"
		damage = calcDamage()
		stamina = 5
		lust = scaleDamage(5)
	else:
		text = "{user.name} desperatelly squirms, trying to make the buttplug fall out. Not being able to spread {user.his} legs makes it very hard"
		damage = calcDamage(0.5)
		stamina = 10
		lust = scaleDamage(5)
	
	if(damage < 1.0):
		if(_pc.isPlayer() && failChance(40) && GM.pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
			if(GM.pc.getInventory().getEquippedItem(InventorySlot.UnderwearBottom).coversBodypart(BodypartSlot.Vagina)):
				text += " The plug presses into your panties."
				damage /= 2.0
				
				if(failChance(30)):
					text += " [b]Your panties slipped down, oops.[/b]"
					GM.pc.getInventory().unequipSlot(InventorySlot.UnderwearBottom)
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func processStruggleTurn():
	if(failChance(10)):
		return {"text": "The buttplug shifts inside you while you squirm", "lust": scaleDamage(5)}
	
	
