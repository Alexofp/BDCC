extends NpcOwnerEventBase

func _init():
	id = "FuckInStocksExtra"
	reactsToTags = ["FuckInStocks"]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 0.2

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var theNearPawns := getFreePawnsNear(3)
	if(theNearPawns.empty()):
		return false
	var thePickedPawn:CharacterPawn = RNG.pick(theNearPawns)
	involveCharID(C_EXTRA1, thePickedPawn.charID)
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {pc=getRoleID(C_EXTRA1), npc=getRoleID(C_OWNER)})
	sayPretext()
	saynn("{npc1.name} approaches you and your owner!")
	talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryFuckInStocksExtra")
	
	var ownerRejectChance:float = 50.0 + ownerPersonality(PersonalityStat.Mean)*50.0 + 100.0*getOwnerNOM(NOM.NoSharing) - 100.0*getOwnerNOM(NOM.Sharing)
	if(!smartChance(ownerRejectChance)):
		talkModularOwnerToPC("SoftSlaveryFuckInStocksExtraYes")
		saynn("Double trouble..")
		addContinue("setState", ["inStocks"])
	else:
		talkModularOwnerToPC("SoftSlaveryFuckInStocksExtraNo")
		talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryFuckInStocksExtraNo2")
		saynn("Both of them don't wanna back down..")
		addContinue("doNpcFight")

func start_do(_id:String, _args:Array):
	if(_id == "doNpcFight"):
		runEvent("npcFight", "NpcFight", [getRoleID(C_EXTRA1), getOwnerID()])

func start_eventResult(_event, _tag:String, _args:Array):
	if(_event.didNpc1Win()):
		setState("extraWon")
	else:
		setSubResult(SUB_CONTINUE)
		setState("extraLost")

func inStocks():
	setLocation(LOC_STOCKS)
	playAnimation(StageScene.StocksSpitroast, "tease", {npc=getRoleID(C_OWNER), npc2=getRoleID(C_EXTRA1)})
	
	saynn("You obey their touch, bending forward and placing your head onto the lower part of the stocks before they lock you in.")
	addInfluenceObey()
	saynn("Looks like you are about to be used by both of them..")
	addContinue("startSex", [[getRoleID(C_OWNER), getRoleID(C_EXTRA1)], "pc", SexType.StocksSex])
	
func inStocks_sexResult(_sexResult:SexEngineResult):
	setState("afterSex")

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID()})
	saynn("After the sex, your owner unlocks you from the stocks.")
	talkModularOwnerToPC("SoftSlaveryFuckInStocksExtraFree")
	addContinue("endEvent")


func extraLost():
	playAnimation(StageScene.Solo, "stand", {pc=getRoleID(C_OWNER)})
	saynn("After a lost fight, {npc1.name} just fucks off!")
	addInfluenceObey(0.2)
	saynn("Time to continue where you left off..")
	addButton("Submit", "Submit to your owner", "endEvent")

func extraWon():
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getRoleID(C_EXTRA1)})
	saynn("{npc1.name} won! Looks like they're gonna fuck you alone while your owner is watching!")
	addInfluenceResist()
	addContinue("startSex", [getRoleID(C_EXTRA1), "pc", SexType.StocksSex])

func extraWon_sexResult(_sex:SexEngineResult):
	setState("afterSexExtra")

func afterSexExtra():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID()})
	saynn("After the sex, {npc1.name} leaves, allowing your defeated owner to unlock you from the stocks.")
	talkModularOwnerToPC("SoftSlaveryFuckInStocksExtraFreeLost")
	addContinue("endEvent")
