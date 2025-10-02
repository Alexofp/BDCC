extends NpcOwnerEventBase

var timesLeft:int = 4

#possible unique interactions:
#vendomat - buy an energy drink
#shower - shower together?
#medical - shows you to eliza?
#stocks - teases about stocks?


func _init():
	id = "ParadedAround"
	reactsToTags = ["aMean"]
	eventWeight = 1.0

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("YOUR OWNER APPROACHES YOU WHILE HOLDING A LEASH!")
	talk(C_OWNER, "I'M GONNA PARADE YOU AROUND!")
	
	addButton("Obey", "Allow them to do it", "obey")
	addButton("Resist!", "You're not gonna let them do it", "resist")

#func shouldEndAfterSubEvent(_args:Array) -> bool:
#	return true

func getParadeTarget() -> String:
	var theResult:String= RNG.pick(LOCS_PARADE)
	while(theResult == getLocation()):
		theResult = RNG.pick(LOCS_PARADE)
	return theResult

func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		setState("paraded")
		timesLeft -= 1
		var theTarget := getParadeTarget()
		runParadeTo(theTarget)
		checkUniqueTarget(theTarget)
	if(_id == "resist"):
		runResist()

func paraded():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID()})
	saynn("YOUR OWNER STOPS AND TURNS TOWARDS YOU.")
	paradedOutcome()

func paradedOutcome():
	if(timesLeft > 0):
		if(timesLeft == 1):
			talkOwner("ONE MORE TIME.")
		else:
			talkOwner("ENJOYING IT SO FAR? GOOD.")
		addButton("Obey", "Allow them to leash you again", "obey")
		addButton("Resist!", "You're not gonna let them do it", "resist")
	else:
		talkOwner("YOU'RE FREE FOR NOW, {npc.npcSlave}.")
		addContinue("endEvent")
	addInfluenceObey(0.25)

func paraded_do(_id:String, _args:Array):
	if(_id == "obey"):
		setState("paraded")
		timesLeft -= 1
		var theTarget := getParadeTarget()
		runParadeTo(theTarget)
		checkUniqueTarget(theTarget)
	if(_id == "resist"):
		runResist()


#Unique stuff
func checkUniqueTarget(_target:String):
	if(RNG.chance(0)):
		return
	if(_target in ["main_shower1", "main_shower2"]):
		setState("pShower")
	if(_target in ["main_punishment_spot"]):
		setState("pStocksTease")
	if(_target in ["hall_canteen"]):
		setState("pCanteen")
	if(_target in ["main_hallroom1"]):
		setState("pVendomat")

func getDoState() -> String:
	if(state in ["pShower", "pStocksTease", "pCanteen", "pVendomat"]):
		return "paraded"
	return .getDoState()

func pVendomat():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("YOUR OWNER STOPS NEAR A VENDOMAT.")
	
	if(onlyOnce()):
		var theItemToGive:String = RNG.pick(["EnergyDrink"])
		if(theItemToGive):
			talkOwner("THIRSTY?")
			saynn("YOUR OWNER BUYS AN ENERGY DRINK AND HANDS IT TO YOU!")
			talkOwner("THERE YOU GO.")
			GM.pc.getInventory().addItem(GlobalRegistry.createItem(theItemToGive))
			GM.main.addMessage("You received an energy drink!")
	saynn("YOU STEP AWAY FROM THE VENDOMAT.")
	paradedOutcome()

func pCanteen():
	playAnimation(StageScene.PawJobUnderTable, "start", {pc="pc", npc=getOwnerID()})
	saynn("YOUR OWNER BRINGS YOU INTO A CANTEEN.")
	if(GM.pc.isOralBlocked()):
		talkOwner("TOO BAD YOU CAN'T EAT ANYTHIHNG, HUH. I WILL THOUGH.")
		saynn("YOU WATCH YOUR OWNER EAT..")
	else:
		talkOwner("LET'S EAT SOMETHING I GUESS.")
		if(onlyOnce()):
			GM.pc.afterEatingAtCanteen()
		saynn("YOU AND YOUR OWNER EAT TOGETHER BEHIND ONE OF THE TABLES.")
	paradedOutcome()
	
func pStocksTease():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID()})
	saynn("YOUR OWNER BRINGS YOU TO THE PUNISHMENT PLATFORM.")
	
	talkOwner("I'M GONNA LOCK YOU INTO ONE OF THESE IF YOU'RE NOT GONNA BEHAVE.")
	
	paradedOutcome()

func pShower():
	playAnimation(StageScene.ShoweringDuo, "shower", {npc=getOwnerID(), bodyState={naked=true}, npcBodyState={naked=true}})
	saynn("YOUR OWNER BRINGS YOU INTO THE SHOWER ROOM AND HELPS TO WASH YOU.")
	talkOwner("CAN'T LET YOU BE STINKY ALL THE TIME.")
	if(onlyOnce()):
		getOwner().afterTakingAShower()
		GM.pc.afterTakingAShower()
	saynn("AFTER THE SHOWER, YOUR OWNER GUIDES YOU OUT.")
	
	paradedOutcome()

func saveData() -> Dictionary:
	var data := .saveData()
	data["timesLeft"] = timesLeft
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	timesLeft = SAVE.loadVar(_data, "timesLeft", 3)
