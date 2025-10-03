extends NpcOwnerEventBase

var curTarget:String = ""
var triedCharIDs:Dictionary = {}

func _init():
	id = "Punish2Gangbang"
	reactsToTags = [E_PUNISH]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1000000.0

func trySubEventStart(_event, _tag:String, _args:Array) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	#if(!npcOwner.shouldPunishStrong()): #TODO: fix back
	#	return false
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
	
	setState("searching")

func invite():
	playAnimation(StageScene.Duo, "stand", {pc=getOwnerID(), npc=getRoleID(C_EXTRA4)})
	
	saynn("APPROACH!")
	talkOwner("DO YOU WANNA HELP ME PUNISH THIS {npc.npcSlave}?")
	
	talk(C_EXTRA4, "SURE.")
	talkOwner("FOLLOW ME THEN.")
	addContinue("add")

func invite_do(_id:String, _args:Array):
	if(_id == "add"):
		var theCharID:String = getRoleID(C_EXTRA4)
		removeRole(C_EXTRA4)
		involveCharID(getFreeSlot(), theCharID)
		canStartSexCheck()

func canStartSexCheck():
	if(roles.has(C_EXTRA1) && roles.has(C_EXTRA2) && roles.has(C_EXTRA3)):
		setState("about_to_sex")
		return
	setState("searching")

func getFreeSlot() -> int:
	if(!roles.has(C_EXTRA1)):
		return C_EXTRA1
	if(!roles.has(C_EXTRA2)):
		return C_EXTRA2
	if(!roles.has(C_EXTRA3)):
		return C_EXTRA3
	return -999

func about_to_sex():
	playAnimation(StageScene.Solo, "stand")
	
	saynn("SEX IS ABOUT TO START.")
	talkOwner("SHOULD BE ENOUGH TO TEACH YOU.")
	
	addContinue("startSex", [ [getRoleID(C_EXTRA1), getRoleID(C_EXTRA2), getRoleID(C_EXTRA3)], "pc" ])

func about_to_sex_sexResult(_sex:SexEngineResult):
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.GivingBirth, "idle")
	
	saynn("THE SEX HAS ENDED!")
	
	addContinue("endEvent")
