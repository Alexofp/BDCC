extends RestraintData
class_name RestraintVaginalplug

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
		text = "Because your hands are free you just remove the plug."
		damage = 1.0
		lust = scaleDamage(10)
	elif(_legsFree):
		text = "You squirm and wiggle your rear, trying to push the plug out of your pussy."
		damage = calcDamage()
		stamina = 5
		lust = scaleDamage(5)
	else:
		text = "You desperatelly squirm, trying to push the vaginal plug out. Not being able to spread your legs makes it very hard."
		damage = calcDamage(0.5)
		stamina = 10
		lust = scaleDamage(5)
	

				
	if(damage < 1.0):
		if(failChance(40) && GM.pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
			if(GM.pc.getInventory().getEquippedItem(InventorySlot.UnderwearBottom).coversBodypart(BodypartSlot.Vagina)):
				text += " The plug presses into your panties."
				damage /= 2.0
				
				if(failChance(30)):
					text += " [b]Your panties slipped down, oops.[/b]"
					GM.pc.getInventory().unequipSlot(InventorySlot.UnderwearBottom)
		
		if(!turnedOn && failChance(40)):
			text += " You accidentally turn on the plug inside you and it starts vibrating!"
			turnedOn = true
		elif(turnedOn && failChance(20)):
			text += " You managed to randomly turn off the vibrating plug."
			turnedOn = false
	
	#damage = calcDamage()
	
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func processStruggleTurn():
	if(turnedOn):
		return {"text": "The vaginal plug strongly vibrates inside your pussy", "lust": scaleDamage(5)}
	else:
		if(failChance(5)):
			turnedOn = true
			return {"text": "[b]The plug inside your pussy accidentally turns on[/b]. It vibrates, bringing you pleasure!"}
	
	
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
