extends Reference

var allActions = {}
var allEffects = {}

var amountOfTurns = 5

var pain = 0
var air = 0
var targetPain = 0
var currentEffects = {}
var avaiableActions = []
var actionsLeft = 5
var shouldSafeWord = false
var shouldEndSuccess = false
var shouldEndFail = false
var shouldEndUnconscious = false
var isBot = false
var isPlaying = true
var state = ""
var shouldPlayStateOnWin = ""
var currentDifficulty = {}
var lastAnimation = []
var lastText = ""

func _init():
	allActions = getAllActions()
	allEffects = getAllStatusEffects()

func getActionsReadable():
	var result = {}
	for actionID in getAvaiableActions():
		var action = allActions[actionID].duplicate()
		if(!action.has("desc")):
			action["desc"] = action["shortdesc"]
		
		var desc = action["shortdesc"]
		var desc2 = action["desc"]
		if(action.has("effects")):
			for effectData in action["effects"]:
				var effect = allEffects[effectData[0]]
				desc += ", "+effect["name"] +" for "+str(effectData[1])+" turns ("+effect["desc"]+")"
				desc2 += "\n"+effect["name"] +" for "+str(effectData[1])+" turns ("+effect["desc"]+")"
		action["shortdesc"] = desc
		action["desc"] = desc2
		
		result[actionID] = action
	return result

func getEffectsReadable():
	var result = []
	for effectID in currentEffects:
		var effect = allEffects[effectID]
		var howManyTurns = currentEffects[effectID]
		
		result.append(effect["name"]+": "+effect["desc"]+" (Turns left: "+str(howManyTurns)+")")
	return result

func startDifficulty(theDiff):
	var allDiffs = getAllDifficulties()
	
	var selectedDiff = allDiffs[theDiff]
	avaiableActions = selectedDiff["actions"]
	amountOfTurns = selectedDiff["amountOfActions"]
	shouldPlayStateOnWin = selectedDiff["winID"]
	currentDifficulty = selectedDiff
	
	targetPain = 0
	isPlaying = false
	while(targetPain <= 0):
		targetPain = calculateTargetPain()
	isPlaying = true
	resetPlayData()
	
func resetPlayData():
	shouldSafeWord = false
	shouldEndSuccess = false
	shouldEndFail = false
	isBot = false
	pain = 0
	air = 0
	currentEffects.clear()
	actionsLeft = amountOfTurns
	state = ""
	lastAnimation = currentDifficulty["defaultAnimation"]
	lastText = currentDifficulty["introText"]

func tryAgain():
	resetPlayData()

func getAvaiableActions():
	if(state == ""):
		return avaiableActions
	
	var theActions = []
	for actionID in allActions:
		var action = allActions[actionID]
		if(!action.has("state")):
			continue
		if(action["state"] == state):
			theActions.append(actionID)
	return theActions

func calculateTargetPain():
	resetPlayData()
	
	var sequence = []
	isBot = true
	actionsLeft = amountOfTurns
	while(actionsLeft > 0):
		var myAvaiableActions = getAvaiableActions()
		var goodStartingActions = []
		for actionID in myAvaiableActions:
			var theAction = allActions[actionID]
			if(pain == 0 && theAction.has("cantBeFirstAction") && theAction["cantBeFirstAction"]):
				continue
			if(actionsLeft == 1 && theAction.has("cantBeLastAction") && theAction["cantBeLastAction"]):
				continue
			if(theAction.has("air") && theAction["air"] > 0):
				var newAir = air + theAction["air"]
				if(newAir >= 5):
					continue
			if(sequence.size() > 0 && theAction.has("previousCantBe")):
				if(sequence.back() in theAction["previousCantBe"]):
					continue
			goodStartingActions.append(actionID)
		var randomAction
		if(goodStartingActions.size() == 0):
			randomAction = "FAIL"
			return 0
		else:
			randomAction = RNG.pick(goodStartingActions)
		
		#if(_i >= 3 && RNG.chance(1)):
		#	return pain
		#if(randomAction == "FAIL"):
		#	return 0
		doAction(randomAction)
		sequence.append(randomAction)
	
	targetPain = pain
	if(targetPain in currentDifficulty["avoidTargets"]):
		return 0
	
	if(!testSequence(sequence)):
		return 0
	print(sequence)
	
	return pain

func testSequence(sequence):
	resetPlayData()
	
	var testedActions = avaiableActions.duplicate()
	var allowedToNotUse = avaiableActions.size() - amountOfTurns
	if(allowedToNotUse < 0):
		allowedToNotUse = 0
	for actionID in sequence:
		if(testedActions.has(actionID)):
			testedActions.erase(actionID)
	if(testedActions.size() > allowedToNotUse):
		return false
	
	#var lastActionID = sequence.back()
	#if(allActions[lastActionID].has("cantBeLastAction") && allActions[lastActionID]["cantBeLastAction"]):
	#	pass
	
	var _i = 0
	for actionID in sequence:
		if(actionID == "FAIL"):
			return false
		doAction(actionID)
		if(shouldSafeWord || shouldEndUnconscious):
			return false
		_i += 1
		if(shouldEndSuccess && _i != sequence.size()):
			return false
		
	return true

func hasEffect(effectID):
	return currentEffects.has(effectID) && currentEffects[effectID] > 0

func doAction(actionID):	
	var action = allActions[actionID]
	lastText = RNG.pick(action["messages"])
	
	if(!isBot && action.has("animation")):
		lastAnimation = action["animation"]
	
	var noturnuse = (action.has("noturnusage") && action["noturnusage"])
	
	if(action.has("changestate")):
		state = action["changestate"]
	
	if(action.has("air")):
		var addAir = action["air"]
		
		air += addAir
		if(air >= 5):
			#shouldSafeWord = true
			shouldEndUnconscious = true
			return
	elif(air > 0 && (!action.has("noturnusage") || !action["noturnusage"])):
		air -= 1
	
	if(action.has("pain")):
		var addPain = action["pain"]
		#if(addPain > 0):
		for effectID in currentEffects:
			addPain = statusEffectHandleAddPain(effectID, addPain)
			#if(hasEffect("shock")):
			#	addPain *= 0.5
		
		pain += addPain
		if(addPain > 0 && pain > targetPain && !isBot):
			if(!hasEffect("highpain")):
				currentEffects["highpain"] = 2
			else:
				shouldSafeWord = true
				return
	if(pain < 0):
		pain = 0
	
	doSpecialEffect(actionID)
	
	if(hasEffect("highpain") && pain > targetPain):
		currentEffects["highpain"] = 2
	
	if(!noturnuse):
		for effectID in currentEffects.keys():
			currentEffects[effectID] -= 1
			if(currentEffects[effectID] <= 0):
				currentEffects.erase(effectID)
	
	if(action.has("effects")):
		for effect in action["effects"]:
			if(currentEffects.has(effect[0]) && currentEffects[effect[0]] > effect[1]):
				continue
			currentEffects[effect[0]] = effect[1]

	if(!noturnuse):
		actionsLeft -= 1

	if(abs(pain-targetPain) <= 0.1 && !isBot):
		shouldEndSuccess = true
		return
	
	if(!noturnuse):
		if(!isBot):
			if(actionsLeft <= 0):
				shouldEndFail = true
				return
		
func getAnimation():
	var result = lastAnimation.duplicate(true)
	var npcData = result[2]
	if(!npcData.has("npcBodyState")):
		npcData["npcBodyState"] = {}
	npcData["npcBodyState"]["naked"] = currentDifficulty["isNaked"]
	return result

func getLastText():
	return lastText

func getAllDifficulties():
	return {
		0: {
			name = "Light spanks",
			actions = ["wait", "lightspank"],
			amountOfActions = 3,
			winID = "firstspanks",
			introText = "You prepare to do some light spanking with Tavi.",
			isNaked = false,
			defaultAnimation = [StageScene.Duo, "stand", {npc="tavi"}],
			avoidTargets = [],
		},
		1: {
			name = "Firm spanks",
			actions = ["wait", "lightspank", "heavyspank"],
			amountOfActions = 5,
			winID = "firmspanks",
			introText = "You tell Tavi that you wanna experiment with applying more strength while spanking her.",
			isNaked = false,
			defaultAnimation = [StageScene.Duo, "stand", {npc="tavi"}],
			avoidTargets = [3, 5, 10, 15, 20, 6, 9, 14],
		},
		2: {
			name = "Choking",
			actions = ["wait", "heavyspank", "startchoke"],
			amountOfActions = 4,
			winID = "afterchoking",
			introText = "You tell Tavi that you wanna experiment with some breathplay. Gotta be careful not to make her pass out.",
			isNaked = true,
			defaultAnimation = [StageScene.Duo, "stand", {npc="tavi"}],
			avoidTargets = [3, 6, 9, 12, 15, 10, 15, 20, 22, 14],
		},
		3: {
			name = "Temperature play",
			actions = ["wait", "lightspank", "pourvax", "ice"],
			amountOfActions = 5,
			winID = "afterwax",
			introText = "You find some wax candles and ice cubes before telling Tavi that you wanna experiment with some temperature play. She nods and undresses for you.",
			isNaked = true,
			defaultAnimation = [StageScene.Duo, "stand", {npc="tavi"}],
			avoidTargets = [3, 6, 9, 12, 5, 15, 25, 35],
		},
		4: {
			name = "Everything",
			actions = ["wait", "lightspank", "heavyspank", "startchoke", "pourvax", "ice"],
			amountOfActions = 4,
			winID = "finalcum",
			introText = "You tell Tavi that it's time for the final challenge. You will use every tool in your arsenal on her.",
			isNaked = true,
			defaultAnimation = [StageScene.Duo, "stand", {npc="tavi"}],
			avoidTargets = [3, 6, 9, 12, 5, 10, 20, 30, 15, 25, 35, 40, 50, 45, 55, 23],
		},
	}

func getDifficultyAmount():
	return getAllDifficulties().keys().size()

func getAllActions():
	return {
		"wait": {
			name = "Wait",
			desc = "Let Tavi rest for one turn. Removes 1 pain",
			shortdesc = "-1 Pain",
			pain = -1,
			cantBeFirstAction = true,
			cantBeLastAction = true,
			animation = [StageScene.Spanking, "tease", {npc="tavi"}],
			messages = [
				"You let Tavi rest for a second. She recovers a bit.",
			],
		},
		"lightspank": {
			name = "Spank lightly",
			#desc = "Deliver a soft spank on Tavi's rear, adding 7 pain",
			shortdesc = "+3 Pain",
			pain = 3,
			animation = [StageScene.Spanking, "spank", {npc="tavi"}],
			messages = [
				"Tavi's breath hitches as your palm connects with her butt.",
				"You spank Tavi gently, making her buttcheeks slightly green.",
				"Your hand delivers a soft smack on Tavi's rear, making her butt jiggle.",
				"Tavi's mews softly as your palm lands on her fluffy butt and spanks it.",
			],
		},
		"heavyspank": {
			name = "Spank firmly",
			#desc = "Deliver a firm spank on Tavi's rear, adding 10 pain",
			shortdesc = "+10 Pain",
			pain = 10,
			effects = [
				["numb", 2],
			],
			animation = [StageScene.Spanking, "fast", {npc="tavi"}],
			messages = [
				"Tavi gasps as your hand makes contact, the sting is sharp but the next one won't have as much of an effect.",
				"A firm slap against Tavi's butt pulls a gasp from her, the sting followed by a fleeting surge of resilience to the sensation.",
				"Your palm connects with Tavi's rear in a light spank, the sensation mingling with a subtle increase in her tolerance to pain.",
				"Tavi lets out a gasp as your hand makes contact with her butt, making her buttcheeks look like 2 green apples.",
			],
		},
		"startchoke": {
			name = "Start choking",
			desc = "Start choking Tavi, doing 3 pain every turn until you stop or she loses consciousness",
			shortdesc = "+3-12 Pain",
			pain = 3,
			air = 1,
			changestate = "choking",
			previousCantBe = ["stopchoking"],
			animation = [StageScene.Choking, "idle", {npc="tavi"}],
			noturnusage = true,
			messages = [
				"Tavi gasps as you get a grasp on her throat and begin choking her slightly.",
			],
		},
		"choke": {
			name = "Choke more",
			desc = "Continue choking Tavi",
			shortdesc = "+3 Pain",
			pain = 3,
			air = 1,
			state = "choking",
			animation = [StageScene.Choking, "choke", {npc="tavi"}],
			noturnusage = true,
			messages = [
				"Tavi squirms and lets out silent gasps while you keep choking her.",
				"Tavi slowly loses her strength the more you choke her.. But she also seems to get aroused more.",
				"Tavi wiggles and holds her paws on your hands.. but doesn't stop you from choking her.",
				"The feline holds her mouth opened, her tongue out and drooling while you choke her.",
			],
		},
		"stopchoking": {
			air = 0,
			name = "Stop",
			desc = "Let Tavi breath",
			shortdesc = "Stop choking",
			changestate = "",
			state = "choking",
			animation = [StageScene.Choking, "idle", {npc="tavi"}],
			previousCantBe = ["startchoke"],
			messages = [
				"Tavi hungrily grabs air with her mouth when you stop choking her.",
			],
		},
		"pourvax": {
			name = "Pour wax",
			#desc = "Deliver a firm spank on Tavi's rear, adding 10 pain",
			shortdesc = "+5 Pain",
			pain = 5,
			effects = [
				["wax", 2],
			],
			animation = [StageScene.SexStart, "start", {npc="tavi"}],
			messages = [
				"The sensation of warm wax dripping onto Tavi's body makes her squirm and moan actively.",
				"A soft noise escapes Tavi as the wax makes contact with her inner thigh, the sensation drawing a mix of curiosity and unease.",
				"Tavi lets out a cute moan as you tip the candle enough for the wax to drip onto her crotch.",
				"A soft whimper escapes Tavi as the warmth of the wax makes contact with her pussy, the sensation a combination of discomfort and intrigue.",
			],
		},
		"ice": {
			name = "Ice",
			#desc = "Deliver a firm spank on Tavi's rear, adding 10 pain",
			shortdesc = "Halves the current pain",
			pain = 0,
			effects = [
			],
			animation = [StageScene.SexStart, "start", {npc="tavi"}],
			cantBeFirstAction = true,
			messages = [
				"An ice cube landing on Tavi's back makes her gasps and squirm actively.",
				"You teasingly press an ice cube against Tavi's nipple and hold it there until it starts melting. Tavi bites her lips and moans.",
				"Tavi lets out a long moan as you press the ice against her sensetive clit for a second, sending a wave of cool sensations through her body.",
				"Your hands place a few ice cubes on Tavi's thighs and hold her still while she tries to wiggle them off.",
			],
		}
	}

func doSpecialEffect(_actionID):
	if(_actionID == "ice"):
		pain = pain * 0.5
	if(_actionID == "pourvax"):
		if(isPlaying):
			GlobalRegistry.getCharacter("tavi").coverBodyWithFluid("HotWax", 0.2)

func getAllStatusEffects():
	return {
		"numb": {
			name = "Numbness",
			desc = "[color=#00CC00]-50% pain on next strikes[/color]", #Tavi got caught off-guard but her body quickly prepares for the next strike. 
		},
		"highpain": {
			name = "High pain",
			desc = "Tavi got pushed past her pain threshold. Another strike will make her [color=red]safeword[/color].",
		},
		"wax": {
			name = "Hot wax",
			desc = "[color=red]+100% more pain[/color]",
		},
	}

func statusEffectHandleAddPain(statusID, addPain):
	if(statusID == "numb"):
		if(addPain > 0):
			addPain *= 0.5
	if(statusID == "wax"):
		if(addPain > 0):
			addPain *= 2.0
	
	return addPain

func saveData():
	return {
		pain = pain,
		air = air,
		targetPain = targetPain,
		currentEffects = currentEffects,
		avaiableActions = avaiableActions,
		state = state,
		actionsLeft = actionsLeft,
		shouldPlayStateOnWin = shouldPlayStateOnWin,
		currentDifficulty = currentDifficulty,
		lastAnimation = lastAnimation,
		lastText = lastText,
		amountOfTurns = amountOfTurns,
	}

func loadData(_data):
	pain = SAVE.loadVar(_data, "pain", 0)
	air = SAVE.loadVar(_data, "air", 0)
	targetPain = SAVE.loadVar(_data, "targetPain", 0)
	currentEffects = SAVE.loadVar(_data, "currentEffects", {})
	avaiableActions = SAVE.loadVar(_data, "avaiableActions", [])
	state = SAVE.loadVar(_data, "state", "")
	actionsLeft = SAVE.loadVar(_data, "actionsLeft", 0)
	shouldPlayStateOnWin = SAVE.loadVar(_data, "shouldPlayStateOnWin", "")
	currentDifficulty = SAVE.loadVar(_data, "currentDifficulty", {})
	lastAnimation = SAVE.loadVar(_data, "lastAnimation", [])
	lastText = SAVE.loadVar(_data, "lastText", "")
	amountOfTurns = SAVE.loadVar(_data, "amountOfTurns", 5)
