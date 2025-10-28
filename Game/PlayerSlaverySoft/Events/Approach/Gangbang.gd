extends NpcOwnerEventBase

var curTarget:String = ""
var triedCharIDs:Dictionary = {}
var giveupTimer:int = 0
var gaveupSearching:bool = false
var sexSatisfaction:float = 1.0
var earnedCredits:int = 0

func _init():
	id = "Gangbang"
	reactsToTags = [E_APPROACH]
	eventWeight = 0.5
	eventTags = {NOET.OwnerSex: 1.0, NOET.Sharing: 1.0}

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	if(GM.main.isVeryLate()):
		return false
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER), bodyState={leashedBy=getOwnerID()}})
	sayPretext()
	saynn("{npc.name} clicks a leash to your collar.")
	talkModularOwnerToPC("SoftSlaveryGB")
	saynn("Looks like your owner wants to find some people to gangbang you with..")
	addButton("Obey", "Let it happen", "go")
	addButton("Resist", "You're not gonna let it happen!", "resist")
	if(canSetLimits()):
		addButton("Yes, but..", "Obey but put limits to what your owner can do to you during sex", "yesbut")
	else:
		addDisabledButton("Yes, but..", "Your relationship hasn't progressed far enough for you to be able to set limits")

func getParadeTarget() -> String:
	var theResult:String= RNG.pick(LOCS_PARADE)
	while(theResult == getLocation()):
		theResult = RNG.pick(LOCS_PARADE)
	return theResult

func start_do(_id:String, _args:Array):
	if(_id == "go"):
		doGo()
	if(_id == "resist"):
		runResist()
	if(_id == "yesbut"):
		runEvent("yesbut", "SetOwnerLimits")
		#setState("obey")

func start_eventResult(_event, _id:String, _args:Array):
	if(_id == "yesbut"):
		doGo()

func searching():
	playAnimation(StageScene.Duo, "walk", {npc=getOwnerID(), npcAction="walk", flipNPC=true, bodyState={leashedBy=getOwnerID()}})
	
	saynn("You are being walked around by a leash while {npc.name} is looking for people to gangbang you with!")
	
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
	talkModularOwnerToPC("SoftSlaveryGBGiveup")
	addInfluenceResist(0.5)
	saynn("Looks like the gangbang is cancelled..")
	addContinue("endEvent")

func invite():
	playAnimation(StageScene.Duo, "stand", {pc=getOwnerID(), npc=getRoleID(C_EXTRA4)})
	
	saynn("Your owner approaches someone!")
	talkModularOwnerToPC("SoftSlaveryGBOffer")
	
	var agreeChance:float = 50.0 - personality(C_EXTRA4, PersonalityStat.Subby)*20.0 + personality(C_EXTRA4, PersonalityStat.Mean)*30.0
	var subInsteadChance:float = 10.0 + personality(C_EXTRA4, PersonalityStat.Subby)*200.0
	
	if(smartChance(agreeChance)):
		saynn("The new person is eyeing you out.")
		talkModular(C_EXTRA4, C_OWNER, "SoftSlaveryGBSure")
		talkModularOwnerToPC("SoftSlaveryGBFollow")
		addContinue("add")
	elif(smartChance(subInsteadChance)):
		talkModular(C_EXTRA4, C_OWNER, "SoftSlaveryGBSubOffer")
		if(roles.has(C_EXTRA3)):
			talkModularOwnerToPC("SoftSlaveryGBSubOfferNo")
			talkModular(C_EXTRA4, C_OWNER, "SoftSlaveryGBSubOfferNoAw")
			addContinue("notadd")
		else:
			saynn("{npc.name} tilts {npc.his} head.")
			talkModularOwnerToPC("SoftSlaveryGBSubOfferYes")
			addContinue("addsub")
	else:
		talkModular(C_EXTRA4, C_OWNER, "SoftSlaveryGBNo")
		talkModularOwnerToPC("SoftSlaveryGBNoReact")
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
	playAnimation(StageScene.GivingBirth, "idle")
	
	saynn("{npc.name} stops. Looks like the gang has been assembled..")
	talkModularOwnerToPC("SoftSlaveryGBStart")
	
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
	sexSatisfaction = _sex.getAverageDomSatisfaction()
	earnedCredits = 0
	if(_sex.didSubsWin()):
		earnedCredits = RNG.randi_range(5, 10)
	elif(sexSatisfaction < 0.4):
		earnedCredits = RNG.randi_range(5, 10)
	else:
		var minExtra:float = pow(sexSatisfaction, 0.3)*10.0
		var maxExtra:float = pow(sexSatisfaction, 0.5)*20.0
		earnedCredits = RNG.randi_range(5, 10) + int(RNG.randf_range(minExtra, maxExtra))
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.GivingBirth, "idle")
	saynn("The gangbang has ended!")
	talkModularOwnerToPC("SoftSlaveryGBEnd")
	addInfluenceObey()
	saynn("Your owner hands you a chip with "+str(earnedCredits)+" credits!")
	
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["curTarget"] = curTarget
	data["triedCharIDs"] = triedCharIDs
	data["giveupTimer"] = giveupTimer
	data["gaveupSearching"] = gaveupSearching
	data["sexSatisfaction"] = sexSatisfaction
	data["earnedCredits"] = earnedCredits
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	curTarget = SAVE.loadVar(_data, "curTarget", "")
	triedCharIDs = SAVE.loadVar(_data, "triedCharIDs", {})
	giveupTimer = SAVE.loadVar(_data, "giveupTimer", 0)
	gaveupSearching = SAVE.loadVar(_data, "gaveupSearching", false)
	sexSatisfaction = SAVE.loadVar(_data, "sexSatisfaction", 1.0)
	earnedCredits = SAVE.loadVar(_data, "earnedCredits", 0)
