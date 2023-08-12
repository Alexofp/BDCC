extends Reference

var allActions = {}
var allEffects = {}

var amountOfTurns = 5

var charID = ""
var pain = 0
var targetPain = 0
var currentEffects = {}
var avaiableActions = []
var actionsLeft = 5

func _init():
	allActions = getAllActions()
	allEffects = getAllStatusEffects()

func setChar(newCharID):
	charID = newCharID

func getChar():
	return GlobalRegistry.getCharacter(charID)

func getActionsReadable():
	var result = {}
	for actionID in avaiableActions:
		var action = allActions[actionID]
		
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
	
	while(targetPain <= 0):
		targetPain = calculateTargetPain()
	resetPlayData()
	
func resetPlayData():
	pain = 0
	currentEffects.clear()
	actionsLeft = amountOfTurns

func calculateTargetPain():
	resetPlayData()
	
	for _i in range(amountOfTurns):
		var randomAction = RNG.pick(avaiableActions)
		if(pain == 0):
			var goodStartingActions = []
			for actionID in avaiableActions:
				if(allActions[actionID].has("cantBeFirstAction") && allActions[actionID]["cantBeFirstAction"]):
					continue
				goodStartingActions.append(actionID)
			randomAction = RNG.pick(goodStartingActions)
		
		#if(_i >= 3 && RNG.chance(1)):
		#	return pain
		doAction(randomAction)
	
	return pain

func hasEffect(effectID):
	return currentEffects.has(effectID) && currentEffects[effectID] > 0

func doAction(actionID):
	var action = allActions[actionID]
	if(action.has("pain")):
		var addPain = action["pain"]
		if(addPain > 0):
			if(hasEffect("shock")):
				addPain *= 0.5
		
		pain += addPain
	if(pain < 0):
		pain = 0
	
	for effectID in currentEffects.keys():
		currentEffects[effectID] -= 1
		if(currentEffects[effectID] <= 0):
			currentEffects.erase(effectID)
	
	if(action.has("effects")):
		for effect in action["effects"]:
			if(currentEffects.has(effect[0]) && currentEffects[effect[0]] > effect[1]):
				continue
			currentEffects[effect[0]] = effect[1]

func getAllDifficulties():
	return {
		0: {
			actions = ["wait", "lightspank"],
			amountOfActions = 3,
		},
		1: {
			actions = ["wait", "lightspank", "heavyspank"],
			amountOfActions = 5,
		},
	}

func getAllActions():
	return {
		"wait": {
			name = "Wait",
			desc = "Let Tavi rest for one turn. Removes 1 pain",
			shortdesc = "-1 Pain",
			pain = -1,
			cantBeFirstAction = true,
		},
		"lightspank": {
			name = "Spank lightly",
			desc = "Deliver a soft spank on Tavi's rear, adding 7 pain",
			shortdesc = "+3 Pain",
			pain = 3,
		},
		"heavyspank": {
			name = "Spank firmly",
			desc = "Deliver a firm spank on Tavi's rear, adding 10 pain and a Shock status effect for 2 turns that halves any new pain.",
			shortdesc = "+10 Pain, Shock effect for 2 turns (-50% pain on next strikes)",
			pain = 10,
			effects = [
				["shock", 2],
			]
		},
	}

func doSpecialEffect(_actionID):
	pass

func getAllStatusEffects():
	return {
		"shock": {
			name = "Shock",
			desc = "Tavi got caught off-guard but her body quickly prepares for the next strike. [color=green]-50% pain on next strikes[/color]",
		}
	}

func saveData():
	return {
		charID = charID,
		pain = pain,
		targetPain = targetPain,
		currentEffects = currentEffects,
		avaiableActions = avaiableActions,
	}

func loadData(_data):
	charID = SAVE.loadVar(_data, "charID", "tavi")
	pain = SAVE.loadVar(_data, "pain", 0)
	targetPain = SAVE.loadVar(_data, "targetPain", 0)
	currentEffects = SAVE.loadVar(_data, "currentEffects", {})
	avaiableActions = SAVE.loadVar(_data, "avaiableActions", [])
