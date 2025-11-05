extends NpcOwnerEventBase

var walkiesEvent:String = ""
var npcWantsSex:bool = false
var ownerProtectedPC:bool = false

func _init():
	id = "WalkiesSmallEvent"
	reactsToTags = [E_WALKIES_TO]
	eventWeight = 0.1

func trySubEventStart(_event, _tag:String, _args:Array, _context:Dictionary) -> bool:
	if(_args.empty()):
		return false
	var thePawns:Array = _args[0]
	if(thePawns.empty()):
		return false
	involveCharID(C_EXTRA1, RNG.pick(thePawns).getCharID())
	walkiesEvent = RNG.pick([
		"bark", "pet",
	])
	return true
	
func start():
	playAnimation(StageScene.PuppySexStart, "start", {pc=getRoleID(C_EXTRA1), npcBodyState={naked=true}})
	sayPretext()
	saynn("{npc1.name} approaches you two and crouches in front of you.")

	var biteName:String = RNG.pick([
		"Bite", "Nom", "Grrr", "Grr", "Chomp",
	])
	
	if(walkiesEvent == "bark"):
		talkModular(C_EXTRA1, C_PC, "SoftSlaveryWalkiesBark") # What a cute puppy. Can you bark for me?
		
		var barkName:String = RNG.pick([
			"Bark", "Woof", "Bork", "Arf", "Ruff", "Yap",
		])
		
		if(RNG.chance(50)):
			addButton(barkName, "Do this", "doObey")
			addButton(biteName, "Do this", "doBite")
		else:
			addButton(biteName, "Do this", "doBite")
			addButton(barkName, "Do this", "doObey")
	else:
		talkModular(C_EXTRA1, C_PC, "SoftSlaveryWalkiesPet") # What a cute puppy. Can I pat you?
		if(RNG.chance(50)):
			addButton("Allow", "Do this", "doObey")
			addButton(biteName, "Do this", "doBite")
		else:
			addButton(biteName, "Do this", "doBite")
			addButton("Allow", "Do this", "doObey")
	
func start_do(_id:String, _args:Array):
	if(_id == "doObey"):
		var sexAskChance:float = 50.0
		if(RNG.chance(sexAskChance)):
			npcWantsSex = true
			var ownerNopeChance:float = 50.0 - getOwnerNOM(NOM.Sharing)*50.0 + getOwnerNOM(NOM.NoSharing)*100.0
			if(RNG.chance(ownerNopeChance)):
				ownerProtectedPC = true
			
		setState("youObey")
		setSubResult(SUB_CONTINUE)
	if(_id == "doBite"):
		doTheBite()
	if(_id == "fight"):
		runNpcFight(getRoleID(C_OWNER), getRoleID(C_EXTRA1))

func doTheBite():
	var chanceFight:float = 30.0
	if(RNG.chance(chanceFight)):
		setState("biteFight")
	else:
		setState("biteWhatever")
		setSubResult(SUB_CONTINUE)

func youObey():
	playAnimation(StageScene.PuppySexStart, "pet", {pc=getRoleID(C_EXTRA1), npcBodyState={naked=true}})
	if(walkiesEvent == "bark"):
		saynn("You let out a happy bark!")
		talk(C_PC, RNG.pick([
			"Bark! Bark!",
			"Woof! Bark! Arff-f.",
		]))
		saynn("In return, the person starts petting you!")
		talkModular(C_EXTRA1, C_PC, "SoftSlaveryWalkiesGoodPuppy") # Good puppy.
		addInfluenceObey(0.2)
	else:
		saynn("You stand still and present your head, allowing the person to start patting you!")
		talkModular(C_EXTRA1, C_PC, "SoftSlaveryWalkiesGoodPuppy") # Good puppy.
		saynn("Feels good..")
		addInfluenceObey(0.2)
	
	if(npcWantsSex):
		saynn("It looks like the person wants more than just to pat you though..")
		talkModular(C_EXTRA1, C_PC, "SoftSlaveryWalkiesGoodPuppySex") # Are you gonna be a good puppy and let me fuck you?
		if(ownerProtectedPC):
			saynn("Before too long, your owner steps in and shoves {npc1.him} back.")
			talkModularOwnerToPC("SoftSlaveryWalkiesBiteProtect") # This is my {npc.npcSlave}. Fuck off.
			saynn("The person rolls {npc1.his} eyes and walks away.")
			addContinue("endEvent")
		else:
			saynn("Looks like your owner doesn't mind..")
			addButton("Sex", "Let them fuck you", "startSex", [getRoleID(C_EXTRA1), "pc", SexType.BitchsuitSex, {SexMod.DisableDynamicJoiners:true,SexMod.BondageDisabled:true,SexMod.SubsStartNaked:true}])
			addButton("Bite!", "Bite them for trying to do this", "bite")
	else:
		saynn("After that small encounter, you continue on your way..")
		addContinue("endEvent")

func youObey_sexResult(_sex:SexEngineResult):
	setState("afterSex")

func youObey_do(_id:String, _args:Array):
	if(_id == "bite"):
		doTheBite()

func biteWhatever():
	playAnimation(StageScene.PuppyDuo, "hurt", {pc=getRoleID(C_EXTRA1), npcBodyState={naked=true}})
	saynn("Suddenly, you ludge forward and bite the person!")
	talkModular(C_EXTRA1, C_PC, "SoftSlaveryWalkiesBiteBad") # Ow. Control your mut better.
	saynn("{npc1.He} {npc1.verb('grumble')}.. but decide against doing anything back.")
	saynn("With that, you continue on your way..")
	addContinue("endEvent")

func biteFight():
	playAnimation(StageScene.PuppyDuo, "hurt", {pc=getRoleID(C_EXTRA1), npcBodyState={naked=true}})
	saynn("Suddenly, you ludge forward and bite the person!")
	talkModular(C_EXTRA1, C_PC, "SoftSlaveryWalkiesBiteAttack") # Ow. I will make you suffer for this.
	saynn("Oops.. The person yanks you around by the collar.. but then your owner pushes {npc1.him} back!")
	talkModularOwnerToPC("SoftSlaveryWalkiesBiteProtect") # This is my {npc.npcSlave}. Fuck off.
	saynn("Looks like they're gonna fight because of you!")
	addContinue("fight")

func biteFight_do(_id:String, _args:Array):
	if(_id == "fight"):
		runNpcFight(getRoleID(C_OWNER), getRoleID(C_EXTRA1))

#func start_sexResult(_sex:SexEngineResult):
#	setState("afterSex")

func biteFight_eventResult(_event, _tag:String, _args:Array):
	if(_event.didWin()):
		setSubResult(SUB_CONTINUE)
		setState("ownerWon")
	else:
		setSubResult(SUB_CONTINUE)
		setState("ownerLost")

func afterSex():
	playAnimation(StageScene.PuppySexStart, "start", {pc=getOwnerID(), npcBodyState={naked=true,leashedBy=getOwnerID()}})
	saynn("After the sex, your owner clicks the leash to your collar again.")
	talkModularOwnerToPC("SoftSlaveryParadeFuckOfferGood")
	addInfluenceObey(0.1)
	addContinue("endEvent")

func ownerWon():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID(), bodyState={leashedBy=getOwnerID()}})
	
	saynn("Your owner clicks the leash to your collar again.")
	talkModularOwnerToPC("SoftSlaveryParadeFuckOfferWon")
	addInfluenceObey(0.2)
	addContinue("endEvent")

func ownerLost():
	
	var theSexChance:float = 50.0 - personality(C_EXTRA1, PersonalityStat.Subby)*40.0
	
	if(smartChance(theSexChance)):
		playAnimation(StageScene.PuppySexStart, "sad", {pc=getRoleID(C_EXTRA1), npcBodyState={naked=true}})
		saynn("After the fight, you get approached by {npc1.name}. Looks like {npc1.he} {npc1.verb('want')} to fuck you..")
		addContinue("startSex", [getRoleID(C_EXTRA1), "pc", SexType.BitchsuitSex, {SexMod.DisableDynamicJoiners:true,SexMod.BondageDisabled:true,SexMod.SubsStartNaked:true}])
	else:
		playAnimation(StageScene.PuppySexStart, "sad", {pc=getOwnerID(), npcBodyState={naked=true}})
		saynn("After the fight, you get approached by {npc1.name}. {npc1.He} {npc1.verb('grab')} you by the collar and slaps your cheek! Ow.")
		talkModular(C_EXTRA1, C_PC, "SoftSlaveryWalkiesBadPuppy") #Stupid mut.
		saynn("The person leaves you alone after that.")
		saynn("Your owner clicks a leash to your collar again.")
		talkModularOwnerToPC("SoftSlaveryWalkiesBadPuppyObey") #You need to obey more, {npc.npcSlave}
		addInfluenceResist(0.5)
		addContinue("endEvent")
	
func ownerLost_sexResult(_sex:SexEngineResult):
	setState("afterLostSex")

func afterLostSex():
	playAnimation(StageScene.PuppySexStart, "start", {pc=getOwnerID(), npcBodyState={naked=true,leashedBy=getOwnerID()}})
	
	saynn("{npc.name} clicks a leash to your collar again.")
	addInfluenceResist(0.8)
	talkModularOwnerToPC("SoftSlaveryWalkiesLostNotDone") #Whatever. We're not done walking around yet.
	addContinue("endEvent")

func saveData() -> Dictionary:
	var data := .saveData()
	data["walkiesEvent"] = walkiesEvent
	data["npcWantsSex"] = npcWantsSex
	data["ownerProtectedPC"] = ownerProtectedPC
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	walkiesEvent = SAVE.loadVar(_data, "walkiesEvent", "pet")
	npcWantsSex = SAVE.loadVar(_data, "npcWantsSex", false)
	ownerProtectedPC = SAVE.loadVar(_data, "ownerProtectedPC", false)
