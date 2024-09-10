extends RestraintData
class_name RestraintVaginalplug

func _init():
	npcDodgeDifficultyMod = 1.5
	restraintType = RestraintType.VaginalPlug

var turnedOn = false

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
	
	if(failChanceLowScore(_pc, 30, _minigame)):
		text = "{user.name} tries to push the plug out of {user.his} pussy but [b]fails spectacularly[/b], making it slide deeper and kiss the womb entrance!"
		damage = -0.5
		lust = scaleDamage(20)
	elif(_handsFree && _armsFree):
		text = "Because {user.name}'s hands are free {user.he} just {user.verbS('remove')} the plug."
		damage = 1.0
		lust = scaleDamage(10)
	elif(_legsFree):
		text = "{user.name} squirms and wiggles {user.his} rear, trying to push the plug out of {user.his} pussy."
		damage = calcDamage(_pc, _minigame)
		stamina = 5
		lust = scaleDamage(5)
	else:
		text = "{user.name} desperatelly squirms, trying to push the vaginal plug out. Not being able to spread {user.his} legs makes it very hard."
		damage = calcDamage(_pc, _minigame, 0.5)
		stamina = 10
		lust = scaleDamage(5)
	

	if(damage < 1.0):
		if(_pc.isPlayer() && failChance(_pc, 40) && _pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
			if(_pc.getInventory().getEquippedItem(InventorySlot.UnderwearBottom).coversBodypart(BodypartSlot.Vagina)):
				text += " The plug presses into your panties."
				damage /= 2.0
				
				if(failChance(_pc, 30)):
					text += " [b]Your panties slipped down, oops.[/b]"
					_pc.getInventory().unequipSlot(InventorySlot.UnderwearBottom)
		
		if(!turnedOn && failChance(_pc, 40)):
			text += " {user.name} accidentally turns on the plug inside {user.him} and it starts vibrating!"
			turnedOn = true
		elif(turnedOn && failChance(_pc, 20)):
			text += " {user.name} managed to randomly turn off the vibrating plug."
			turnedOn = false
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func processStruggleTurn(_pc, _isActivelyStruggling):
	if(turnedOn):
		return {"text": "The vaginal plug strongly vibrates inside {user.nameS} pussy", "lust": scaleDamage(5)}
	else:
		if(failChance(_pc, 5) || (_isActivelyStruggling && failChance(_pc, 30))):
			turnedOn = true
			return {"text": "[b]The plug inside {user.nameS} pussy accidentally turns on[/b]. It vibrates, bringing {user.him} pleasure!"}
	
	
func resetOnNewDay():
	.resetOnNewDay()
	turnedOn = false

func resetOnNewTry():
	.resetOnNewTry()
	#tightness = 1

func onStruggleRemoval():
	.onStruggleRemoval()
	turnedOn = false

func saveData():
	var data = .saveData()
	
	data["turnedOn"] = turnedOn

	return data
	
func loadData(_data):
	.loadData(_data)
	
	turnedOn = SAVE.loadVar(_data, "turnedOn", false)
