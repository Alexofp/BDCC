extends NpcOwnerEventBase

var isThreesome:bool = false

func _init():
	id = "WalkiesBark"
	reactsToTags = [E_WALKIES_TO]
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
	playAnimation(StageScene.PuppySexStart, "start", {pc=getRoleID(C_EXTRA1), npcBodyState={naked=true}})
	sayPretext()
	saynn("{npc1.name} approaches you two and crouches in front of you.")
	talkModular(C_EXTRA1, C_PC, "SoftSlaveryWalkiesBark") # What a cute puppy. Can you bark for me?
	
	var barkName:String = RNG.pick([
		"Bark", "Woof", "Bork", "Arf", "Ruff", "Yap",
	])
	var biteName:String = RNG.pick([
		"Bite", "Nom", "Growl", "Grr", "Chomp",
	])
	
	if(RNG.chance(50)):
		addButton(barkName, "Do this", "doBark")
		addButton(biteName, "Do this", "doBite")
	else:
		addButton(biteName, "Do this", "doBite")
		addButton(barkName, "Do this", "doBark")
	
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
	saynn("After the sex, your owner clicks the leash to your collar again.")
	talkModularOwnerToPC("SoftSlaveryParadeFuckOfferGood")
	addInfluenceObey(0.3)
	addContinue("endEvent")

func ownerWon():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), bodyState={leashedBy=getOwnerID()}})
	
	saynn("Your owner clicks the leash to your collar again.")
	talkModularOwnerToPC("SoftSlaveryParadeFuckOfferWon")
	addInfluenceObey(0.2)
	addContinue("endEvent")

func ownerLost():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_EXTRA1)})
	
	saynn("After the fight, you get approached by {npc1.name}.")
	
	isThreesome = RNG.chance(50)
	if(!isThreesome):
		talkModular(C_EXTRA1, C_PC, "SoftSlaveryParadeFuckOfferLostWatch")
		addContinue("startSex", [getRoleID(C_EXTRA1), "pc", SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true}])
	else:
		talkModular(C_EXTRA1, C_PC, "SoftSlaveryParadeFuckOfferLostBoth")
		addContinue("startSex", [getRoleID(C_EXTRA1), ["pc", getOwnerID()], SexType.DefaultSex, {SexMod.DisableDynamicJoiners:true}])
	
func ownerLost_sexResult(_sex:SexEngineResult):
	setState("afterLostSex")

func afterLostSex():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_EXTRA1)})
	
	saynn("{npc.name} is still recovering after that defeat, giving you time to leave.")
	addInfluenceResist(0.8)
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	data["isThreesome"] = isThreesome
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	isThreesome = SAVE.loadVar(_data, "isThreesome", false)
