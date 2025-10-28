extends NpcOwnerEventBase

#var creditsAmount:int = 10

func _init():
	id = "CheckTask"
	reactsToTags = [E_APPROACH]
	
	eventWeight = 999999.9

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var theNpcOwner := getNpcOwner()
	if(!theNpcOwner.hasGivenPCTasks()):
		return false
	
	if(theNpcOwner.isEverythingCompleted()):
		setState("allcompleted")
	
	theNpcOwner.clearTasks()
	
	return true

func start():
	playStand()
	saynn("You get swiftly approached by {npc.name}, your owner! And they don't look very happy.")
	talkModularOwnerToPC("SoftSlaveryCheckTaskFail")
	saynn("Looks like you are about to be punished..")
	
	addButton("Okay", "Agree to be punished", "startPunish")
	addButton("Resist!", "Resist the punishment", "startResist")

func start_do(_id:String, _args:Array):
	if(_id == "startPunish"):
		runPunishment()
	if(_id == "startResist"):
		runResist()

func allcompleted():
	playStand()
	saynn("You get approached by {npc.name}, your owner.")
	talkModularOwnerToPC("SoftSlaveryCheckTaskGood")
	saynn("{npc.He} {npc.verb('seem')} satisfied.")
	addInfluenceObey()
	talkModularOwnerToPC("SoftSlaveryCheckTaskGood2")
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	#data["creditsAmount"] = creditsAmount
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	#creditsAmount = SAVE.loadVar(_data, "creditsAmount", 10)
