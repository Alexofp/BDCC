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
	
	talk(C_EXTRA1, "Is {pc.he} free to use?")
	talkOwner("Nope. "+str(RNG.randi_range(1,4)*5)+" credits and you can do whatever you want.")
	
	var attackInsteadChance:float = 30.0 + personality(C_EXTRA1, PersonalityStat.Mean)*30.0 + personality(C_EXTRA1, PersonalityStat.Impatient)*10.0 - personality(C_EXTRA1, PersonalityStat.Coward)*10.0
	if(RNG.chance(attackInsteadChance)):
		saynn("{npc1.name} considers {npc1.his} options.")
		talk(C_EXTRA1, "What if I don't wanna pay?")
		saynn("Your owner furrows {npc.his} brows.")
		talkOwner("Go away then.")
		talk(C_EXTRA1, "I don't wanna do that either.")
		saynn("Ohh, looks like something is about to happen!")
		addContinue("doNpcFight")
	else:
		saynn("{npc1.name} considers {npc1.his} options.")
		talk(C_EXTRA1, "Sure.")
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
	talkOwner("You better obey next time. I'm serious. Thanks for being such a good whore. Enjoy your stay.")
	saynn("{npc.He} {npc.verb('step')} away from the stocks.. without unlocking you.")
	saynn("Looks like you will have to escape on your own..")
	addContinue("startTheStocks")

func afterSex_do(_id:String, _args:Array):
	if(_id == "startTheStocks"):
		startTheStocks()

func thatSucked():
	playAnimation(StageScene.Duo, "shove", {npc=getOwnerID(), npcAction="hurt", pc=getRoleID(C_EXTRA1)})
	saynn("The sex has ended! But {npc1.name} doesn't seem to be satisfied at all.")
	talk(C_EXTRA1, "That sucked. Give me my credits back.")
	talkOwner("That's not how it works. You used my {npc.npcSlave}, now go away.")
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
	talkOwner("Ghrh..")
	addInfluenceResist()
	talk(C_EXTRA1, "Pathetic.")
	saynn("The person is not done yet.. {npc1.he} {npc1.verb('grab')} {npc.name} and {npc1.verb('lock')} {npc.him} into the stocks alongside you!")
	talk(C_EXTRA1, "Much better. Enjoy yourself. Both of you.")
	saynn("And just like that, {npc1.he} {npc1.verb('leave')} you two stuck in the stocks..")
	addContinue("endMakeOwnerStocked")

func ownerLost_do(_id:String, _args:Array):
	if(_id == "endMakeOwnerStocked"):
		var theOwnerID:String = getOwnerID()
		startTheStocks()
		GM.main.IS.startInteraction("InStocks", {inmate=theOwnerID})

func ownerWon():
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getOwnerID(), pc=getRoleID(C_EXTRA1)})
	saynn("Your owner won the fight against {npc1.name}! And so {npc.he} {npc.verb('locks')} the loser into the stocks, alongside you!")
	talkOwner("Learn your place.")
	saynn("{npc.He} {npc.verb('point')} at you.")
	talkOwner("You as well. You are on some very thin ice, {npc.npcSlave}.")
	saynn("{npc.He} {npc.verb('step')} away from the stocks.. without unlocking you.")
	saynn("Looks like you will have to escape on your own..")
	addContinue("startTheStocks")

func ownerWon_do(_id:String, _args:Array):
	if(_id == "startTheStocks"):
		var theCharID:String = getRoleID(C_EXTRA1)
		startTheStocks()
		GM.main.IS.startInteraction("InStocks", {inmate=theCharID})
