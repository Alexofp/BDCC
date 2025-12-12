extends SceneBase

var statAnger:int = 0
var statAgility:int = 0
var statMind:int = 0
var statLust:int = 0

func _init():
	sceneID = "PSTentacles1EggInteract"

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	
	if(state == ""):
		#aimCameraAndSetLocName(_tentacles.LOC_SCIENTISTS)
		playAnimation(StageScene.Solo, "stand")
		saynn("YOU GOTTA INSPECT THE EGG!")
		
		addButton("Observe", "Observe the egg", "doObserve")
	
	if(state == "doObserve"):
		saynn("YOU OBSERVE THE EGG.")
		saynn("IT'S AN EGG.")
		
		saynn("NOW YOU GOTTA DO SOMETHING WITH IT.")
		
		addButton("Touch it", "Touch the egg, check how it feels", "1_touch")
		addButton("Listen to it", "Sit near the egg and put your ear against it, see if it makes any noises", "1_listen")
		addButton("Kick it", "Show that egg who is boss by kicking it", "1_kick")
		addButton("Rub it", "Sit near the egg.. and start caressing its bumpy forms", "1_rub")
		
	if(state == "1_touch"):
		saynn("YOU TOUCH THE EGG.")
		saynn("IT FEELS LIKE AN EGG.")
		addContinue("needWarm")
	if(state == "1_listen"):
		saynn("YOU LISTEN TO THE EGG.")
		saynn("YOU FEEL FAINT VIBRATIONS AGAINST YOUR EAR.")
		addContinue("needWarm")
	if(state == "1_kick"):
		saynn("YOU KICK THE EGG.")
		saynn("IT STICKS TO YOUR LEG.. FEELS LIKE IT WANTS TO CONSUME IT.")
		addContinue("needWarm")
	if(state == "1_rub"):
		saynn("YOU RUB THE EGG.")
		saynn("THE EGG GETS MORE SLIMY.")
		addContinue("needWarm")
	
	if(state == "needWarm"):
		saynn("IT'S COLD SO YOU NEED TO WARM IT UP SOMEHOW.")
	
		addButton("Shove into fridge", "Shove the egg into the fridge and be done with it!", "2_fridge")
		addButton("Aim lamp at it", "Aim a big warm lamp directly at the egg", "2_aimlamp")
		addButton("Warm shower", "Place the egg under a warm shower", "2_shower")
		addButton("Use your body", "Bring the egg into the bed and cuddle it!", "2_cuddle")
	
	if(state == "2_fridge"):
		saynn("YOU SHOVE THE EGG INTO THE FRIDGE AND CLOSE IT SHUT.")
		saynn("NOW ITS TIME TO SLEEP.")
		addContinue("doSleep")
	if(state == "2_aimlamp"):
		saynn("YOU AIM A LAMP AT IT. GOOD JOB.")
		saynn("NOW ITS TIME TO SLEEP.")
		addContinue("doSleep")
	if(state == "2_shower"):
		saynn("YOU PLACE THE EGG UNDER THE WARM SHOWER.")
		saynn("THE EGG IS TWITCHING EVER SO SLIGHTLY.")
		saynn("NOW ITS TIME TO SLEEP.")
		addContinue("doSleep")
	if(state == "2_cuddle"):
		saynn("YOU PLACE THE EGG UNDER THE WARM SHOWER.")
		saynn("THE EGG IS TWITCHING EVER SO SLIGHTLY.")
		saynn("NOW ITS TIME TO SLEEP.")
		addContinue("doSleep")
	
	if(state == "doSleep"):
		saynn("YOU SLEEP IN THE BED.")
	
		addContinue("lookEggAfterSleep")
	
	if(state == "lookEggAfterSleep"):
		saynn("YOU LOOK AT THE EGG. WOW, IT GROWN.")
		saynn("IT SEEMS TO BE PULSING EVER SO SLIGHTLY TOO.")
		
		addContinue("gottaProvoke")
	
	if(state == "gottaProvoke"):
		saynn("YOU HAVE TO PROVOKE THE EGG SOMEHOW.")
		
		addButton("Peel it open", "Carefully peel the outer layer, revealing what's inside", "3_peel")
		addButton("Just observe", "You'd rather just let it do its thing", "3_watch")
		addButton("Embrace it", "Embrace the big egg and use your warmth to accelerate the process", "3_embrace")
		addButton("Hold it shut", "Hold the egg closed for as long as possible", "3_holdshut")
		
	if(state == "3_peel"):
		saynn("YOU CAREFULLY HELP PEEL THE OUTER LAYERS OF THE EGG OFF..")
		addContinue("revealTentacles")
	if(state == "3_watch"):
		saynn("YOU JUST WATCH AND OBSERVE.. THE EGG STARTS OPENING ON ITS OWN..")
		addContinue("revealTentacles")
	if(state == "3_embrace"):
		saynn("YOU EMBRACE THE EGG AND FEEL IT SQUIRM SLIGHTLY IN YOUR ARMS AS IT STARTS OPENING UP..")
		addContinue("revealTentacles")
	if(state == "3_holdshut"):
		saynn("WHO KNOWS WHAT THAT EGG WILL REVEAL. YOU USE YOUR FULL STRENGTH AND HOLD THE EGG SHUT..")
		saynn("EVENTUALLY, YOU CAN'T ANYMORE..")
		addContinue("revealTentacles")
		
	if(state == "revealTentacles"):
		saynn("SMALL TENTACLES REVEALED.")
		
		saynn("( ACTION_SPECIFIC_REACTION FROM IT HERE )")
		
		saynn("LET IT REST NOW.")
		
		addContinue("endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	
	if(_action in ["1_kick", "2_fridge", "3_holdshut"]):
		statAnger += 1
	if(_action in ["1_touch", "2_shower", "3_watch"]):
		statAgility += 1
	if(_action in ["1_listen", "2_aimlamp", "3_peel"]):
		statMind += 1
	if(_action in ["1_rub", "2_cuddle", "3_embrace"]):
		statLust += 1
	
	if(_action == "revealTentacles"):
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
		_tentacles.setStage(_tentacles.STAGE_TINY)
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
