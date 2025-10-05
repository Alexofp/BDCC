extends NpcOwnerEventBase

var curTarget:String = ""
var triedCharIDs:Dictionary = {}
var giveupTimer:int = 0
var gaveupSearching:bool = false

func _init():
	id = "Punish2Gangbang"
	reactsToTags = [E_PUNISH]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1000000.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	if(!npcOwner.shouldPunishStrong()): #TODO: fix back
		return false
	if(GM.main.isVeryLate()):
		return false
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER), bodyState={leashedBy=getOwnerID()}})
	sayPretext()
	saynn("GONNA GANGBANG!")
	talk(C_OWNER, "LET'S GO GET SOME PEOPLE!")
	saynn("YOUR OWNER CLICKS A LEASH TO YOUR COLLAR.")
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
	
	saynn("YOU ARE BEING WALKED AROUND!")
	
	addContinue("go")

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
	
	saynn("EVENTUALLY, YOUR OWNER GIVES UP.")
	talkOwner("WHATEVER. YOU'RE LUCKY THERE IS NO ONE TO FUCK YOU.")
	addInfluenceResist(0.5)
	saynn("INDEED, YOU GOT OFF EASY.")
	addContinue("endEvent")

func invite():
	playAnimation(StageScene.Duo, "stand", {pc=getOwnerID(), npc=getRoleID(C_EXTRA4)})
	
	saynn("APPROACH!")
	talkOwner("DO YOU WANNA HELP ME PUNISH THIS {npc.npcSlave}?")
	
	if(RNG.chance(50)):
		talk(C_EXTRA4, "SURE.")
		talkOwner("FOLLOW ME THEN.")
		addContinue("add")
	elif(RNG.chance(33)):
		talk(C_EXTRA4, "UMM.. CAN YOU MAYBE PUNISH ME TOO?")
		if(roles.has(C_EXTRA3)):
			talkOwner("REALLY? WE ALREADY HAVE AN EXTRA SUBBY BITCH.")
			talk(C_EXTRA4, "Aww..")
			addContinue("notadd")
		else:
			talkOwner("I GUESS. FOLLOW US.")
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
	
	saynn("SEX IS ABOUT TO START.")
	talkOwner("SHOULD BE ENOUGH TO TEACH YOU.")
	
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
	
	saynn("THE SEX HAS ENDED!")
	
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
