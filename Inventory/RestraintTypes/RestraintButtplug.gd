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


func defaultStruggle(_pc, _minigame, response):
	if !_pc.hasBoundArms() || !_pc.hasBlockedHands():
		response.text = "Because {user.name}'s hands are free {user.he} {user.verbS('manage')} to just remove the buttplug."
		response.damage = 1.0
		response.stamina = 0
		response.skipRest()
	elif !_pc.hasBoundLegs():
		response.text = "{user.name} squirms and wiggles {user.his} rear, trying to push the buttplug out of {user.his} butt."
		response.damage = 1.0
		response.stamina /= 2
		response.skipRest()
	else:
		response.text = " {user.name} desperatelly squirms, trying to make the buttplug fall out. Not being able to spread {user.his} legs makes it very hard."
	return response
		
func fatalFailStruggle(_pc, _minigame, response):
	response.text = " {user.name} desperatelly squirms, trying to make the buttplug fall out but it slipped back."
	response.damage = -1.0
	response.lust += calcStruggleLust(_pc, 5)
	return response
		
func afterStruggle(_pc, _minigame, response):
	if response.damage < 1.0 && response.damage > 0.0:
		if(_pc.isPlayer() && failChance(_pc, 40) && GM.pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
			if(_pc.getInventory().getEquippedItem(InventorySlot.UnderwearBottom).coversBodypart(BodypartSlot.Vagina)):
				response.text += " The plug presses into your panties."
				response.damage /= 2.0

				if(failChance(_pc, 30)):
					response.text += " [b]Your panties slipped down, oops.[/b]"
					_pc.getInventory().unequipSlot(InventorySlot.UnderwearBottom)
	return response
	

func processStruggleTurn(_pc, _isActivelyStruggling):
	if(failChance(_pc, 10) || _isActivelyStruggling):
		return {"text": "The buttplug shifts inside {user.name} while {user.he} {user.verbS('squirm')}", "lust": scaleDamage(5)}
	
	
