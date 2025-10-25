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
	saynn("YOUR OWNER APPROACHES YOU!")
	
	saynn("LOOKS LIKE YOU ARE ABOUT TO BE PUNISHED..")
	
	addButton("Okay", "Agree to be punished", "startPunish")
	addButton("Resist!", "Resist the punishment", "startResist")

func start_do(_id:String, _args:Array):
	if(_id == "startPunish"):
		runPunishment()
	if(_id == "startResist"):
		runResist()

func allcompleted():
	playStand()
	saynn("YOUR OWNER APPROACHES YOU!")
	saynn("LOOKS LIKE YOU HAVE COMPLETED EVERYTHING. GOOD JOB.")
	addInfluenceObey()
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	#data["creditsAmount"] = creditsAmount
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	#creditsAmount = SAVE.loadVar(_data, "creditsAmount", 10)
