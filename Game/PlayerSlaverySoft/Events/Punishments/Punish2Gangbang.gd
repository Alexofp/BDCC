extends NpcOwnerEventBase

var curTarget:String = ""
var triedCharIDs:Dictionary = {}
var giveupTimer:int = 0
var gaveupSearching:bool = false

func _init():
	id = "Punish2Gangbang"
	reactsToTags = [E_PUNISH]
	eventWeight = 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	if(!npcOwner.shouldPunishStrong()):
		return false
	if(GM.main.isVeryLate()):
		return false
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER), bodyState={leashedBy=getOwnerID()}})
	sayPretext()
	saynn("{npc.name} clicks a leash to your collar.")
	talkModularOwnerToPC("SoftSlaveryPunishGB")
	saynn("Looks like your owner wants to find some people to gangbang you with..")
	addContinue("go")
	
func getParadeTarget() -> String:
	var theResult:String= RNG.pick(LOCS_PARADE)
	while(theResult == getLocation()):
		theResult = RNG.pick(LOCS_PARADE)
	return theResult

func start_do(_id:String, _args:Array):
	if(_id == "go"):
		doGo()
	
func searching():
	playAnimation(StageScene.Duo, "walk", {npc=getOwnerID(), npcAction="walk", flipNPC=true, bodyState={leashedBy=getOwnerID()}})
	
	saynn("You are being walked around by a strict leash!")
	
	addButtonAt(6, "Walk", "See where your owner will bring you..", "go")
	addDisabledButtonAt(10, "Leashed", "You are leashed")
	addDisabledButtonAt(11, "Leashed", "You are leashed")
	addDisabledButtonAt(12, "Leashed", "You are leashed")

func searching_do(_id:String, _args:Array):
	if(_id == "go"):
		doGo()

func doGo():
	giveupTimer += 1
	if(curTarget == ""):
		curTarget = getParadeTarget()
	if(goTowards(curTarget)):
		curTarget = getParadeTarget()
	
	var nearbyPeeps := getFreePawnsNear(1)
	for thePawn in nearbyPeeps:
		if(triedCharIDs.has(thePawn.getCharID())):
			continue
		involveCharID(C_EXTRA4, thePawn.getCharID())
		setState("invite")
		return
	
	if(GM.main.isVeryLate() || giveupTimer > 30):
		if(canStartSexAtAll()):
			gaveupSearching = true
			setState("about_to_sex")
		else:
			setState("cancel_sex")
	
	setState("searching")

func cancel_sex():
	playStand(true)
	
	saynn("Eventually, {npc.name} decides to give up.")
	talkModularOwnerToPC("SoftSlaveryPunishGBGiveup")
	addInfluenceResist(0.5)
	saynn("Looks like you got off easy!")
	addContinue("endEvent")

func invite():
	playAnimation(StageScene.Duo, "stand", {pc=getOwnerID(), npc=getRoleID(C_EXTRA4)})
	
	saynn("Your owner approaches someone!")
	talkModularOwnerToPC("SoftSlaveryPunishGBOffer")
	
	#TODO: make these chances depend on personality
	if(RNG.chance(50)):
		saynn("The new person is eyeing you out.")
		talkModular(C_EXTRA4, C_OWNER, "SoftSlaveryPunishGBSure")
		talkModularOwnerToPC("SoftSlaveryPunishGBFollow")
		addContinue("add")
	elif(RNG.chance(33)):
		talkModular(C_EXTRA4, C_OWNER, "SoftSlaveryPunishGBSubOffer")
		if(roles.has(C_EXTRA3)):
			talkModularOwnerToPC("SoftSlaveryPunishGBSubOfferNo")
			talkModular(C_EXTRA4, C_OWNER, "SoftSlaveryPunishGBSubOfferNoAw")
			addContinue("notadd")
		else:
			saynn("{npc.name} tilts {npc.his} head.")
			talkModularOwnerToPC("SoftSlaveryPunishGBSubOfferYes")
			addContinue("addsub")
	else:
		talk(C_EXTRA4, "NO.")
		talkOwner("SCREW YOU THEN.")
		addContinue("notadd")
	

func invite_do(_id:String, _args:Array):
	if(_id == "add"):
		var theCharID:String = getRoleID(C_EXTRA4)
		removeRole(C_EXTRA4)
		involveCharID(getFreeSlot(), theCharID)
		if(canStartSexCheckFull()):
			setState("about_to_sex")
		else:
			setState("searching")
	if(_id == "addsub"):
		var theCharID:String = getRoleID(C_EXTRA4)
		removeRole(C_EXTRA4)
		involveCharID(C_EXTRA3, theCharID)
		if(canStartSexCheckFull()):
			setState("about_to_sex")
		else:
			setState("searching")
	if(_id == "notadd"):
		removeRole(C_EXTRA4)
		setState("searching")

func canStartSexCheckFull() -> bool:
	if(roles.has(C_EXTRA1) && roles.has(C_EXTRA2)):
		return true
	return false

func canStartSexAtAll() -> bool:
	if(roles.has(C_EXTRA1) || roles.has(C_EXTRA2)):
		setState("about_to_sex")
		return true
	setState("searching")
	return false

func getFreeSlot() -> int:
	if(!roles.has(C_EXTRA1)):
		return C_EXTRA1
	if(!roles.has(C_EXTRA2)):
		return C_EXTRA2
	#if(!roles.has(C_EXTRA3)):
	#	return C_EXTRA3
	return -999

func about_to_sex():
	playAnimation(StageScene.Solo, "stand")
	
	saynn("{npc.name} stops. Looks like the gang has been assembled..")
	talkModularOwnerToPC("SoftSlaveryPunishGBStart")
	
	var theDoms:Array = [getOwnerID()]
	if(hasRole(C_EXTRA1)):
		theDoms.append(getRoleID(C_EXTRA1))
	if(hasRole(C_EXTRA2)):
		theDoms.append(getRoleID(C_EXTRA2))
	var theSubs:Array = ["pc"]
	if(hasRole(C_EXTRA3)):
		theSubs.append(getRoleID(C_EXTRA3))
	
	addContinue("startSex", [ theDoms, theSubs ])

func about_to_sex_sexResult(_sex:SexEngineResult):
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.GivingBirth, "idle")
	
	saynn("The gangbang has ended!")
	
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["curTarget"] = curTarget
	data["triedCharIDs"] = triedCharIDs
	data["giveupTimer"] = giveupTimer
	data["gaveupSearching"] = gaveupSearching
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	curTarget = SAVE.loadVar(_data, "curTarget", "")
	triedCharIDs = SAVE.loadVar(_data, "triedCharIDs", {})
	giveupTimer = SAVE.loadVar(_data, "giveupTimer", 0)
	gaveupSearching = SAVE.loadVar(_data, "gaveupSearching", false)
