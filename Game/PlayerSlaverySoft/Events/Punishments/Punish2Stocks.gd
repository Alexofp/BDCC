extends NpcOwnerEventBase

var shouldTakeCredits:bool = false

func _init():
	id = "Punish2Stocks"
	reactsToTags = [E_PUNISH_STRONG]

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	return 1.0

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return false
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), bodyState={leashedBy=getOwnerID()}})
	sayPretext()
	saynn("{npc.name} shoves you and then clips a leash to your collar!")
	talkModularOwnerToPC("SoftSlaveryPunishStocks")
	saynn("Your owner is really not in a good mood..")
	
	addContinue("setState", ["inStocks"])
	
func inStocks():
	setLocation(LOC_STOCKS)
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getOwnerID()})
	
	saynn("You get brought to the punishment platform and get locked into the stocks!")
	talkModularOwnerToPC("SoftSlaveryPunishStocksLock")
	addContinue("findSomeone")

func inStocks_do(_id:String, _args:Array):
	if(_id == "findSomeone"):
		var theFriendID := findOwnerFriend(false)
		if(theFriendID.empty()):
			startTheStocks()
			return
		involveCharID(C_EXTRA1, theFriendID)
		setState("foundSomeone")

func foundSomeone():
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getRoleID(C_EXTRA1)})
	saynn("Your owner offers nearby people to punish you.")
	saynn("And soon.. a person approaches you.")
	
	talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryPunishStocksAsk")
	var credAm:int = RNG.randi_range(1,4)*5
	talkOwner(getModularDialogue(C_OWNER, C_EXTRA1, "SoftSlaveryPunishStocksAskNope").replace("<CREDITS>", str(credAm)))
	
	var attackInsteadChance:float = 30.0 + personality(C_EXTRA1, PersonalityStat.Mean)*30.0 + personality(C_EXTRA1, PersonalityStat.Impatient)*10.0 - personality(C_EXTRA1, PersonalityStat.Coward)*10.0
	if(RNG.chance(attackInsteadChance)):
		saynn("{npc1.name} considers {npc1.his} options.")
		talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryPunishStocksAskNoBuy")
		saynn("Your owner furrows {npc.his} brows.")
		talkModularOwnerToPC("SoftSlaveryPunishStocksAskNoBuy2")
		talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryPunishStocksAskNoBuy3")
		saynn("Ohh, looks like something is about to happen!")
		addContinue("doNpcFight")
	else:
		saynn("{npc1.name} considers {npc1.his} options.")
		talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryPunishStocksAskSure")
		saynn("{npc1.He} {npc1.verb('hand')} your owner a credits chip.. and puts {npc1.his} hands on you..")
		addContinue("startSex", [getRoleID(C_EXTRA1), "pc", SexType.StocksSex, {SexMod.DisableDynamicJoiners:true}])

func foundSomeone_do(_id:String, _args:Array):
	if(_id == "doNpcFight"):
		runNpcFight(getOwnerID(), getRoleID(C_EXTRA1))

func foundSomeone_eventResult(_event, _tag:String, _args:Array):
	if(_event.didWin()):
		setSubResult(SUB_CONTINUE)
		setState("ownerWon")
	else:
		shouldTakeCredits = false
		setState("ownerLost")

func foundSomeone_sexResult(_sex:SexEngineResult):
	if(_sex.didSubsWin() || _sex.getAverageDomSatisfaction() < 0.6):
		setState("thatSucked")
	else:
		setState("afterSex")

func startTheStocks():
	endEvent()
	stopRunner()
	
	GM.main.IS.startInteraction("InStocks", {inmate="pc"})

func afterSex():
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getOwnerID()})
	saynn("The sex has ended! {npc1.name} leaves, satisfied.")
	saynn("Your owner leans against the stocks.")
	talkModularOwnerToPC("SoftSlaveryPunishStocksAfterSex")
	saynn("{npc.He} {npc.verb('step')} away from the stocks.. without unlocking you.")
	saynn("Looks like you will have to escape on your own..")
	addContinue("startTheStocks")

func afterSex_do(_id:String, _args:Array):
	if(_id == "startTheStocks"):
		startTheStocks()

func thatSucked():
	playAnimation(StageScene.Duo, "shove", {npc=getOwnerID(), npcAction="hurt", pc=getRoleID(C_EXTRA1)})
	saynn("The sex has ended! But {npc1.name} doesn't seem to be satisfied at all.")
	talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryPunishStocksAfterBadSex")
	talkModularOwnerToPC("SoftSlaveryPunishStocksAfterBadSex2")
	saynn("Your owner gets shoved by the angry person!")
	saynn("Looks like something is gonna happen!")
	addContinue("doNpcFight")
	
func thatSucked_do(_id:String, _args:Array):
	if(_id == "doNpcFight"):
		runNpcFight(getOwnerID(), getRoleID(C_EXTRA1))

func thatSucked_eventResult(_event, _tag:String, _args:Array):
	if(_event.didWin()):
		setSubResult(SUB_CONTINUE)
		setState("ownerWon")
	else:
		shouldTakeCredits = true
		setState("ownerLost")

func ownerLost():
	playAnimation(StageScene.StocksSexOral, "tease", {pc=getOwnerID(), npc=getRoleID(C_EXTRA1)})
	saynn("Your owner lost the fight against {npc1.name}!")
	if(shouldTakeCredits):
		saynn("{npc1.name} reaches to fetch {npc1.his} credits back from {npc.name}.")
	talkOwner(RNG.pick(["Ghrh..", "Fuck..", "Ugh..", "Mghh-.."]))
	addInfluenceResist()
	talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryPunishStocksOwnerLost")
	saynn("The person is not done yet.. {npc1.he} {npc1.verb('grab')} {npc.name} and {npc1.verb('lock')} {npc.him} into the stocks alongside you!")
	
	var willAlsoFuckChance:float = 50.0 + personality(C_EXTRA1, PersonalityStat.Mean)*20.0 - personality(C_EXTRA1, PersonalityStat.Subby)*20.0
	if(!smartChance(willAlsoFuckChance)):
		talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryPunishStocksOwnerLost2")
		saynn("And just like that, {npc1.he} {npc1.verb('leave')} you two stuck in the stocks..")
		addContinue("endMakeOwnerStocked")
	else:
		talkModular(C_EXTRA1, C_OWNER, "SoftSlaveryPunishStocksOwnerLost3")
		saynn("What an ironic turn of events. And you have the front-row seat.")
		addContinue("startSex", [getRoleID(C_EXTRA1), getOwnerID(), SexType.StocksSex, {}])

func ownerLost_do(_id:String, _args:Array):
	if(_id == "endMakeOwnerStocked"):
		var theOwnerID:String = getOwnerID()
		startTheStocks()
		GM.main.IS.startInteraction("InStocks", {inmate=theOwnerID})

func ownerLost_sexResult(_sex:SexEngineResult):
	setState("afterSexDomLost")

func ownerWon():
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getOwnerID(), pc=getRoleID(C_EXTRA1)})
	saynn("Your owner won the fight against {npc1.name}! And so {npc.he} {npc.verb('locks')} the loser into the stocks, alongside you!")
	var willAlsoFuckChance:float = 50.0 + personality(C_OWNER, PersonalityStat.Mean)*20.0 - personality(C_OWNER, PersonalityStat.Subby)*20.0
	if(!smartChance(willAlsoFuckChance)):
		talkModularOwnerToPC("SoftSlaveryPunishStocksOwnerWon")
		saynn("{npc.He} {npc.verb('point')} at you.")
		talkModularOwnerToPC("SoftSlaveryPunishStocksOwnerWon2")
		saynn("{npc.He} {npc.verb('step')} away from the stocks.. without unlocking you.")
		saynn("Looks like you will have to escape on your own..")
		addContinue("startTheStocks")
	else:
		talkModularOwnerToPC("SoftSlaveryPunishStocksOwnerWon3")
		saynn("{npc.He} {npc.verb('point')} at you too.")
		talkModularOwnerToPC("SoftSlaveryPunishStocksOwnerWon4")
		saynn("A free show for you.")
		addContinue("startSex", [getOwnerID(), getRoleID(C_EXTRA1), SexType.StocksSex, {}])
	

func ownerWon_do(_id:String, _args:Array):
	if(_id == "startTheStocks"):
		var theCharID:String = getRoleID(C_EXTRA1)
		startTheStocks()
		GM.main.IS.startInteraction("InStocks", {inmate=theCharID})

func ownerWon_sexResult(_sex:SexEngineResult):
	setState("afterSexDomWon")

func afterSexDomLost():
	playAnimation(StageScene.StocksSexOral, "tease", {pc=getOwnerID(), npc=getRoleID(C_EXTRA1)})
	saynn("The sex has ended.. and it looks like {npc1.name} is not planning to unlock either of you.")
	saynn("Oh well.")
	addContinue("endMakeOwnerStocked")

func afterSexDomLost_do(_id:String, _args:Array):
	if(_id == "endMakeOwnerStocked"):
		var theOwnerID:String = getOwnerID()
		startTheStocks()
		GM.main.IS.startInteraction("InStocks", {inmate=theOwnerID})

func afterSexDomWon():
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getOwnerID(), pc=getRoleID(C_EXTRA1)})
	saynn("The sex has ended.. and it looks like {npc.name} is not planning to unlock either of you.")
	saynn("Oh well.")
	addContinue("endMakeOwnerStocked")

func afterSexDomWon_do(_id:String, _args:Array):
	if(_id == "endMakeOwnerStocked"):
		var theCharID:String = getRoleID(C_EXTRA1)
		startTheStocks()
		GM.main.IS.startInteraction("InStocks", {inmate=theCharID})
