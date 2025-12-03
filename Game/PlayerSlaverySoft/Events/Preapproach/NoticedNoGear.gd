extends NpcOwnerEventBase

#var creditsAmount:int = 10

func _init():
	id = "NoticedNoGear"
	reactsToTags = [E_APPROACH]
	
	eventWeight = 999995.9

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var theNpcOwner := getNpcOwner()
	if(theNpcOwner.rememberMustHaveOwnerLock() && !theNpcOwner.hasOwnerLock()):
		theNpcOwner.setMustHaveOwnerLock(false)
		return true
	return false

func start():
	playStand()
	saynn("Your owner walks up to you.. and hums.")
	talkModularOwnerToPC("SoftSlaveryNoticedNoGear") #Wait. Didn't I lock something onto you? I'm pretty sure I did. Where is it, {npc.npcSlave}?
	saynn("Looks like {npc.name} isn't happy..")
	talkModularOwnerToPC("SoftSlaveryNoticedNoGear2") #You know what that means. I will have to punish you.
	
	addButton("Accept", "Accept the punishment", "getPunished")
	addButton("Resist!", "Resist the punishment!", "doResist")

func start_do(_id:String, _args:Array):
	if(_id == "getPunished"):
		runPunishment()
	if(_id == "doResist"):
		runResist()

func saveData() -> Dictionary:
	var data := .saveData()
	
	#data["creditsAmount"] = creditsAmount
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	#creditsAmount = SAVE.loadVar(_data, "creditsAmount", 10)
