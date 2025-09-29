extends NpcOwnerEventBase

var markedAmount:int = 0
var enough:bool = false

func _init():
	id = "Marking"
	reactsToTags = ["aMean"]
	
	eventWeight = 1000.0

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	
	saynn("YOUR OWNER APPROACHES YOU WHILE HOLDING A MARKER.")
	talkOwner("I WANNA MARK MY {npc.npcSlave}. YOU ARE MY {npc.npcSlave}, right?")
	
	addButton("Yes", "Let them mark you", "let")
	addButton("No?", "Say no", "no")
	addButton("Please no", "Beg for it", "pleaseno")

func start_do(_id:String, _args:Array):
	if(_id == "let"):
		GM.pc.addBodywritingRandom()
		incMarked()
		setState("afterBodywriting")
	if(_id == "no"):
		if(RNG.chance(10.0)):
			setState("fineEnough")
		else:
			setState("fightOrMark")
	if(_id == "pleaseno"):
		if(RNG.chance(20)):
			setState("pleaseFineEnough")
		else:
			setState("beggingStart")

func afterBodywriting():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER), bodyState={naked=true}})
	
	saynn("YOU LET THE OWNER DO IT.")
	addInfluenceObey(0.1)
	
	saynn("YOUR OWNER SCRIBBLES SOMETHING ON YOU!")
	
	if(enough):
		talkOwner("ALRIGHT, THAT'S ENOUGH.")
		addContinueCheckExtra()
		return
	
	addContinue("setState", ["tryWriting"])

func tryWriting():
	saynn("YOUR OWNER IS STILL HOLDING THE MARKER.")
	
	talkOwner("ANOTHER ONE?")

	addButton("Yes", "Let them mark you", "let")
	addButton("No?", "Say no", "no")
	addButton("Please no", "Beg for it", "pleaseno")

func tryWriting_do(_id:String, _args:Array):
	if(_id == "let"):
		GM.pc.addBodywritingRandom()
		incMarked()
		setState("afterBodywriting")
	if(_id == "no"):
		if(RNG.chance(markedAmount*10.0)):
			setState("fineEnough")
		else:
			setState("fightOrMark")
	if(_id == "pleaseno"):
		if(RNG.chance(markedAmount*10.0)):
			setState("pleaseFineEnough")
		else:
			setState("beggingStart")

func fineEnough():
	talkPC("No.")
	saynn("YOUR OWNER NODS AND PUTS THE MARKER AWAY.")
	if(markedAmount == 0):
		talkOwner("Alright, screw you then.")
	else:
		talkOwner("Alright, that's enough then.")
	addContinueCheckExtra()

func fightOrMark():
	talkPC("No.")
	saynn("YOUR OWNER FROWNS.")
	talkOwner("YOU'RE UPSETTING ME. MY {npc.npcSlave} MUST BE MARKED.")

	addButton("Fine", "Let them mark you", "let")
	addButton("Resist", "Resist it", "resist")

func fightOrMark_do(_id:String, _args:Array):
	if(_id == "let"):
		GM.pc.addBodywritingRandom()
		incMarked()
		setState("afterBodywriting")
	if(_id == "resist"):
		runResist()

func pleaseFineEnough():
	if(markedAmount == 0):
		talkPC("Please, no.")
	else:
		talkPC("Please, that's enough.")
	talkOwner("What a {npc.npcSlave}, begging me.")
	saynn("YOUR OWNER PUTS THE MARKER AWAY.")
	talkOwner("Fine, that's enough then.")
	addContinueCheckExtra()

func beggingStart():
	if(markedAmount == 0):
		talkPC("Please, no.")
	else:
		talkPC("Please, that's enough.")
	saynn("YOUR OWNER STILL HOLDS THE MARKER.")
	talkOwner("IF YOU WANNA BEG ME, KNEEL FIRST.")
	saynn("YOU TILT YOUR HEAD.")
	talkOwner("KNEEL I SAID.")
	addButton("Kneel", "Do as your owner says", "kneel")
	addButton("Resist", "You won't do that!", "resist")

func beggingStart_do(_id:String, _args:Array):
	if(_id == "kneel"):
		setState(RNG.pick(["begHumiliateSelf", "begKissFoot", "begGiveCredits"]))
	if(_id == "resist"):
		runResist()

func begGiveCredits():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID()})
	saynn("YOU KNEEL BEFORE YOUR OWNER AND LOWER YOUR GAZE.")
	addInfluenceObey(0.5)
	talkOwner("GOOD. NOW GIVE ME 5 CREDITS. DO IT OR I'M GONNA LEAVE SOME INK ON YOU.")
	saynn("THE MARKER IS HOVERING CLOSE TO YOUR SKIN.")
	
	if(GM.pc.getCredits() >= 5):
		addButton("Pay", "Hand them the credits", "pay")
	else:
		addDisabledButton("Pay", "You don't have enough..")
	addButton("Refuse", "Refuse to do it", "getmarked")

func begGiveCredits_do(_id:String, _args:Array):
	if(_id == "pay"):
		GM.pc.addCredits(-5)
		setState("begGiveCreditsPaid")
	if(_id == "getmarked"):
		for _i in range(RNG.randi_range(3, 5)):
			incMarked()
		setState("begGiveCreditsMarked")

func begGiveCreditsPaid():
	saynn("YOU HAND YOUR OWNER THE CREDITS.")
	talkOwner("WHAT A SLUT, READY TO DO ANYTHING, JUST NOT TO GET MARKED.")
	addInfluenceObey(0.5)
	saynn("SATISFIED WITH THE CREDITS, YOUR OWNER PUTS THE MARKER AWAY.")
	talkOwner("NOW GET LOST.")
	addContinueCheckExtra()

func begGiveCreditsMarked():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID(), bodyState={naked=true}})
	saynn("YOU REFUSE TO DO THAT.")
	addInfluenceResist(0.5)
	saynn("NOT GETTING WHAT {npc.he} {npc.verb('want')}, YOUR OWNER STARTS LEAVING BODYWRITINGS ON YOUR SKIN.")
	talkOwner("THAT'S WHAT YOU GET.")
	saynn("YOUR OWNER PUTS THE MARKER AWAY.")
	talkOwner("NOW GO AWAY.")
	addContinue("endEvent")


func begKissFoot():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID()})
	saynn("YOU KNEEL BEFORE YOUR OWNER AND LOWER YOUR GAZE.")
	addInfluenceObey(0.5)
	talkOwner("GOOD. NOW KISS MY {npc.foot}. DO IT OR I'M GONNA LEAVE SOME INK ON YOU.")
	saynn("THE MARKER IS HOVERING CLOSE TO YOUR SKIN.")
	
	addButton("Kiss", "Kiss their foot", "setState", ["begKissFootKiss"])
	addButton("Refuse", "Refuse to do it", "getmarked")

func begKissFoot_do(_id:String, _args:Array):
	if(_id == "getmarked"):
		for _i in range(RNG.randi_range(3, 5)):
			incMarked()
		setState("begKissFootMarked")

func begKissFootKiss():
	saynn("YOU LEAN LOWER AND KISS YOUR OWNER'S {npc.feet}.")
	talkOwner("WHAT A SLUT, READY TO DO ANYTHING, JUST NOT TO GET MARKED.")
	addInfluenceObey(0.5)
	saynn("AS YOU FINISH WORSHIPPING {npc.his} {npc.feet}, YOUR OWNER PUTS THE MARKER AWAY.")
	talkOwner("NOW GET LOST.")
	addContinueCheckExtra()

func begKissFootMarked():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID(), bodyState={naked=true}})
	saynn("YOU REFUSE TO DO THAT.")
	addInfluenceResist(0.5)
	saynn("NOT SEEING WHAT {npc.he} {npc.verb('want')}, YOUR OWNER STARTS LEAVING BODYWRITINGS ON YOUR SKIN.")
	talkOwner("THAT'S WHAT YOU GET.")
	saynn("YOUR OWNER PUTS THE MARKER AWAY.")
	talkOwner("NOW GO AWAY.")
	addContinue("endEvent")
	

func begHumiliateSelf():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID()})
	saynn("YOU KNEEL BEFORE YOUR OWNER AND LOWER YOUR GAZE.")
	addInfluenceObey(0.5)
	talkOwner("GOOD. NOW ADMIT THAT YOU ARE MY {npc.npcSlave}. ADMIT THAT YOU ARE NOTHING BUT MY FUCKING PROPERTY.")
	saynn("THE MARKER IS HOVERING CLOSE TO YOUR SKIN.")
	
	addButton("Admit", "Say it", "admit")
	addButton("Stay quiet", "Refuse to say it", "getmarked")

func begHumiliateSelf_do(_id:String, _args:Array):
	if(_id == "admit"):
		setState("begHumiliateSelfAdmit")
	if(_id == "getmarked"):
		for _i in range(RNG.randi_range(3, 5)):
			incMarked()
		setState("begHumiliateSelfMarked")

func begHumiliateSelfAdmit():
	saynn("YOU LOWER YOUR CHIN AND START TALKING.")
	talkPC("I'm your {npc.npcSlave}.")
	talkOwner("WHAT WAS THAT?")
	saynn("THE TIP OF THAT MARKER ALMOST START LEAVING ITS TRAIL ON YOUR SKIN.")
	talkPC("I'm your {npc.npcSlave}! I'm nothing but your property!")
	talkOwner("THAT'S BETTER.")
	addInfluenceObey(0.5)
	saynn("YOUR OWNER PUTS THE MARKER AWAY.")
	talkOwner("NOW GET LOST.")
	addContinueCheckExtra()

func begHumiliateSelfMarked():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID(), bodyState={naked=true}})
	saynn("YOU REFUSE TO ADMIT THAT.")
	addInfluenceResist(0.5)
	saynn("NOT HEARING WHAT {npc.he} {npc.verb('want')}, YOUR OWNER STARTS LEAVING BODYWRITINGS ON YOUR SKIN.")
	talkOwner("THAT'S WHAT YOU GET.")
	saynn("YOUR OWNER PUTS THE MARKER AWAY.")
	talkOwner("NOW GO AWAY.")
	addContinue("endEvent")
	
func incMarked():
	markedAmount += 1
	if(RNG.chance(markedAmount*10.0)):
		enough = true

func addContinueCheckExtra(justGoChance:float = 70.0):
	if(RNG.chance(justGoChance)):
		addContinue("endEvent")
	else:
		addContinue("setState", [RNG.pick(["notDoneYetCum", "notDoneYetPerm"])])

func notDoneYetPerm():
	talkOwner("Actually, you know what? I'm not done with you just yet.")
	saynn("Your owner pulls out a leash..")
	addButton("Obey", "Let your owner do anything with you..", "go")
	addButton("Resist", "That's enough!", "resist")

func notDoneYetPerm_do(_id:String, _args:Array):
	if(_id == "go"):
		runParadeTo(RNG.pick([LOC_STOCKS]))
	if(_id == "resist"):
		runResist()

func notDoneYetPerm_eventResult(_event, _tag:String, _args:Array):
	setState("aboutToPermWriting")

func aboutToPermWriting():
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getRoleID(C_OWNER), bodyState={naked=true}})

	saynn("YOUR OWNER LOCKS YOU INTO STOCKS.")
	talkOwner("THIS IS TO MAKE SURE YOU DON'T RUN AWAY.")
	saynn("AFTER THAT, {npc.he} {npc.verb('pull')} out a [b]permanent[/b] marker!")
	
	addContinue("getMarked")

func aboutToPermWriting_do(_id:String, _args:Array):
	GM.pc.addBodywritingRandom(true)
	setState("afterGetPermMarked")

func afterGetPermMarked():
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getRoleID(C_OWNER), bodyState={naked=true}})
	saynn("Your owner scribbles something on you with a permanent marker!")
	talkOwner("Now this is a mark.")
	addInfluenceObey(0.3)
	saynn("After some time, your owner decides to finally let you go.")
	addContinue("endEvent")

func notDoneYetCum():
	talkOwner("Actually, you know what? I'm not done with you just yet.")
	saynn("Your owner pulls out a leash..")
	addButton("Obey", "Let your owner do anything with you..", "go")
	addButton("Resist", "That's enough!", "resist")

func notDoneYetCum_do(_id:String, _args:Array):
	if(_id == "go"):
		runParadeTo(RNG.pick([LOC_BATHROOM1, LOC_BATHROOM2]))
	if(_id == "resist"):
		runResist()

func notDoneYetCum_eventResult(_event, _tag:String, _args:Array):
	setState("cumMarkUrinal")

func cumMarkUrinal():
	playAnimation(StageScene.UrinalPeeing, "idle", {npc=getOwnerID(), bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
	var theOwner := getOwner()
	if(theOwner.hasReachablePenis()):
		saynn("Your owner cuffs you up to a urinal and pulls {npc.his} {npc.penis} out, already gently stroking it!")
	elif(theOwner.hasVagina()):
		saynn("Your owner cuffs you up to a urinal and exposes {npc.his} pussy, already gently rubbing it!")
	talkOwner("Gonna mark you real good.")
	addContinue("getMarked")

func cumMarkUrinal_do(_id:String, _args:Array):
	if(_id == 'getMarked'):
		var theOwner := getOwner()
		if(theOwner.hasReachablePenis()):
			GM.pc.cummedOnBy(getOwnerID(), FluidSource.Penis)
		elif(theOwner.hasVagina()):
			GM.pc.cummedOnBy(getOwnerID(), FluidSource.Vagina)
		setState("cumMarkUrinalMarked")

func cumMarkUrinalMarked():
	var theOwner := getOwner()
	if(theOwner.hasReachablePenis()):
		playAnimation(StageScene.UrinalPeeing, "stroke", {npc=getOwnerID(), npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
	else:
		playAnimation(StageScene.UrinalPeeing, "peefemale", {npc=getOwnerID(), npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
	
	saynn("YOUR OWNER MARKS YOU!")
	talkOwner("Good {npc.npcSlave}.")
	addInfluenceObey(0.3)
	
	saynn("After some time, your owner lets you go.")
	talkOwner("SEE YOU AROUND.")
	addContinue("endEvent")
	
func saveData() -> Dictionary:
	var data := .saveData()
	
	data["markedAmount"] = markedAmount
	data["enough"] = enough
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	markedAmount = SAVE.loadVar(_data, "markedAmount", 0)
	enough = SAVE.loadVar(_data, "enough", false)
