extends NpcOwnerEventBase

var creditsAmount:int = 10

func _init():
	id = "GiveCredits"
	reactsToTags = ["aMean"]

func start():
	if(onlyOnce()):
		creditsAmount = RNG.randi_range(5, 10)
	
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("CREDITS!")
	talk(C_OWNER, "I'M SHORT! GIVE ME "+str(creditsAmount)+" CREDITS!")
	
	if(GM.pc.getCredits() >= creditsAmount):
		addButton("Obey", "Allow them to take your credits", "obey")
	else:
		addDisabledButton("Obey", "You don't have enough!")
	addButton("Resist", "They are not gonna take your credits", "resist")
	addButton("I'm short", "Say that you don't have enough", "not_enough")

func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		if(checkSubEvent("GiveCredits", "You were about to let {npc.him} take your credits..", [])):
			return
		GM.pc.addCredits(-creditsAmount)
		setState("obey")
	if(_id == "resist"):
		runEvent("resist", "ResistGeneric")

func start_eventResult(_event, _id:String, _args:Array):
	if(_event.shouldEndParent()):
		endEvent()
		return
	if(_id == "resist"):
		setState("obey")

func obey():
	saynn("YOU OBEY AND LET THEM TAKE THE CREDITS!")
	
	talk(C_OWNER, "GOOD {npc.npcSlave}.")
	
	addInfluenceObey()
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["creditsAmount"] = creditsAmount
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	creditsAmount = SAVE.loadVar(_data, "creditsAmount", 10)
