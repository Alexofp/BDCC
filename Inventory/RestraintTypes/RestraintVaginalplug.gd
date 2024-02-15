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


func defaultStruggle(_pc, _minigame, response):
	if !_pc.hasBoundArms() || !_pc.hasBlockedHands():
		response.text = "Because {user.name}'s hands are free {user.he} just {user.verbS('remove')} the plug."
		response.damage = 1.0
		response.lust += calcStruggleLust(_pc, 2)
		response.skipRest()
	return response

func fatalFailStruggle(_pc, _minigame, response):
	response.text = " {user.name} desperatelly squirms, trying to make the vaginal fall out but it slipped back."
	response.damage = -1.0
	response.lust += calcStruggleLust(_pc, 15)
	
func sucessStruggle(_pc, _minigame, response):

	if !_pc.hasBoundLegs():
		response.text = "{user.name} squirms and wiggles {user.his} rear, trying to push the plug out of {user.his} pussy."
		response.damage = calcDamage(_pc, 1)
		response.lust += calcStruggleLust(_pc, 5)
	else:
		response.text += " {user.name} desperatelly squirms, trying to push the vaginal plug out. Not being able to spread {user.his} legs makes it very hard."
		response.damage = calcDamage(_pc, 0.5)
		response.lust += calcStruggleLust(_pc, 10)
	return response
	
func afterStruggle(_pc, _minigame, response):
	if(response.damage < 1.0 && response.damage > 0.0):
		if(_pc.isPlayer() && failChance(_pc, 40) && GM.pc.getInventory().hasSlotEquipped(InventorySlot.UnderwearBottom)):
			if(_pc.getInventory().getEquippedItem(InventorySlot.UnderwearBottom).coversBodypart(BodypartSlot.Vagina)):
				response.text += " The plug presses into your panties."
				response.damage = response.damage / 2.0
				
				if(failChance(_pc, 30)):
					response.text += " [b]Your panties slipped down, oops.[/b]"
					_pc.getInventory().unequipSlot(InventorySlot.UnderwearBottom)
		
		if(!turnedOn && failChance(_pc, 40)):
			response.text += " {user.name} accidentally turns on the plug inside {user.him} and it starts vibrating!"
			turnedOn = true
		elif(turnedOn && failChance(_pc, 20)):
			response.text += " {user.name} managed to randomly turn off the vibrating plug."
			turnedOn = false

	return response


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
