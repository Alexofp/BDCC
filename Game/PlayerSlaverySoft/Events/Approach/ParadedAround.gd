extends NpcOwnerEventBase

var timesLeft:int = 4
var isFirst:bool = true

#possible unique interactions:
#vendomat - buy an energy drink
#shower - shower together?
#medical - shows you to eliza?
#stocks - teases about stocks?

func _init():
	id = "ParadedAround"
	reactsToTags = [E_APPROACH]
	eventWeight = 1.0
	eventMinLevel = 0
	eventTags = {NOET.ShowingOff:1.0, NOET.BDSM: 0.5}

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("Your owner approaches you while holding a leash.")
	talkModularOwnerToPC("SoftSlaveryParadeAroundStart") #"I wanna parade you around the prison. And show off my {npc.npcSlave}."
	
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
	saynn("After reaching the destination, {npc.name} stops and turns towards you.")
	paradedOutcome()

func paradedOutcome():
	if(timesLeft > 0):
		if(timesLeft == 1):
			talkModularOwnerToPC("SoftSlaveryParadeAroundLast") #"One more time. I want everyone to see you."
		else:
			if(isFirst):
				isFirst = false
				talkModularOwnerToPC("SoftSlaveryParadeAroundFirst") #"Like it so far? We're just getting started."
			else:
				talkModularOwnerToPC("SoftSlaveryParadeAroundMore") #"Good. Let's walk more."
		addButton("Obey", "Allow them to leash you again", "obey")
		addButton("Resist!", "You're not gonna let them do it", "resist")
	else:
		talkModularOwnerToPC("SoftSlaveryParadeAroundFree")
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
	if(_target in ["med_lobbymain"]):
		if(GM.pc.getPainLevel() > 0.4):
			setState("pMedical")

func getDoState() -> String:
	if(state in ["pShower", "pStocksTease", "pCanteen", "pVendomat", "pMedical"]):
		return "paraded"
	return .getDoState()

func pMedical():
	playAnimation(StageScene.Duo, "stand", {npc="eliza"})
	saynn("{npc.name} brings you down to the medical wing.")
	talkOwner("My {npc.npcSlave} isn't doing too well.")
	talkCharID("eliza", "Oh, I have something that can help.")
	saynn("The feline doctor walks up to you and feeds you a little pill!")
	talkCharID("eliza", "This should help~.")
	saynn("Your owner nods and pulls you away from the counter.")
	
	if(onlyOnce()):
		GM.pc.addPain(-100)
		GM.pc.addStamina(150)
		GM.main.addMessage("You feel better!")
	
	paradedOutcome()
	

func pVendomat():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("{npc.name} decides to stop near a vendomat.")
	
	if(onlyOnce()):
		var theItemToGive:String = RNG.pick(["EnergyDrink"])
		if(theItemToGive):
			talkOwner("Thirsty?")
			saynn("{npc.He} {npc.verb('buy')} an energy drink and hands it to you.")
			talkOwner("Enjoy.")
			GM.pc.getInventory().addItem(GlobalRegistry.createItem(theItemToGive))
			GM.main.addMessage("You received an energy drink!")
	saynn("After that, you get pulled away from the vendomat.")
	paradedOutcome()

func pCanteen():
	playAnimation(StageScene.PawJobUnderTable, "start", {pc="pc", npc=getOwnerID()})
	saynn("{npc.name} brings you into a canteen.")
	if(GM.pc.isOralBlocked()):
		talkModularOwnerToPC("SoftSlaveryParadeAroundEatGagged") #"Too bad you can't eat, {npc.npcSlave}. I will though."
		if(!GM.pc.isBlindfolded()):
			saynn("All you can do is watch your owner eat..")
		else:
			saynn("All you can do is.. imagine.. your owner eat..")
	else:
		talkModularOwnerToPC("SoftSlaveryParadeAroundEat") #"Lets take a break. Enjoy your meal, {npc.npcSlave}."
		if(onlyOnce()):
			GM.pc.afterEatingAtCanteen()
		saynn("You and your owner spend time eating together behind one of the canteen tables.")
	paradedOutcome()
	
func pStocksTease():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID()})
	saynn("You stop near the punishment platform that has the row of stocks.")
	talkModularOwnerToPC("SoftSlaveryParadeAroundPlatform")
	paradedOutcome()

func pShower():
	playAnimation(StageScene.ShoweringDuo, "shower", {npc=getOwnerID(), bodyState={naked=true}, npcBodyState={naked=true}})
	saynn("You get brought into the shower room where {npc.name} helps to wash you!")
	talkModularOwnerToPC("SoftSlaveryParadeAroundShower")
	if(onlyOnce()):
		getOwner().afterTakingAShower()
		GM.pc.afterTakingAShower()
	saynn("After that is done, your owner guides you out.")
	
	paradedOutcome()

func saveData() -> Dictionary:
	var data := .saveData()
	data["timesLeft"] = timesLeft
	data["isFirst"] = isFirst
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	timesLeft = SAVE.loadVar(_data, "timesLeft", 3)
	isFirst = SAVE.loadVar(_data, "isFirst", true)
