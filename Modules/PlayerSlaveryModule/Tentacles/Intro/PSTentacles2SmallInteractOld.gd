extends SceneBase

var statAnger:int = 0
var statAgility:int = 0
var statMind:int = 0
var statLust:int = 0

func _init():
	sceneID = "PSTentacles2SmallInteract"

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	
	if(state == ""):
		#aimCameraAndSetLocName(_tentacles.LOC_SCIENTISTS)
		playAnimation(StageScene.Solo, "stand")
		saynn("YOU TAKE SOME REST, AS BEST AS YOU CAN WITH THAT THING IN THE MIDDLE OF THE ROOM!")
		
		addContinue("wakeup")
	
	if(state == "wakeup"):
		saynn("EVENTUALLY, THE SCIENTISTS COME AND TELL YOU TO DO MORE TESTS.")
		saynn("YOU LOOK AT THE MONSTER. IT LOOKS WEAK.")
		saynn("IT LOOKS LIKE ITS HUNGRY.")
		saynn("SCIENTISTS STOCKED THE FRIDGE.")
		saynn("WHATS THAT WHITE STUFF? MILK? SURE.")
		saynn("HOW DO YOU WANNA FEED IT?")
		
		addButton("Cooked chicken", "Feed it some chicken", "1_chicken")
		addButton("Raw meat", "Feed it a whole stake", "1_meat")
		addButton("'Milk'", "Feed it that suspicious milk", "1_milk")
		addButton("Broccoli", "Feed it some broccoli", "1_broc")
		
	if(state == "1_meat"):
		saynn("YOU FEED IT MEAT.")
		saynn("IT EVENTUALLY SHREADS IT TO PEICES AND ABSORBS IT.")
		saynn("IT DOESN'T LOOK WEAK ANYMORE.")
		addContinue("needMusic")
	if(state == "1_chicken"):
		saynn("YOU FEED IT SOME CHICKEN.")
		saynn("YOU NOMS THE MEAT AND BECOMES LIVELY.")
		addContinue("needMusic")
	if(state == "1_milk"):
		saynn("YOU SPLASH IT WITH MILK.")
		saynn("THE TENTACLES ABSORB IT AND WIGGLE.")
		addContinue("needMusic")
	if(state == "1_broc"):
		saynn("YOU FEED IT BROCCOLI.")
		saynn("THE TENTACLES TAKE THEIR TIME ABSORBING IT.")
		saynn("THEY DON'T LOOK WEAK ANYMORE.")
		addContinue("needMusic")
	
	if(state == "needMusic"):
		saynn("THE TENTACLES MONSTER LOOKS MORE ALIVE NOW.")
		saynn("THE SCIENTISTS WANNA TEST HOW A DIFFERENT ATMOSPHERE WOULD AFFECT IT.")
		saynn("CHOOSE WHAT MUSIC YOU WANT.")
	
		addButton("Heavy metal", "Play some heavy metal", "2_metal")
		addButton("Soothing ambient", "Play some very calming ambient", "2_ambient")
		addButton("Drum'n'Bass", "Play some electronic music", "2_dnb")
		addButton("Smooth jazz", "Play something smooth and intimate", "2_jazz")
	
	if(state == "2_metal"):
		saynn("YOU PLAY HEAVY METAL MUSIC.")
		saynn("THE MONSTER THRASHES.")
		addContinue("timeToTest")
	if(state == "2_ambient"):
		saynn("YOU PLAY SOME CHILL AMBIENT.")
		saynn("THE MONSTER VIBES.")
		addContinue("timeToTest")
	if(state == "2_dnb"):
		saynn("YOU PLAY SOME DRUM AND BASS MUSIC.")
		saynn("THE MONSTER WIGGLES TO THE BEAT.")
		addContinue("timeToTest")
	if(state == "2_jazz"):
		saynn("YOU PLAY SOME SMOOTH JAZZ. Deploying smooth jazz.")
		saynn("THE MONSTER DANCES TO THE MUSIC AND INVITES YOU TO DANCE WITH IT.")
		addContinue("timeToTest")
	
	if(state == "timeToTest"):
		saynn("THE SCIENTISTS WANT YOU TO TEST IT.")
		saynn("GUARDS BRING SOME THINGS.")
		
		addButton("Puzzle", "Let it try to solve a puzzle", "3_puzzle")
		addButton("Robot toy", "Give it a robot toy to play with", "3_toy")
		addButton("Small ladder", "See what it will do with a small ladder", "3_ladder")
		addButton("Self", "Approach the monster yourself", "3_self")
		
	if(state == "3_puzzle"):
		saynn("YOU GIVE IT A PUZZLE TO PLAY WITH.")
		saynn("THE MONSTER TRIES TO DO SOMETHING WITH IT.")
		addContinue("afterAll")
	if(state == "3_toy"):
		saynn("YOU HAND IT A ROBOT TOY.")
		saynn("THE MONSTER SNAPS ITS NECK.")
		addContinue("afterAll")
	if(state == "3_ladder"):
		saynn("YOU PLACE A SMALL LADDER NEAR THE MONSTER.")
		saynn("IT USES ITS TENTACLES TO BRING IT EVEN CLOSER. AND THEN TRIES TO CLIMB IT.")
		saynn("IT DOESN'T SEEM STRONG ENOUGH BUT IT DOES MANAGE TO PULL IT UNDER ITSELF.")
		addContinue("afterAll")
	if(state == "3_self"):
		saynn("YOU DON'T NEED ANYTHING. YOU JUST APPROACH THE MONSTER NAKED.")
		saynn("IT TOUCHES YOUR SKIN, WRAPS ONE OF ITS TENTACLES AROUND YOUR LEG.")
		addContinue("afterAll")
		
	if(state == "afterAll"):
		saynn("THE TESTS ARE OVER FOR NOW.")
		
		saynn("YOU CAN REST.")
		
		addContinue("endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	
	if(_action in ["1_meat", "2_metal", "3_toy"]):
		statAnger += 1
	if(_action in ["1_chicken", "2_dnb", "3_ladder"]):
		statAgility += 1
	if(_action in ["1_broc", "2_ambient", "3_puzzle"]):
		statMind += 1
	if(_action in ["1_milk", "2_jazz", "3_self"]):
		statLust += 1
	
	if(_action == "afterAll"):
		var whichStat:int = getBiggestStat()
		
		if(whichStat < 0):
			addMessage("NO BIGGEST STAT")
		elif(whichStat == PlayerSlaveryTentacles.STAT_ANGER):
			addMessage("ANGER INCREASE")
		elif(whichStat == PlayerSlaveryTentacles.STAT_AGILITY):
			addMessage("AGILITY INCREASE")
		elif(whichStat == PlayerSlaveryTentacles.STAT_MIND):
			addMessage("MIND INCREASE")
		elif(whichStat == PlayerSlaveryTentacles.STAT_LUST):
			addMessage("LUST INCREASE")
			
		if(whichStat > 0):
			_tentacles.incStat(whichStat)
		_tentacles.setStage(_tentacles.STAGE_TINY_AFTERTEST)
	#if(_action == "guards_leave_egg"):
	#	_tentacles.setStage(_tentacles.STAGE_EGG)
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func supportsShowingPawns() -> bool:
	return true

func getBiggestStat() -> int:
	var biggestStat:int = PlayerSlaveryTentacles.STAT_ANGER
	var biggestStatNumber:int = 0
	if(statAnger > biggestStatNumber):
		biggestStatNumber = statAnger
		biggestStat = PlayerSlaveryTentacles.STAT_ANGER
	if(statAgility > biggestStatNumber):
		biggestStatNumber = statAgility
		biggestStat = PlayerSlaveryTentacles.STAT_AGILITY
	if(statMind > biggestStatNumber):
		biggestStatNumber = statMind
		biggestStat = PlayerSlaveryTentacles.STAT_MIND
	if(statLust > biggestStatNumber):
		biggestStatNumber = statLust
		biggestStat = PlayerSlaveryTentacles.STAT_LUST
		
	var amountSame:int = 0
	if(statAnger == biggestStatNumber):
		amountSame += 1
	if(statAgility == biggestStatNumber):
		amountSame += 1
	if(statMind == biggestStatNumber):
		amountSame += 1
	if(statLust == biggestStatNumber):
		amountSame += 1
	
	if(amountSame >= 2): # No biggest stat
		return -1
	
	return biggestStat
	
func saveData():
	var data = .saveData()
	
	data["statAnger"] = statAnger
	data["statAgility"] = statAgility
	data["statMind"] = statMind
	data["statLust"] = statLust
	
	return data
	
func loadData(data):
	.loadData(data)
	
	statAnger = SAVE.loadVar(data, "statAnger", 0)
	statAgility = SAVE.loadVar(data, "statAgility", 0)
	statMind = SAVE.loadVar(data, "statMind", 0)
	statLust = SAVE.loadVar(data, "statLust", 0)
