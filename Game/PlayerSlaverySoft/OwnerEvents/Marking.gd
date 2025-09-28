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
		addContinue("endEvent")
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
	addContinue("endEvent")

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
	addContinue("endEvent")

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
	addContinue("endEvent")

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
	addContinue("endEvent")

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
	addContinue("endEvent")

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

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["markedAmount"] = markedAmount
	data["enough"] = enough
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	markedAmount = SAVE.loadVar(_data, "markedAmount", 0)
	enough = SAVE.loadVar(_data, "enough", false)
