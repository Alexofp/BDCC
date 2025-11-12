extends NpcOwnerEventBase

var sexSatisfaction:float = 1.0
var instantSurrender:bool = false

func _init():
	id = "JealousOwner"
	reactsToTags = ["fuck"]
	eventWeight = 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var allFrens:Array= _event.getFreeOwnerIDsNearby(true, _context)
	if(allFrens.empty()):
		if(RNG.chance(_event.getNearbyCheckAllChance())):
			allFrens = _event.getFreeOwnerIDs(true, _context)
			if(allFrens.empty()):
				return false
		else:
			return false
	
	var randomFrenID:String = RNG.pick(allFrens)
	involveCharID(C_EXTRA1, randomFrenID)
	if(smartChance(-20.0 + ownerPersonality(PersonalityStat.Coward)*80.0)):
		instantSurrender = true
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {pc=getRoleID(C_EXTRA1), npc=getOwnerID()})
	sayPretext()
	saynn("Someone approaches you two.. someone who you know.. and who knows you.")
	talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryFuckJealousStart")
	talkModular(C_OWNER, C_EXTRA1, "SoftSlaveryFuckJealousFight")
	
	saynn("Looks like your two owners are about to fight..")
	
	if(instantSurrender):
		addContinue("setState", ["ownerLost"])
	else:
		addContinue("fight")

func start_do(_id:String, _args:Array):
	if(_id == "fight"):
		runNpcFight(getOwnerID(), getRoleID(C_EXTRA1))

func start_eventResult(_event, _tag:String, _args:Array):
	if(_event.didWin()):
		setSubResult(SUB_CONTINUE)
		setState("ownerWon")
	else:
		setState("ownerLost")

func ownerWon():
	playAnimation(StageScene.SexStart, "start", {pc=getRoleID(C_EXTRA1), npc=getOwnerID()})
	
	saynn("Your owner has won.. against your other owner!")
	talkModularOwnerToPC("SoftSlaveryFuckJealousOwnerWon")
	addInfluenceObey(0.2)
	saynn("Your second owner grunts.")
	talk(C_EXTRA1, "Whatever.")
	
	var haveSexChance:float = 50.0 + ownerPersonality(PersonalityStat.Mean)*50.0
	haveSexChance -= getOwnerNOM(NOM.Asexual)*200.0
	if(smartChance(haveSexChance)):
		saynn("As the defeated owner tries to leave, {npc.name} grabs and holds {npc1.him} still!")
		talkModularOwnerToPC("SoftSlaveryFuckJealousOwnerWonFuck")
		addInfluenceObey()
		addButton("Continue", "See what happens next", "startSex", [getOwnerID(), ["pc", getRoleID(C_EXTRA1)], SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true}])
	else:
		saynn("As the defeated owner leaves, {npc.name} directs {npc.his} attention back at you..")
		addButton("Submit", "See what happens next..", "endEvent")

func ownerWon_sexResult(_sexResult:SexEngineResult):
	setSubResult(SUB_END)
	setState("afterSex")

func ownerLost():
	if(!instantSurrender):
		playAnimation(StageScene.SexStart, "start", {npc=getRoleID(C_EXTRA1), pc=getOwnerID()})
		saynn("Your owner has lost.. to your other owner!")
	else:
		playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_EXTRA1), pc=getOwnerID()})
		saynn("No fight happens though!")

	saynn("{npc1.name} begins approaching {npc.name}..")
	talkModularOwnerToPC("SoftSlaveryFuckJealousOwnerLostOffer")
	saynn("Your second owner stops for a second.")
	talkModularOwnerToPC("SoftSlaveryFuckJealousOwnerLostOffer2")
	saynn("Your second owner hums while eyeing you out.")
	if(smartChance(50.0 - personality(C_EXTRA1, PersonalityStat.Mean)*50.0)):
		talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryFuckJealousOwnerLostOfferAgree")
		saynn("Both of them grab you..")
		talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryFuckJealousOwnerLostOfferAgree2")
		addButton("Continue", "See what happens next", "startSex", [[getOwnerID(), getRoleID(C_EXTRA1)], "pc", SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true}])
	else:
		talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryFuckJealousOwnerLostOfferNope")
		addInfluenceResist()
		saynn("{npc1.He} {npc1.verb('grab')} the both of you..")
		addButton("Continue", "See what happens next", "startSex", [getRoleID(C_EXTRA1), ["pc", getOwnerID()], SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true}])

func ownerLost_sexResult(_sexResult:SexEngineResult):
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("The sex has ended!")
	saynn("Your other owner finally leaves you alone.")
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["sexSatisfaction"] = sexSatisfaction
	data["instantSurrender"] = instantSurrender
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	sexSatisfaction = SAVE.loadVar(_data, "sexSatisfaction", 1.0)
	instantSurrender = SAVE.loadVar(_data, "instantSurrender", false)
