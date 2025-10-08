extends NpcOwnerEventBase

var markedAmount:int = 0
var enough:bool = false

func _init():
	id = "Marking"
	reactsToTags = ["aMean"]
	
	eventMinLevel = 2
	eventWeight = 0.5

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	
	saynn("Your owner approaches you while holding a marker.")
	talkModularOwnerToPC("SoftSlaveryMarkingStart") #I feel like marking my {npc.npcSlave}. So stand still while I do this.
	saynn("Looks like {npc.he} {npc.isAre} about to leave a body writing on you.")
	
	addButton("Obey", "Let them mark you", "let")
	addButton("No?", "Say no", "no")
	addButton("Please no", "Beg for it", "pleaseno")

func start_do(_id:String, _args:Array):
	if(_id == "let"):
		incMarked()
		setState("afterBodywriting")
	if(_id == "no"):
		if(smartChance(max(10.0 - ownerPersonality(PersonalityStat.Mean)*80.0, 10.0), 0.0)):
			setState("fineEnough")
		else:
			setState("fightOrMark")
	if(_id == "pleaseno"):
		if(smartChance(max(20.0 - ownerPersonality(PersonalityStat.Mean)*80.0, 20.0), 0.0)):
			setState("pleaseFineEnough")
		else:
			setState("beggingStart")

func afterBodywriting():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER), bodyState={naked=true}})
	
	if(markedAmount <= 1):
		saynn("You obey and let the owner leave a mark on you!")
	elif(markedAmount == 2):
		saynn("You let the owner leave a second mark on you!")
	elif(markedAmount == 3):
		saynn("You let the owner leave a third mark on you. They make you look quite.. interesting.")
	elif(markedAmount == 4):
		saynn("You let the owner leave a fourth mark on you. They make you look quite.. suggestive.")
	elif(markedAmount == 5):
		saynn("You let the owner leave a fifth mark on you. They make you look quite slutty!")
	else:
		saynn("You let the owner leave a.. another mark on you. They make you look extremely slutty!")
	
	addInfluenceObey(0.1)
	
	if(enough):
		talkModularOwnerToPC("SoftSlaveryMarkingEnough")
		addContinueCheckExtra()
		return
	
	addContinue("setState", ["tryWriting"])

func tryWriting():
	saynn("After leaving a mark on you.. your owner is still holding the marker.")
	talkModularOwnerToPC("SoftSlaveryMarkingAnother") #Another one?

	addButton("Yes", "Let them mark you", "let")
	addButton("No?", "Say no", "no")
	addButton("Please no", "Beg for it", "pleaseno")

func tryWriting_do(_id:String, _args:Array):
	if(_id == "let"):
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
	if(markedAmount <= 0):
		saynn("You tell your owner that you don't wanna be marked.")
		saynn("Suprisingly, your owner nods and just puts the marker away.")
		talkModularOwnerToPC("SoftSlaveryMarkingNoStart") #Whatever, I guess I'm not marking you
		addInfluenceResist()
	else:
		saynn("You tell your owner that this is enough.")
		saynn("Your owner nods and puts the marker away.")
		talkModularOwnerToPC("SoftSlaveryMarkingNo") #Alright. I guess this is enough for now.
	addContinueCheckExtra()

func fightOrMark():
	if(markedAmount <= 0):
		saynn("You tell your owner that you don't wanna be marked.")
	else:
		saynn("You tell your owner that this is enough.")
	saynn("But {npc.name} doesn't back down.")
	talkModularOwnerToPC("SoftSlaveryMarkingNoFail")

	addButton("Fine", "Let them mark you", "let")
	addButton("Resist", "Resist it", "resist")

func fightOrMark_do(_id:String, _args:Array):
	if(_id == "let"):
		incMarked()
		setState("afterBodywriting")
	if(_id == "resist"):
		runResist()

func pleaseFineEnough():
	if(markedAmount == 0):
		talkPC("Please, no.")
	else:
		talkPC("Please, that's enough.")
	saynn("You beg your owner to stop.")
	saynn("{npc.name} hears that.. and actually stops.")
	talkModularOwnerToPC("SoftSlaveryMarkingBegYes") #"You are being so cute, begging me. How can I say no?"
	saynn("{npc.He} {npc.verb('put')} the marker away.")
	talkModularOwnerToPC("SoftSlaveryMarkingBegYes2") #That's enough then
	addContinueCheckExtra()

func beggingStart():
	if(markedAmount == 0):
		talkPC("Please, no.")
	else:
		talkPC("Please, that's enough.")
	saynn("You beg your owner to stop.")
	saynn("But {npc.name} is still holding the marker.")
	talkModularOwnerToPC("SoftSlaveryMarkingBegNo") #If you're gonna beg, do it on your knees
	saynn("You tilt your head a bit.")
	talkModularOwnerToPC("SoftSlaveryMarkingBegNo2") #Kneel, now
	addButton("Kneel", "Do as your owner says", "kneel")
	addButton("Resist", "You won't do that!", "resist")

func beggingStart_do(_id:String, _args:Array):
	if(_id == "kneel"):
		setState(RNG.pick(["begHumiliateSelf", "begKissFoot", "begGiveCredits"]))
	if(_id == "resist"):
		runResist()

func begGiveCredits():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID()})
	saynn("You do as ordered, kneeling before {npc.name}. {npc.His} drilling gaze makes you lower yours.")
	addInfluenceObey(0.5)
	talkModularOwnerToPC("SoftSlaveryMarkingBegCredits")
	saynn("The marker is hovering close to your skin.")
	
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
	saynn("You hand your owner a credits chip.")
	talkModularOwnerToPC("SoftSlaveryMarkingBegCreditsGive") #Thanks. These are more useful to me anyway.
	addInfluenceObey(0.5)
	saynn("Satisfied with the credits, your owner puts the marker away.")
	talkModularOwnerToPC("SoftSlaveryMarkingBegCreditsGive2") #I guess thats it then.
	addContinueCheckExtra()

func begGiveCreditsMarked():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID(), bodyState={naked=true}})
	saynn("You refuse to give your credits.")
	addInfluenceResist(0.5)
	saynn("Seeing that, {npc.name} starts leaving many writings on your skin!")
	talkModularOwnerToPC("SoftSlaveryMarkingBegNoMarked") #That's what you get. Enjoy the marks
	saynn("Only when getting their share of fun is when your owner decides to stop.")
	addContinue("endEvent")


func begKissFoot():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID()})
	saynn("You do as ordered, kneeling before {npc.name}. {npc.His} drilling gaze makes you lower yours.")
	addInfluenceObey(0.5)
	talkModularOwnerToPC("SoftSlaveryMarkingBegFoot")
	saynn("The marker is hovering close to your skin.")
	
	addButton("Kiss", "Kiss their foot", "setState", ["begKissFootKiss"])
	addButton("Refuse", "Refuse to do it", "getmarked")

func begKissFoot_do(_id:String, _args:Array):
	if(_id == "getmarked"):
		for _i in range(RNG.randi_range(3, 5)):
			incMarked()
		setState("begKissFootMarked")

func begKissFootKiss():
	saynn("You lean lower and kiss your owner's {npc.foot}, exactly as ordered.")
	saynn("{npc.name} sees that and smiles.")
	talkModularOwnerToPC("SoftSlaveryMarkingBegFootKiss")
	addInfluenceObey(0.5)
	saynn("As you finish worshipping {npc.his} {npc.feet}, {npc.he} finally puts the marker away.")
	talkModularOwnerToPC("SoftSlaveryMarkingBegFootKiss2")
	addContinueCheckExtra()

func begKissFootMarked():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID(), bodyState={naked=true}})
	saynn("You refuse to get anywhere close {npc.name}'s {npc.feet}.")
	addInfluenceResist(0.5)
	saynn("Seeing that, {npc.name} starts leaving many writings on your skin!")
	talkModularOwnerToPC("SoftSlaveryMarkingBegNoMarked") #That's what you get. Enjoy the marks
	saynn("Only when getting their share of fun is when your owner decides to stop.")
	addContinue("endEvent")
	

func begHumiliateSelf():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID()})
	saynn("You do as ordered, kneeling before {npc.name}. {npc.His} drilling gaze makes you lower yours.")
	addInfluenceObey(0.5)
	talkModularOwnerToPC("SoftSlaveryMarkingBegHumiliation")
	saynn("The marker is hovering close to your skin.")
	
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
	saynn("You speak.")
	talkPC("I'm your {npc.npcSlave}.")
	talkModularOwnerToPC("SoftSlaveryMarkingBegHumiliation2")
	saynn("The tip of a marker starts leavings its trail on your skin.")
	talkPC("I'm your {npc.npcSlave}! Nothing but your property!")
	talkModularOwnerToPC("SoftSlaveryMarkingBegHumiliation3")
	addInfluenceObey(0.5)
	saynn("{npc.name} finally puts the marker away.")
	talkModularOwnerToPC("SoftSlaveryMarkingBegHumiliation4")
	addContinueCheckExtra()

func begHumiliateSelfMarked():
	playAnimation(StageScene.Duo, "kneel", {npc=getOwnerID(), bodyState={naked=true}})
	saynn("You refuse to admit anything.")
	addInfluenceResist(0.5)
	saynn("Seeing your disobedience, {npc.name} starts leaving many writings on your skin!")
	talkModularOwnerToPC("SoftSlaveryMarkingBegNoMarked") #That's what you get. Enjoy the marks
	saynn("Only when getting their share of fun is when your owner decides to stop.")
	addContinue("endEvent")
	
func incMarked():
	markedAmount += 1
	
	var fetishChance:float = 10.0 - ownerFetish(Fetish.Bodywritings)*5.0
	
	if(RNG.chance(markedAmount*fetishChance)):
		enough = true
		
	var zone = BodyWritingsZone.getRandomZone()
	var theWritingID:String = BodyWritings.getRandomWritingIDForZone(zone)
	GM.pc.addBodywriting(zone, theWritingID)
	
	GM.main.addMessage("You have a received a '"+BodyWritings.getWritingText(theWritingID)+"' writing on your "+BodyWritingsZone.getZoneVisibleName(zone))

func addContinueCheckExtra():
	var extraChance:float = 50.0 - ownerPersonality(PersonalityStat.Subby)*30.0
	if(GM.pc.hasBodywritings()):
		extraChance *= 0.9
	
	if(!RNG.chance(extraChance)):
		addContinue("endEvent")
	else:
		addContinue("setState", [RNG.pick(["notDoneYetCum", "notDoneYetPerm"])])

func notDoneYetPerm():
	talkModularOwnerToPC("SoftSlaveryMarkingNotDone") #"Actually.. you know what.. I'm not done with you just yet."
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

	saynn("{npc.name} brings you to the punishment platform where {npc.he} {npc.verb('lock')} you into the stocks!")
	talkModularOwnerToPC("SoftSlaveryMarkingNotDoneStocks") #"This is just so you don't run away now."
	saynn("After saying that, {npc.he} {npc.verb('pull')} out a [b]permanent[/b] marker!")
	
	addContinue("getMarked")

func aboutToPermWriting_do(_id:String, _args:Array):
	GM.pc.addBodywritingRandom(true)
	setState("afterGetPermMarked")

func afterGetPermMarked():
	playAnimation(StageScene.StocksSexOral, "tease", {npc=getRoleID(C_OWNER), bodyState={naked=true}})
	saynn("Your owner scribbles something on you with a permanent marker!")
	talkModularOwnerToPC("SoftSlaveryMarkingNotDoneStocks2") #Perfect. This is art.
	addInfluenceObey(0.3)
	saynn("After displaying you for some time, your owner decides to finally unlock you and let you go.")
	addContinue("endEvent")

func notDoneYetCum():
	talkModularOwnerToPC("SoftSlaveryMarkingNotDone") #"Actually.. you know what.. I'm not done with you just yet."
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
	talkModularOwnerToPC("SoftSlaveryMarkingNotDoneUrinal")
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
	
		saynn("And so, after some stroking, your owner marks you with {npc.his} {npc.cum}! {npc.His} {npc.penis} is throbbing while shooting sticky strings all over your face!")
	else:
		playAnimation(StageScene.UrinalPeeing, "peefemale", {npc=getOwnerID(), npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		
		if(theOwner.hasVagina()):
			saynn("And so, after some pussy rubbing, your owner lets out a moan as {npc.his} {npc.pussyStretch} {pussy} squirts all over your face and body, covering you with a layer of {npc.his} juices!")
		else:
			saynn("And so, after some time, your owner marks you by cumming all over your face!")
		
	talkModularOwnerToPC("SoftSlaveryMarkingNotDoneUrinal2") #"Mmhh.. Good {npc.npcSlave}."
	addInfluenceObey(0.3)
	
	saynn("After some time, your owner finally uncuffs you from the urinal and then lets you go.")
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
