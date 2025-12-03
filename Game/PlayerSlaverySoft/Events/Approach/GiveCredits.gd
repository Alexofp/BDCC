extends NpcOwnerEventBase

var creditsAmount:int = 10

func _init():
	id = "GiveCredits"
	reactsToTags = [E_APPROACH]
	
	eventMinLevel = 0
	eventMaxLevel = 2
	eventWeight = 0.4
	eventTagWeightOverrides = {NOET.Mean: 0.6, NOET.Credits: 1.0}

func start():
	if(onlyOnce()):
		creditsAmount = RNG.randi_range(5, 10)
	
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("Your owner approaches you, {npc.his} eyes shine with a need for something.")
	talkOwner(getModularDialogue(C_OWNER, C_PC, "SoftSlaveryGiveCreditsStart").replace("<CREDITS>", str(creditsAmount)+" credits"))
	
	if(GM.pc.getCredits() >= creditsAmount):
		addButton("Obey", "Allow them to take your credits", "obey")
	else:
		addDisabledButton("Obey", "You don't have enough!")
	addButton("Resist", "They are not gonna take your credits", "resist")
	addButton("I'm short", "Say that you don't have enough", "setState", ["amShort"])

func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		if(checkSubEvent("GiveCredits", "You were about to let {npc.name} take your credits..", [])):
			return
		GM.pc.addCredits(-creditsAmount)
		setState("obey")
	if(_id == "resist"):
		runResist()

func start_eventResult(_event, _id:String, _args:Array):
	GM.pc.addCredits(-creditsAmount)
	setState("obey")

func obey():
	saynn("You obey let your owner take your credits.")
	talkModularOwnerToPC("SoftSlaveryGiveCreditsTake")
	addInfluenceObey()
	addContinue("endEvent")

func amShort():
	saynn("You tell your owner that you're short on credits.")
	talkModularOwnerToPC("SoftSlaveryGiveCreditsShort")
	saynn("Looks {npc.he} {npc.isAre} gonna punish you.")
	
	addButton("Accept", "Let the punishment happen", "accept")
	addButton("Resist", "Resist the punishment", "resist")

func amShort_do(_id:String, _args:Array):
	if(_id == "accept"):
		runPunishment()
	if(_id == "resist"):
		runResist()

func amShort_eventResult(_event, _id:String, _args:Array):
	if(_id == "resist"):
		setState("obey")

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["creditsAmount"] = creditsAmount
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	creditsAmount = SAVE.loadVar(_data, "creditsAmount", 10)
