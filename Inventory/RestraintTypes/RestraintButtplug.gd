extends RestraintData
class_name RestraintButtplug

func _init():
	npcDodgeDifficultyMod = 1.5
	restraintType = RestraintType.ButtPlug

func canUnlockWithKey():
	return false

func alwaysSavedWhenStruggledOutOf():
	return true

func shouldDoStruggleMinigame(_pc):
	var _handsFree = !_pc.hasBlockedHands()
	if(_handsFree):
		return false
	return .shouldDoStruggleMinigame(_pc)

func doStruggle(_pc, _minigame:MinigameResult):
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
	
	if(failChanceLowScore(_pc, 15, _minigame)):
		text = "{user.name} clenches, attempting to push the buttplug out. Instead, {user.his} efforts cause it to [b]slide deeper[/b], the plug nestling snugly against {user.his} inner walls."
		damage = -0.5
		lust = scaleDamage(10)
	elif(_handsFree && _armsFree):
		text = "Because {user.name}'s hands are free {user.he} {user.verbS('manage')} to just remove the buttplug"
		damage = 1.0
		lust = 10
	elif(_legsFree):
		text = "{user.name} squirms and wiggles {user.his} rear, trying to push the buttplug out of {user.his} butt"
		damage = calcDamage(_pc, _minigame)
		stamina = 5
		lust = scaleDamage(5)
	else:
		text = "{user.name} desperatelly squirms, trying to make the buttplug fall out. Not being able to spread {user.his} legs makes it very hard"
		damage = calcDamage(_pc, _minigame, 0.5)
		stamina = 10
		lust = scaleDamage(5)
	
	if(damage < 1.0):
		if(_pc.isPlayer() && failChance(_pc, 40) && _pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
			if(_pc.getInventory().getEquippedItem(InventorySlot.UnderwearBottom).coversBodypart(BodypartSlot.Anus)):
				text += " The plug presses into your panties."
				damage /= 2.0
				
				if(failChance(_pc, 30)):
					text += " [b]Your panties slipped down, oops.[/b]"
					_pc.getInventory().unequipSlot(InventorySlot.UnderwearBottom)
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func processStruggleTurn(_pc, _isActivelyStruggling):
	if(failChance(_pc, 10) || _isActivelyStruggling):
		return {"text": "The buttplug shifts inside {user.name} while {user.he} {user.verbS('squirm')}", "lust": scaleDamage(5)}
	
	
