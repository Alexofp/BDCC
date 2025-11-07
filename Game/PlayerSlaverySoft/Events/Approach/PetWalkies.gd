extends NpcOwnerEventBase

var timesLeft:int = 3
var isFirst:bool = true

var wantsTrick:String = "" #bark down sit paw roll
var pcPickedTrick:String = ""

var trickQueue:Array = []

var didComplicatedEvent:bool = false

var stickLoc:String = ""
var ownerLoc:String = ""
var foundStick:bool = false
var isStickFake:bool = false # Very cruel
var moveAmount:int = 0

#possible unique interactions:
# simons says but with puppy tricks (sit, lay down, give paw, etc)
# Eliza checking the puppy
# Find-bring ball?
# Just belly rubs?
# Do X (but you are presented with all of the options)

func _init():
	id = "PetWalkies"
	reactsToTags = [E_APPROACH]
	eventWeight = 0.5
	eventMinLevel = 0
	eventTags = {NOET.Petplay: 1.0}

func start():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("Your owner approaches you while holding puppy gear and a leash.")
	talkModularOwnerToPC("SoftSlaveryPetWalkies") # It's walkies time. Let's get you prepared, {npc.npcSlave}.
	saynn("Looks like they wanna undress you and make you wear the gear..")
	
	addButton("Obey", "Allow them to do it", "obey")
	addButton("Resist!", "You're not gonna let them do it", "resist")

#func shouldEndAfterSubEvent(_args:Array) -> bool:
#	return true

func getParadeTarget() -> String:
	var theResult:String= RNG.pick(LOCS_PARADE)
	while(theResult == getLocation()):
		theResult = RNG.pick(LOCS_PARADE)
	return theResult

func start_do(_id:String, _args:Array):
	if(_id == "obey"):
		setState("preparedPuppy")
		#setState("paraded")
		#timesLeft -= 1
		#var theTarget := getParadeTarget()
		#runParadeTo(theTarget)
		#checkUniqueTarget(theTarget)
	if(_id == "resist"):
		runResist()

func preparedPuppy():
	playAnimation(StageScene.PuppySexOral, "tease", {pc=getOwnerID(), npcBodyState={naked=true, leashedBy=getOwnerID()}})
	saynn("Your owner prepares you for walkies, making you wear the puppy restraints and then clipping a leash to your collar.")
	talkModularOwnerToPC("SoftSlaveryPetWalkiesReady") # Ready? Try to keep up, puppy.
	addContinue("start")

func preparedPuppy_do(_id:String, _args:Array):
	if(_id == "start"):
		setState("paraded")
		var theTarget := getParadeTarget()
		runWalkiesTo(theTarget)
		checkUniqueTarget(theTarget)

func paraded():
	#playAnimation(StageScene.PuppyDuo, "stand", {pc=getOwnerID(), npcBodyState={naked=true, leashedBy=getOwnerID()}})
	playAnimation(StageScene.PuppySexOral, "tease", {pc=getOwnerID(), npcBodyState={naked=true, leashedBy=getOwnerID()}})
	saynn("After reaching the destination, {npc.name} stops and turns towards you.")
	paradedOutcome()

func paradedOutcome():
	if(timesLeft > 0):
		if(timesLeft == 1):
			talkModularOwnerToPC("SoftSlaveryParadeAroundLast") #"One more time. I want everyone to see you."
		else:
			if(isFirst):
				isFirst = false
				talkModularOwnerToPC("SoftSlaveryParadeAroundFirst") #"Like it so far? We're just getting started."
			else:
				talkModularOwnerToPC("SoftSlaveryParadeAroundMore") #"Good. Let's walk more."
		addContinue("obey")
		#addButton("Obey", "Allow them to leash you again", "obey")
		#addButton("Resist!", "You're not gonna let them do it", "resist")
	else:
		talkModularOwnerToPC("SoftSlaveryParadeAroundFree")
		saynn("{npc.name} begins to take off the puppy restraints.")
		addContinue("endEvent")
	addInfluenceObey(0.25)

func paraded_do(_id:String, _args:Array):
	if(_id == "obey"):
		setState("paraded")
		timesLeft -= 1
		var theTarget := getParadeTarget()
		runWalkiesTo(theTarget)
		checkUniqueTarget(theTarget)
	if(_id == "resist"):
		runResist()


#Unique stuff
func checkUniqueTarget(_target:String):
	if(RNG.chance(0)):
		setState("paraded")
		return
	#if(true):
	#	setState("findStick")
	#	return
#	if(_target in ["main_shower1", "main_shower2"]):
#		setState("pShower")
#	if(_target in ["main_punishment_spot"]):
#		setState("pStocksTease")
#	if(_target in ["hall_canteen"]):
#		setState("pCanteen")
#	if(_target in ["main_hallroom1"]):
#		setState("pVendomat")
#	if(_target in ["med_lobbymain"]):
#		if(GM.pc.getPainLevel() > 0.4):
#			setState("pMedical")
	if(!didComplicatedEvent):
		if(timesLeft != 2 && (RNG.chance(30.0) || timesLeft==0 )):
			didComplicatedEvent = true
			setState(RNG.pick([
				"simonsSaysTricks",
				"findStick",
			]))
			return
		
	
	setState("simpleTrick")
	
func getDoState() -> String:
	if(state in ["pShower", "pStocksTease", "pCanteen", "pVendomat", "pMedical",
		"simpleTrickCorrect", "simpleTrickWrong", "gaveStick", "simonsSaysTricksDoFailed", "simonsSaysTricksDoGood", "stickTooFar", "fakeStickFound"]):
		return "paraded"
	return .getDoState()

func pMedical():
	playAnimation(StageScene.Duo, "stand", {npc="eliza"})
	saynn("{npc.name} brings you down to the medical wing.")
	talkOwner("My {npc.npcSlave} isn't doing too well.")
	talkCharID("eliza", "Oh, I have something that can help.")
	saynn("The feline doctor walks up to you and feeds you a little pill!")
	talkCharID("eliza", "This should help~.")
	saynn("Your owner nods and pulls you away from the counter.")
	
	if(onlyOnce()):
		GM.pc.addPain(-100)
		GM.pc.addStamina(150)
		GM.main.addMessage("You feel better!")
	
	paradedOutcome()
	

func pVendomat():
	playAnimation(StageScene.Duo, "stand", {npc=getRoleID(C_OWNER)})
	saynn("{npc.name} decides to stop near a vendomat.")
	
	if(onlyOnce()):
		var theItemToGive:String = RNG.pick(["EnergyDrink"])
		if(theItemToGive):
			talkOwner("Thirsty?")
			saynn("{npc.He} {npc.verb('buy')} an energy drink and hands it to you.")
			talkOwner("Enjoy.")
			GM.pc.getInventory().addItem(GlobalRegistry.createItem(theItemToGive))
			GM.main.addMessage("You received an energy drink!")
	saynn("After that, you get pulled away from the vendomat.")
	paradedOutcome()

func pCanteen():
	playAnimation(StageScene.PawJobUnderTable, "start", {pc="pc", npc=getOwnerID()})
	saynn("{npc.name} brings you into a canteen.")
	if(GM.pc.isOralBlocked()):
		talkModularOwnerToPC("SoftSlaveryParadeAroundEatGagged") #"Too bad you can't eat, {npc.npcSlave}. I will though."
		if(!GM.pc.isBlindfolded()):
			saynn("All you can do is watch your owner eat..")
		else:
			saynn("All you can do is.. imagine.. your owner eat..")
	else:
		talkModularOwnerToPC("SoftSlaveryParadeAroundEat") #"Lets take a break. Enjoy your meal, {npc.npcSlave}."
		if(onlyOnce()):
			GM.pc.afterEatingAtCanteen()
		saynn("You and your owner spend time eating together behind one of the canteen tables.")
	paradedOutcome()
	
func pStocksTease():
	playAnimation(StageScene.Duo, "stand", {npc=getOwnerID()})
	saynn("You stop near the punishment platform that has the row of stocks.")
	talkModularOwnerToPC("SoftSlaveryParadeAroundPlatform")
	paradedOutcome()

func pShower():
	playAnimation(StageScene.ShoweringDuo, "shower", {npc=getOwnerID(), bodyState={naked=true}, npcBodyState={naked=true}})
	saynn("You get brought into the shower room where {npc.name} helps to wash you!")
	talkModularOwnerToPC("SoftSlaveryParadeAroundShower")
	if(onlyOnce()):
		getOwner().afterTakingAShower()
		GM.pc.afterTakingAShower()
	saynn("After that is done, your owner guides you out.")
	
	paradedOutcome()

func simpleTrick():
	playAnimation(StageScene.PuppyDuo, "stand", {pc=getOwnerID(), npcBodyState={naked=true}})
	if(onlyOnce()):
		wantsTrick = RNG.pick([
			"bark", "down", "sit", "paw", "roll",
		])
	saynn("Your owner stops and turns towards you.")
	
	if(wantsTrick == "bark"):
		talkOwner("Bark for me.")
	elif(wantsTrick == "down"):
		talkOwner("Lie down.")
	elif(wantsTrick == "sit"):
		talkOwner("Sit.")
	elif(wantsTrick == "paw"):
		talkOwner("Give paw.")
	elif(wantsTrick == "roll"):
		talkOwner("Roll over.")
	saynn("Looks like {npc.name} wants you to do something..")
	
	var possible:Array = [
		["Bark", "bark"], ["Lie down", "down"], ["Sit", "sit"], ["Raise paw", "paw"], ["Roll", "roll"],
	]
	possible.shuffle()
	for buttonEntry in possible:
		addButton(buttonEntry[0], "Do this!", "doTrick", [buttonEntry[1]])

func simpleTrick_do(_id:String, _args:Array):
	if(_id == "doTrick"):
		pcPickedTrick = _args[0]
		if(pcPickedTrick == wantsTrick):
			setState("simpleTrickCorrect")
		else:
			setState("simpleTrickWrong")

func playTrickAnim(theTrick:String):
	if(theTrick == "bark"):
		playAnimation(StageScene.PuppySexStart, "start", {pc=getOwnerID(), npcBodyState={naked=true}})
	elif(theTrick == "down"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc=getOwnerID(), npcAction="sad", npcBodyState={naked=true}})
	elif(theTrick == "sit"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc=getOwnerID(), npcAction="sit", npcBodyState={naked=true}})
	elif(theTrick == "paw"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc=getOwnerID(), npcAction="paw", npcBodyState={naked=true}})
	elif(theTrick == "roll"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc=getOwnerID(), npcAction="sad", npcBodyState={naked=true}})

func generateTrickQueue(_size:int) -> Array:
	var result:Array = []
	var possible:Array = ["bark", "down", "sit", "paw", "roll"]
	var lastTrick:String = ""
	
	while(_size > 0):
		var nextTrick:String = RNG.pick(possible)
		if(nextTrick == lastTrick):
			nextTrick = RNG.pick(possible)
		result.append(nextTrick)
		lastTrick = nextTrick
		_size -= 1
	
	return result

func trickToTrickName(_trick:String) -> String:
	if(_trick == "bark"):
		return "bark"
	if(_trick == "down"):
		return "lie down"
	if(_trick == "sit"):
		return "sit"
	if(_trick == "paw"):
		return "give paw"
	if(_trick == "roll"):
		return "roll over"
	return "ERROR?"

func trickToText(theTrick:String) -> String:
	if(theTrick == "bark"):
		return "You bark a few times loudly!"
	elif(theTrick == "down"):
		return "You lie down on the cold ground and wait for an acknowledgement."
	elif(theTrick == "sit"):
		return "You push your front paws off of the ground and sit your butt down."
	elif(theTrick == "paw"):
		return "You raise your paw and wait for your owner to shake it."
	elif(theTrick == "roll"):
		return "You flop sideways onto the floor and then roll to your other side as best as you can."
	return "ERROR?"
	
func trickResultToText(theTrick:String, _isCorrect:bool) -> String:
	if(theTrick == "bark"):
		if(_isCorrect):
			return "Your owner smiles and pats you."
		else:
			return "Your owner crosses {npc.his} arms and furrows {npc.his} brows."
	elif(theTrick == "down"):
		if(_isCorrect):
			return "Your owner nods and gestures for you to get up."
		else:
			return "Your owner shakes {npc.his} head."
	elif(theTrick == "sit"):
		if(_isCorrect):
			return "Your owner admires your agility."
		else:
			return "Your owner shakes {npc.his} head."
	elif(theTrick == "paw"):
		if(_isCorrect):
			return "Your owner smiles and shakes your paw!"
		else:
			return "Your owner refuses to shake your paw."
	elif(theTrick == "roll"):
		if(_isCorrect):
			return "Your owner nods and gives your back a stroke."
		else:
			return "Your owner sighs and flicks your snout."
	if(_isCorrect):
		return "Your owner nods."
	else:
		return "Your owner shakes {npc.his} head."
	
func simpleTrickCorrect():
	playTrickAnim(pcPickedTrick)
	saynn(trickToText(pcPickedTrick))
	saynn(trickResultToText(pcPickedTrick, true))
	talkModularOwnerToPC("SoftSlaveryWalkiesCorrect") # Correct. Good puppy.
	addInfluenceObey(0.2)
	saynn("You wait for what's next.")
	paradedOutcome()

func simpleTrickWrong():
	playTrickAnim(pcPickedTrick)
	saynn(trickToText(pcPickedTrick))
	saynn(trickResultToText(pcPickedTrick, false))
	talkModularOwnerToPC("SoftSlaveryWalkiesWrong") # Nope. Wrong.
	saynn("Oh well. You wait for what's next.")
	#addInfluenceObey(0.2)
	paradedOutcome()

func simonsSaysTricks():
	playAnimation(StageScene.PuppyDuo, "stand", {pc=getOwnerID(), npcBodyState={naked=true}})
	if(onlyOnce()):
		trickQueue = generateTrickQueue(RNG.randi_range(3, 5))
		pcPickedTrick = ""
	
	saynn("Your owner turns towards you.")
	talkOwner("Let's do something more complicated, I wanna test my puppy.")
	saynn("You tilt your head.")
	talkOwner("I will say a list of tricks and you will do them, in the same order.")
	saynn("Your ears perk, listening carefully..")
	
	var theTricks:Array = []
	for theTrick in trickQueue:
		theTricks.append(trickToTrickName(theTrick))
	talkOwner("I want you to do this: "+Util.humanReadableList(theTricks, "and then")+".")
	addContinue("setState", ["simonsSaysTricksDo"])
	
func simonsSaysTricksDo():
	if(pcPickedTrick == ""):
		saynn("Your owner finished listing what tricks {npc.he} {npc.verb('want')} you to perform and just watches now.")
	else:
		playTrickAnim(pcPickedTrick)
		saynn(trickToText(pcPickedTrick))
		saynn(trickResultToText(pcPickedTrick, true))
	
	var possible:Array = [
		["Bark", "bark"], ["Lie down", "down"], ["Sit", "sit"], ["Raise paw", "paw"], ["Roll", "roll"],
	]
	for buttonEntry in possible:
		addButton(buttonEntry[0], "Do this!", "doTrick", [buttonEntry[1]])

func simonsSaysTricksDo_do(_id:String, _args:Array):
	var theTrick:String = _args[0]
	pcPickedTrick = theTrick
	
	if(pcPickedTrick == trickQueue.front()):
		trickQueue.pop_front()
		if(trickQueue.empty()):
			setState("simonsSaysTricksDoGood")
		else:
			setState("simonsSaysTricksDo")
	else:
		setState("simonsSaysTricksDoFailed")

func simonsSaysTricksDoFailed():
	playTrickAnim(pcPickedTrick)
	saynn(trickToText(pcPickedTrick))
	saynn(trickResultToText(pcPickedTrick, false))
	talkModularOwnerToPC("SoftSlaveryWalkiesWrong") # Nope. Wrong.
	saynn("Oh well. You wait for what's next.")
	#addInfluenceObey(0.2)
	paradedOutcome()

func simonsSaysTricksDoGood():
	playTrickAnim(pcPickedTrick)
	saynn(trickToText(pcPickedTrick))
	saynn(trickResultToText(pcPickedTrick, true))
	talkModularOwnerToPC("SoftSlaveryWalkiesCorrect") # Correct. Good puppy.
	addInfluenceObey(0.4)
	saynn("You get lots of headpats for getting it right!")
	paradedOutcome()

func applyRandomDir(_loc:String, _amount:int) -> String:
	var _lastDir:int = -1
	while(_amount > 0):
		var canGoDirs:Array = []
		for theDir in GameWorld.getAllDirections():
			if(GM.world.canGoID(_loc, theDir)):
				canGoDirs.append(theDir)

		if(canGoDirs.size() <= 0):
			return _loc
		if(_lastDir >= 0):
			canGoDirs.erase(GameWorld.getOppositeDir(_lastDir))
		if(canGoDirs.size() <= 0):
			return _loc
		var randomDir = RNG.pick(canGoDirs)
		_lastDir = randomDir
		_loc = GM.world.applyDirectionID(_loc, randomDir)
		_amount -= 1
	
	return _loc

func findStick():
	if(onlyOnce()):
		stickLoc = applyRandomDir(GM.pc.getLocation(), 2)
		ownerLoc = GM.pc.getLocation()
		foundStick = false
		moveAmount = 0
		isStickFake = RNG.chance(20.0 + ownerPersonality(PersonalityStat.Mean)*10.0)
	playAnimation(StageScene.PuppyDuo, "throw", {pc=getOwnerID(), npcBodyState={naked=true}})
	saynn("{npc.name} stops and turns towards you, {npc.his} hand produces a ball!")
	talkModularOwnerToPC("SoftSlaveryWalkiesBall") # I wanna play fetch with you, {npc.npcSlave}.
	saynn("{npc.He} {npc.verb('pull')} {npc.his} hand far back.. before throwing the ball somewhere behind you!")
	talkModularOwnerToPC("SoftSlaveryWalkiesBall2") # Go get the ball!
	
	addContinue("setState", ["findStickFinding"])

func findStickFinding():
	if(!foundStick):
		saynn("Find the ball! Find the ball! Find the ball!")
	else:
		saynn("Bring the ball back! Bring the ball back! Bring the ball back!")
	var roomID:String = GM.pc.location
	aimCamera(roomID)
	
	if(!isStickFake):
		if(roomID == stickLoc && !foundStick):
			addButton("BALL!", "Grab the ball!", "grabStick")
		
		if(foundStick && roomID == ownerLoc):
			addButton("Give ball!", "Give your owner the ball", "setState", ["gaveStick"])
	else:
		if(moveAmount >= 3 && roomID == ownerLoc):
			addButton("No ball..", "You couldn't find your owner's ball..", "setState", ["fakeStickFound"])
	
	if(GM.world.canGoID(roomID, GameWorld.Direction.NORTH)):
		addButtonAt(6, "North", "Go north", "go", [GameWorld.Direction.NORTH, Direction.North])
	else:
		addDisabledButtonAt(6, "North", "Can't go north")
	if(GM.world.canGoID(roomID, GameWorld.Direction.WEST)):
		addButtonAt(10, "West", "Go west", "go", [GameWorld.Direction.WEST, Direction.West])
	else:
		addDisabledButtonAt(10, "West", "Can't go west")
	if(GM.world.canGoID(roomID, GameWorld.Direction.SOUTH)):
		addButtonAt(11, "South", "Go south", "go", [GameWorld.Direction.SOUTH, Direction.South])
	else:
		addDisabledButtonAt(11, "South", "Can't go south")
	if(GM.world.canGoID(roomID, GameWorld.Direction.EAST)):
		addButtonAt(12, "East", "Go east",  "go", [GameWorld.Direction.EAST, Direction.East])
	else:
		addDisabledButtonAt(12, "East", "Can't go east")

func findStickFinding_do(_id:String, _args:Array):
	if(_id == "go"):
		playAnimation(StageScene.PuppySolo, "walk", {bodyState={naked=true}})
		moveAmount += 1
		var theGoDir:int = _args[0]
		var newPCLoc:String = GM.world.applyDirectionID(GM.pc.getLocation(), theGoDir)
		GM.pc.setLocation(newPCLoc)
		#play walk anim
		
		if(GM.world.simpleDistance(newPCLoc, ownerLoc) >= 2.8):
			setLocation(newPCLoc)
			setState("stickTooFar")
		
	if(_id == "grabStick"):
		foundStick = true
		GM.main.addMessage("You find the ball and grab it with your mouth!")
		playAnimation(StageScene.PuppySolo, "sad", {bodyState={naked=true}})

func gaveStick():
	playAnimation(StageScene.PuppyDuo, "stand", {pc=getOwnerID(), npcAction="back", npcBodyState={naked=true}})
	saynn("You sit down and drop the ball into your owner's hand!")
	saynn("In exchange, {npc.name} pushes you down to your back and starts giving you lots of bellyrubs!")
	talkModularOwnerToPC("SoftSlaveryWalkiesPraise") # Good puppy. What a good puppy.
	addInfluenceObey(0.4)
	saynn("You can't help but to wiggle from the many touches.")
	saynn("After that's done, your owner helps you to get up.")
	paradedOutcome()

func stickTooFar():
	playAnimation(StageScene.PuppySexStart, "start", {pc=getOwnerID(), npcBodyState={naked=true}})
	if(isStickFake):
		saynn("You get pretty far from your owner.. trying to find the ball.. but fail.. where did it go?")
		saynn("Eventually, your owner catches up with you.")
		talkModularOwnerToPC("SoftSlaveryWalkiesBallTooFarFake") #Couldn't find the ball? It's because it's in my hand, you silly pup.
		saynn("Looks like you got tricked.. there was never a ball.")
		addInfluenceObey(0.2)
	else:
		saynn("You get pretty far from your owner.. but {npc.he} easily {npc.verb('catch', 'catches')} up with you.")
		talkModularOwnerToPC("SoftSlaveryWalkiesBallTooFar") #Where do you think you're going? What a silly pup, did you get lost trying to find the ball?
		addInfluenceObey(0.2)
		saynn("You let out a soft whine.")
	paradedOutcome()

func fakeStickFound():
	playAnimation(StageScene.PuppySexStart, "pat", {pc=getOwnerID(), npcBodyState={naked=true}})
	saynn("You come back to your owner and lower your head, producing a sad, soft whine.")
	saynn("{npc.name} smiles and starts giving you headpats!")
	talkModularOwnerToPC("SoftSlaveryWalkiesNoBallFound") # You're sad because you couldn't find my ball? That's because I did a fake throw. Such a silly puppy.
	addInfluenceObey(0.4)
	saynn("You got tricked! But the many pats make up for it.")
	paradedOutcome()

func saveData() -> Dictionary:
	var data := .saveData()
	data["timesLeft"] = timesLeft
	data["isFirst"] = isFirst
	data["wantsTrick"] = wantsTrick
	data["pcPickedTrick"] = pcPickedTrick
	data["trickQueue"] = trickQueue
	data["didComplicatedEvent"] = didComplicatedEvent
	data["stickLoc"] = stickLoc
	data["ownerLoc"] = ownerLoc
	data["foundStick"] = foundStick
	data["isStickFake"] = isStickFake
	data["moveAmount"] = moveAmount
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	timesLeft = SAVE.loadVar(_data, "timesLeft", 3)
	isFirst = SAVE.loadVar(_data, "isFirst", true)
	wantsTrick = SAVE.loadVar(_data, "wantsTrick", "")
	pcPickedTrick = SAVE.loadVar(_data, "pcPickedTrick", "")
	trickQueue = SAVE.loadVar(_data, "trickQueue", [])
	didComplicatedEvent = SAVE.loadVar(_data, "didComplicatedEvent", false)
	stickLoc = SAVE.loadVar(_data, "stickLoc", "")
	ownerLoc = SAVE.loadVar(_data, "ownerLoc", "")
	foundStick = SAVE.loadVar(_data, "foundStick", false)
	isStickFake = SAVE.loadVar(_data, "isStickFake", false)
	moveAmount = SAVE.loadVar(_data, "moveAmount", 0)
