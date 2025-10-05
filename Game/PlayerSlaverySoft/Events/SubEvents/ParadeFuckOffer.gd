extends NpcOwnerEventBase

var isThreesome:bool = false

func _init():
	id = "ParadeFuckOffer"
	reactsToTags = [E_PARADE_TO]
	eventWeight = 0.1

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	if(_args.empty()):
		return false
	var thePawns:Array = _args[0]
	if(thePawns.empty()):
		return false
	involveCharID(C_EXTRA1, RNG.pick(thePawns).getCharID())
	return true
	
func start():
	playAnimation(StageScene.Duo, "stand", {pc=getOwnerID(), npc=getRoleID(C_EXTRA1)})
	sayPretext()
	saynn("SOMEONE STOPS YOU.")
	talk(C_EXTRA1, "THAT'S A NICE SLAVE YOU HAVE THERE. CAN I FUCK {pc.him}?")
	
	if(RNG.chance(50)):
		setSubResult(SUB_CONTINUE)
		if(RNG.chance(50)):
			talkOwner("YOU KNOW WHAT? SURE.")
			addContinue("startSex", [getRoleID(C_EXTRA1), "pc", SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true, SexMod.BondageDisabled:true}])
		else:
			isThreesome = true
			talkOwner("YOU KNOW WHAT? SURE. I WILL JOIN.")
			addContinue("startSex", [[getOwnerID(), getRoleID(C_EXTRA1)], "pc", SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true, SexMod.BondageDisabled:true}])
	else:
		talkOwner("GO FUCK YOURSELF INSTEAD.")
		if(RNG.chance(50)):
			setSubResult(SUB_CONTINUE)
			talk(C_EXTRA1, "WHATEVER THEN.")
			addContinue("endEvent")
		else:
			talk(C_EXTRA1, "I GUESS I WILL HAVE TO MESS YOU UP FIRST THEN.")
			saynn("LOOKS LIKE THEY'RE ABOUT TO FIGHT!")
			addContinue("fight")

func start_do(_id:String, _args:Array):
	if(_id == "fight"):
		runNpcFight(getRoleID(C_OWNER), getRoleID(C_EXTRA1))

func start_sexResult(_sex:SexEngineResult):
	setState("afterSex")

func start_eventResult(_event, _tag:String, _args:Array):
	if(_event.didWin()):
		setSubResult(SUB_CONTINUE)
		setState("ownerWon")
	else:
		setState("ownerLost")

func afterSex():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), bodyState={leashedBy=getOwnerID()}})
	saynn("AFTER THE SEX, your owner clicks the leash to your collar again.")
	talkOwner("GOOD LITTLE SLUT.")
	addInfluenceObey(0.3)
	addContinue("endEvent")

func ownerWon():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), bodyState={leashedBy=getOwnerID()}})
	
	saynn("Your owner clicks the leash to your collar again.")
	talkOwner("You're not getting rid of me so easily.")
	addInfluenceObey(0.2)
	addContinue("endEvent")

func ownerLost():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_EXTRA1)})
	
	saynn("YOU GET APPROACHED.")
	
	isThreesome = RNG.chance(50)
	if(!isThreesome):
		talk(C_EXTRA1, "YOU'RE MINE NOW. YOUR WEAK OWNER CAN WATCH.")
		addContinue("startSex", [getRoleID(C_EXTRA1), "pc", SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true}])
	else:
		talk(C_EXTRA1, "YOU'RE MINE NOW. I WILL FUCK BOTH OF YOU.")
		addContinue("startSex", [getRoleID(C_EXTRA1), ["pc", getOwnerID()], SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true}])
	
func ownerLost_sexResult(_sex:SexEngineResult):
	setState("afterLostSex")

func afterLostSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_EXTRA1)})
	
	saynn("YOUR OWNER IS STILL RECOVERING AFTER THAT LOSS, GIVING YOU TIME TO LEAVE.")
	addInfluenceResist(0.5)
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	data["isThreesome"] = isThreesome
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	isThreesome = SAVE.loadVar(_data, "isThreesome", false)
