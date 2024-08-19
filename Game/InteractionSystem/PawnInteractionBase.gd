extends Reference
class_name PawnInteractionBase

var id:String = "error"


var location:String = "main_punishment_spot"

var involvedPawns:Dictionary = {} # Role = ID
var currentPawn:String = "" # Role
var directedToPawn:String = "" # Role
var state:String = ""

var currentActionID:String = ""
var currentActionArgs:Dictionary = {}

var busyActionSeconds:int = 0
var currentActionText:String = ""
var isWaitingScene:bool = false

var cachedTarget:String = ""
var cachedPath:Array = []

var cachedLastDir:int = -1

var wasDeleted:bool = false

var textBuffer:Array = []
var actionBuffer:Array = []

func start(_pawns:Dictionary, _args:Dictionary):
	pass

func shouldRunOnMeet(_pawn1, _pawn2, _pawn2Moved:bool):
	return [false]

func getOutputText() -> String:
	return "Something something"

func getOutputTextFinal() -> String:
	textBuffer.clear()
	var methodName:String = (state if state != "" else "init")+"_text"
	if(has_method(methodName)):
		var theText = call(methodName)
		if(textBuffer.size() > 0):
			return Util.join(textBuffer, "\n\n")
		return str(theText)
	
	var theText = getOutputText()
	if(textBuffer.size() > 0):
		return Util.join(textBuffer, "\n\n")
	return str(theText)

func saynn(theText:String):
	textBuffer.append(theText)

func getAnimData() -> Array:
	return []

func getAnimDataFinal() -> Array:
	var methodName:String = (state if state != "" else "init")+"_anim"
	if(has_method(methodName)):
		return call(methodName)
	return getAnimData()

func getCharIDByRole(role:String) -> String:
	if(involvedPawns.has(role)):
		return involvedPawns[role]
	return ""

func getCharByRole(role:String):
	return GlobalRegistry.getCharacter(getCharIDByRole(role))

func getRoleChar(role:String):
	return getCharByRole(role)

func playAnimation():
	var animData = getAnimDataFinal()
	
	if(animData.size() <= 2):
		return
	
	if(animData.size() > 2):
		var extraData:Dictionary = animData[2]
		for theID in ["pc", "npc", "npc2", "npc3"]:
			if(extraData.has(theID)):
				extraData[theID] = getCharIDByRole(extraData[theID])
		for theID in ["bodyState", "npcBodyState", "npc2BodyState", "npc3BodyState"]:
			if(extraData.has(theID)):
				if(extraData[theID].has("leashedBy")):
					extraData[theID]["leashedBy"] = getCharIDByRole(extraData[theID]["leashedBy"])
	
	GM.main.playAnimation(animData[0], animData[1], animData[2] if animData.size() > 2 else {})

func addAction(theid:String, name:String, desc:String, _scoreType:String, score, time:int, extraFields:Dictionary = {}):
	var finalDic:Dictionary = {
		id = theid,
		name = name,
		desc = desc,
		score = smartScore(_scoreType,score[0],score[1],score[2],score[3]) if(score is Array) else score*getScoreTypeValue(_scoreType),
		time = time,
	}
	for extraKey in extraFields:
		finalDic[extraKey] = extraFields[extraKey]
	if(!finalDic.has("args")):
		finalDic["args"] = {}
	actionBuffer.append(finalDic)

func addDisabledAction(name:String, desc:String):
	var finalDic:Dictionary = {
		id = "",
		name = name,
		desc = desc,
		score = 0,
		time = 0,
		args = {},
		disabled=true,
	}
	actionBuffer.append(finalDic)

func getActions() -> Array:
	return []

func getActionsFinal() -> Array:
	return getTextAndActions()[1]

func getScoreTypeValueGeneric(_scoreType:String, _role1:String, _role2:String):
	var curPawn = getRolePawn(_role1)
	var dirToPawn = getRolePawn(_role2)
	if(curPawn == null || dirToPawn == null):
		return 1.0
	
	if(_scoreType == "surrender"):
		var ourPowerLevel:float = curPawn.calculatePowerScore()
		var theirPowerLevel:float = dirToPawn.calculatePowerScore()
		
		var diff:float = ourPowerLevel - theirPowerLevel
		print("POWER DIFF: ",diff)
		diff = clamp(diff, -5.0, 5.0)
		if(diff > 0.0):
			var cowardness = scorePersonalityMax(_role1, {PersonalityStat.Coward: 1.0}, true)
			
			return max(0.5 - diff, cowardness*0.3)
		else:
			var braveness = scorePersonalityMax(_role1, {PersonalityStat.Coward: -1.0}, true)
			
			return max(abs(diff)*0.2, 0.3 * (1.0-braveness))
			
	return 1.0

func getScoreTypeValue(_scoreType:String):
	return getScoreTypeValueGeneric(_scoreType, currentPawn, directedToPawn)

func smartScore(_scoreType:String, defScore:float, likeScore:float, hateScore:float, lustScore:float):
	#var curPawn = getCurrentPawn()
	var curPawnRole = currentPawn
	var dirToPawn = getDirectedToPawn()
	var dirToRole = directedToPawn
	
	var finalScore:float = defScore * getScoreTypeValue(_scoreType)
	
	finalScore += likeScore * scorePersonalityMax(curPawnRole, {PersonalityStat.Mean:-0.5}, 0.0)
	finalScore += hateScore * scorePersonalityMax(curPawnRole, {PersonalityStat.Mean:0.5}, 0.0)
	finalScore += lustScore * scorePersonalityMax(curPawnRole, {PersonalityStat.Subby:0.5, PersonalityStat.Subby:-0.5}, 0.0)
	
	if(dirToPawn != null):
		if(likeScore != 0.0):
			finalScore += scoreLike(curPawnRole, dirToRole) * likeScore
		if(hateScore != 0.0):
			finalScore += scoreHate(curPawnRole, dirToRole) * hateScore
		if(lustScore != 0.0):
			finalScore += scoreLust(curPawnRole, dirToRole) * lustScore
	
	return finalScore

func getTextAndActions() -> Array:
	actionBuffer = []
	var resultText:String = getOutputTextFinal()
	
	var methodName:String = (state if state != "" else "init")+"_actions"
	if(has_method(methodName)):
		actionBuffer.append_array(call(methodName))
	else:
		actionBuffer.append_array(getActions())
	
	return [resultText, actionBuffer]

func doAction(_id:String, _args:Dictionary, _context:Dictionary):
	pass

func doActionFinal(_id:String, _args:Dictionary, _context:Dictionary = {}):
	if(_id == "builtin_inv"):
		runScene("InventoryScene")
		return
	elif(_id == "builtin_struggle"):
		runScene("StrugglingScene")
		return
	
	var methodName:String = (state if state != "" else "init")+"_do"
	if(has_method(methodName)):
		return call(methodName, _id, _args, _context)
	return doAction(_id, _args, _context)

func getInterruptActions(_pawn:CharacterPawn) -> Array:
	return [
#		{
#			id = "test",
#			name = "INTERRUPT!",
#			desc = "Do something",
#			score = 1.0,
#			args = {},
#		},
	]

func getInterruptActionsFinal(_pawn:CharacterPawn) -> Array:
	var methodName:String = (state if state != "" else "init")+"_interruptActions"
	if(has_method(methodName)):
		return call(methodName, _pawn)
	return getInterruptActions(_pawn)

func doInterruptAction(_pawn:CharacterPawn, _id:String, _args:Dictionary, _context:Dictionary):
	pass

func doInterruptActionFinal(_pawn:CharacterPawn, _id:String, _args:Dictionary, _context:Dictionary = {}):
	var methodName:String = (state if state != "" else "init")+"_doInterrupt"
	if(has_method(methodName)):
		return call(methodName, _pawn, _id, _args, _context)
	return doInterruptAction(_pawn, _id, _args, _context)

func isPawnInvolved(pawn) -> bool:
	if(pawn is String):
		pawn = getPawn(pawn)
	for role in involvedPawns:
		if(getRolePawn(role) == pawn):
			return true
	return false

func doRemoveRole(role:String):
	if(!involvedPawns.has(role)):
		return false
	var pawn = getRolePawn(role)
	var _ok = involvedPawns.erase(role)
	if(!isPawnInvolved(pawn)):
		pawn.setInteraction(null)

func doInvolvePawn(role:String, pawn):
	if(pawn is String):
		pawn = getPawn(pawn)
	if(involvedPawns.has(role)):
		doRemoveRole(role)
	assert(!isPawnInvolved(pawn))
	
	if(!isPawnInvolved(pawn)):
		GM.main.IS.stopInteractionsForPawnID(pawn.charID)
	involvedPawns[role] = pawn.charID
	pawn.setInteraction(self)

func setState(newState:String, newRole:String, dirToRole:String = ""):
	setCurrentPawn(newRole)
	setDirectedToPawn(dirToRole)
	state = newState
	currentActionID = ""
	currentActionArgs = {}

func getState() -> String:
	return state

func setCurrentPawn(therole:String):
	currentPawn = therole

func setDirectedToPawn(theRole:String):
	if(theRole == ""):
		for role in involvedPawns:
			if(role == currentPawn):
				continue
			directedToPawn = role
			return
		directedToPawn = ""
		return
	directedToPawn = theRole

func getDirectedToPawn() -> CharacterPawn:
	if(!involvedPawns.has(directedToPawn)):
		return null
	return getRolePawn(directedToPawn)

func setCurrentRole(therole:String):
	setCurrentPawn(therole)

func getCurrentPawn() -> CharacterPawn:
	return getRolePawn(currentPawn)

func isPlayersTurn() -> bool:
	var curPawn := getCurrentPawn()
	if(curPawn == null):
		return false
	return curPawn.isPlayer()

func setPickedAction(_actionEntry, _context:Dictionary = {}):
	currentActionID = _actionEntry["id"]
	currentActionArgs = (_actionEntry["args"] if _actionEntry.has("args") else {})

	var theTime:int = 0
	if(_actionEntry.has("time")):
		theTime = _actionEntry["time"]
	busyActionSeconds = theTime
	
	if(_actionEntry.has("actionText")):
		currentActionText = _actionEntry["actionText"]
	else:
		currentActionText = ""
	
	if(_actionEntry.has("start_fight")):
		var fightersData = _actionEntry["start_fight"]
		currentActionArgs["fight"] = _actionEntry["start_fight"]
		
		var whoID:String = involvedPawns[fightersData[0]]
		var withWhomID:String = involvedPawns[fightersData[1]]
		
		if((whoID == "pc" || withWhomID == "pc") && _context.has("scene")):
			if(_context["scene"].has_method("startInteractionFight")):
				isWaitingScene = true
				_context["scene"].startInteractionFight(whoID, withWhomID)

	if(_actionEntry.has("start_sex")):
		var fightersData = _actionEntry["start_sex"]
		currentActionArgs["sex"] = _actionEntry["start_sex"]
		
		var whoID:String = involvedPawns[fightersData[0]]
		var withWhomID:String = involvedPawns[fightersData[1]]
		var sexType = SexType.DefaultSex
		if(fightersData.size() > 2):
			sexType = fightersData[2]
		
		if(_context.has("scene")):
			if(_context["scene"].has_method("startInteractionSex")):
				isWaitingScene = true
				_context["scene"].startInteractionSex(whoID, withWhomID, sexType)

func getSexResult(_args:Dictionary):
	if(_args.has("scene_result")):
		return _args["scene_result"]
	
	var _fightersData = currentActionArgs["sex"]
	
	print("SEEEEEEEEEEEX")
	# Do sex stuff here
	var newResult:Dictionary = {}
	_args["scene_result"] = newResult
	return newResult

func getFightResult(_args:Dictionary):
	if(_args.has("scene_result")):
		return _args["scene_result"]
	
	var _fightersData = currentActionArgs["fight"]
	
	print("FIIIIIIIIIIGHT")
	# Simulate fight here
	var newResult:Dictionary = {won=RNG.chance(50)}
	_args["scene_result"] = newResult
	
	doFightAftermath(_fightersData, newResult)
	
	return newResult

func doFightAftermath(_fightersData, newResult):
	var wonPawn = getRolePawn(_fightersData[0 if newResult["won"] else 1])
	var lostPawn = getRolePawn(_fightersData[1 if newResult["won"] else 0])
	if(wonPawn != null):
		wonPawn.afterWonFight()
	if(lostPawn != null):
		lostPawn.afterLostFight()

func doCurrentAction(_context:Dictionary = {}):
	if(currentActionID == "" || wasDeleted):
		return
	
	doActionFinal(currentActionID, currentActionArgs, _context)
	currentActionID = ""
	currentActionArgs = {}
	busyActionSeconds = 0

#func getNextInteractionTime() -> int:
#	return 30

func getLocation() -> String:
	return location

func isPlayerInvolved() -> bool:
	for role in involvedPawns:
		if(involvedPawns[role] == "pc"):
			return true
	return false

#func markAsUpdated():
#	lastUpdatedSeconds = GM.main.getTime()

func getPawn(pawnID:String) -> CharacterPawn:
	return GM.main.IS.getPawn(pawnID)

func getRolePawn(role:String) -> CharacterPawn:
	if(involvedPawns.has(role)):
		return getPawn(involvedPawns[role])
	return null

func getRoleID(role:String) -> String:
	if(involvedPawns.has(role)):
		return (involvedPawns[role])
	return ""

func setLocation(newLoc:String):
	location = newLoc
	
	for role in involvedPawns:
		var thePawn = getPawn(involvedPawns[role])
		if(thePawn == null):
			continue
		thePawn.setLocation(location)

func goTowards(theTarget:String):
	if(getLocation() == theTarget):
		cachedTarget = ""
		cachedPath = []
		return true
	
	if(cachedTarget != theTarget):
		cachedTarget = theTarget
		cachedPath = GM.world.calculatePath(getLocation(), cachedTarget)
		if(cachedPath.size() > 0):
			cachedPath.remove(0)
		print(getLocation(), " ", cachedTarget, " ", cachedPath)
		if(cachedPath.size() <= 0):
			cachedTarget = ""
			return false
	
	if(cachedTarget == theTarget):
		if(cachedPath.size() > 0):
			setLocation(cachedPath[0])
			cachedPath.remove(0)
	
	if(getLocation() == theTarget):
		cachedTarget = ""
		cachedPath = []
		return true
	return false

func doWander() -> bool:
	var randomDir = RNG.pick(GameWorld.getAllDirections())
	
	if(GM.world.canGoID(location, randomDir)):
		setLocation(GM.world.applyDirectionID(location, randomDir))
		return true
	return false

func doWanderGurantee() -> bool:
	var canGoDirs = []
	for theDir in GameWorld.getAllDirections():
		if(GM.world.canGoID(location, theDir)):
			canGoDirs.append(theDir)
	
	if(canGoDirs.size() <= 0):
		return false
	if(canGoDirs.size() > 1):
		canGoDirs.erase(GameWorld.getOppositeDir(cachedLastDir))
	var randomDir = RNG.pick(canGoDirs)
	cachedLastDir = randomDir
	setLocation(GM.world.applyDirectionID(location, randomDir))
	return true

func getCurrentAction() -> String:
	return currentActionID

func processTime(_howMuch:int):
	pass

func stopMe():
	GM.main.IS.stopInteraction(self)

func getDebugInfo():
	return [
		#"ID: "+str(id),
		#"Location: "+str(location),
		#"currentPawn: "+str(currentPawn),
		"currentActionID: "+str(currentActionID),
		"state: "+str(getState()),
		"busyActionSeconds: "+str(busyActionSeconds),
		"currentPawn: "+str(currentPawn),
		#"involvedPawns: "+str(involvedPawns),
	]

func receiveSceneStatusFinal(_result:Dictionary):
	isWaitingScene = false
	
	currentActionArgs["scene_result"] = _result
	
	if(currentActionArgs.has("fight")):
		doFightAftermath(currentActionArgs["fight"], currentActionArgs["scene_result"])
	
	doCurrentAction()

func isWaitingForScene() -> bool:
	return isWaitingScene

func startInteraction(interactionID:String, _involvedPawns:Dictionary, args:Dictionary = {}):
	GM.main.IS.startInteraction(interactionID, _involvedPawns, args)

func getCurrentActionText() -> String:
	return currentActionText

func isBeingSpied() -> bool:
	for role in involvedPawns:
		if(GM.main.isPawnIDBeingSpied(involvedPawns[role])):
			return true
	return false

#	currentActionID = _actionEntry["id"]
#	currentActionArgs = (_actionEntry["args"] if _actionEntry.has("args") else {})
#
#	var theTime:int = 0
#	if(_actionEntry.has("time")):
#		theTime = _actionEntry["time"]
#	busyActionSeconds = theTime

func getKeepInteractionScoreFor(_role:String):
	return 1.0

func doLookAround(role:String, keepScoreMult:float = 1.0):
	if(wasDeleted):
		return false
	if(GM.main.IS.areInteractionsDisabled()):
		return false
	var pawn = getRolePawn(role)
	var loc:String = pawn.getLocation()
	
	var allPawns:Array = GM.main.IS.getPawnsAt(loc)
	
	var allPossible:Array = []
	allPossible.append([null, getKeepInteractionScoreFor(role)*keepScoreMult])
	
	for otherPawn in allPawns:
		if(otherPawn == pawn):
			continue
		
		var interaction:PawnInteractionBase = otherPawn.getInteraction()
		if(interaction == null):
			continue
		
		for action in interaction.getInterruptActionsFinal(pawn):
			if(action["score"] > 0):
				allPossible.append([[interaction, action], action["score"]])
	
	var pickedEntry = RNG.pickWeightedPairs(allPossible)
	
	if(pickedEntry != null):
		pickedEntry[0].doInterruptActionFinal(pawn, pickedEntry[1]["id"], pickedEntry[1]["args"])
		return true
	
	return false

func doesStealControlFromPC() -> bool:
	return true

func getAllInvolvedCharIDs() -> Array:
	var result := []
	
	for role in involvedPawns:
		var pawn = getRolePawn(role)
		if(pawn != null):
			if(!result.has(pawn.charID)):
				result.append(pawn.charID)
	return result




func scoreFetish(role:String, fetishes:Dictionary, onlyPositive:bool = false) -> float:
	if(!involvedPawns.has(role)):
		Log.printerr("Bad role found: "+role)
		return 0.0
	return getRolePawn(role).scoreFetish(fetishes, onlyPositive)

func scoreFetishMax(role:String, fetishes:Dictionary, minValue:float = -999.9) -> float:
	if(!involvedPawns.has(role)):
		Log.printerr("Bad role found: "+role)
		return 0.0
	return getRolePawn(role).scoreFetishMax(fetishes, minValue)

func scorePersonality(role:String, personalityStats:Dictionary, onlyPositive:bool = false) -> float:
	if(!involvedPawns.has(role)):
		Log.printerr("Bad role found: "+role)
		return 0.0
	return getRolePawn(role).scorePersonality(personalityStats, onlyPositive)

func scorePersonalityMax(role:String, personalityStats:Dictionary, minValue:float = -999.9) -> float:
	if(!involvedPawns.has(role)):
		Log.printerr("Bad role found: "+role)
		return 0.0
	return getRolePawn(role).scorePersonalityMax(personalityStats, minValue)

func scoreExposed(role:String) -> float:
	if(!involvedPawns.has(role)):
		Log.printerr("Bad role found: "+role)
		return 0.0
	return getRolePawn(role).scoreExposed()

func scoreLike(role1:String, role2:String) -> float:
	if(!involvedPawns.has(role1) || !involvedPawns.has(role2)):
		Log.printerr("Bad roles found")
		return 0.0
	return getRolePawn(role1).scoreLike(getRoleID(role2))

func scoreHate(role1:String, role2:String) -> float:
	if(!involvedPawns.has(role1) || !involvedPawns.has(role2)):
		Log.printerr("Bad roles found")
		return 0.0
	return getRolePawn(role1).scoreHate(getRoleID(role2))

func scoreLust(role1:String, role2:String) -> float:
	if(!involvedPawns.has(role1) || !involvedPawns.has(role2)):
		Log.printerr("Bad roles found")
		return 0.0
	return getRolePawn(role1).scoreLust(getRoleID(role2))

func affectAffection(role1:String, role2:String, howMuch:float):
	if(!involvedPawns.has(role1) || !involvedPawns.has(role2)):
		Log.printerr("Bad roles found")
		return
	getRolePawn(role1).affectAffection(getRoleID(role2), howMuch)

func affectLust(role1:String, role2:String, howMuch:float):
	if(!involvedPawns.has(role1) || !involvedPawns.has(role2)):
		Log.printerr("Bad roles found")
		return
	getRolePawn(role1).affectLust(getRoleID(role2), howMuch)

func isDoingTask(_taskID:String) -> bool:
	return false

func getInvolvedPawnIDs() -> Array:
	var result := []
	
	for role in involvedPawns:
		result.append(involvedPawns[role])
	
	return result

func makeRoleExhausted(role:String):
	var pawn = getRolePawn(role)
	if(pawn == null):
		return
	pawn.makeExhausted()

func addMessage(text: String):
	GM.main.addMessage(text)

func runScene(sceneid: String, args = [], tag = ""):
	var scene = GM.main.runScene(sceneid, args)
	scene.sceneTag = tag

func sayLine(role:String, lineID:String, args:Dictionary):
	var processedArgs = {}
	for argID in args: # Assumes all the args are characters
		processedArgs[argID] = getRoleID(args[argID])
	
	saynn("[say="+role+"]"+ModularDialogue.generate(lineID, processedArgs)+"[/say]")

func doDexterityCheck(_roleActs:String, _roleReacts:String) -> bool:
	return RNG.chance(50)

func addDefeatButtons(rolePC:String, _roleNPC:String):
	if(involvedPawns.has(rolePC) && getRolePawn(rolePC).isPlayer()):
		addAction("builtin_inv", "Inventory", "Open the inventory", "default", 0.0, 0, {})
		if(GM.pc.getInventory().hasRemovableRestraints()):
			addAction("builtin_struggle", "Struggle", "Try to remove some of your restraints", "default", 0.0, 0, {})
		
		if(involvedPawns.has(_roleNPC)):
			GM.ES.triggerRun(Trigger.DefeatedDynamicNPC, [getRoleID(_roleNPC)])

func getPawnAmount() -> int:
	return involvedPawns.size()

func saveData():
	var data = {
		"loc": location,
		"iPawns": involvedPawns,
		"cPawn": currentPawn,
		"dTPawn": directedToPawn,
		"state": state,
		"cAID": currentActionID,
		"cAArgs": currentActionArgs,
		"busySecs": busyActionSeconds,
		"cAText": currentActionText,
		"ws": isWaitingScene,
		"cLD": cachedLastDir,
		"wD": wasDeleted,
		
	}
	return data

func loadData(_data):
	cachedTarget = ""
	cachedPath = []
	textBuffer = []
	actionBuffer = []

	location = SAVE.loadVar(_data, "loc", "main_punishment_spot")
	involvedPawns = SAVE.loadVar(_data, "iPawns", {})
	currentPawn = SAVE.loadVar(_data, "cPawn", "")
	directedToPawn = SAVE.loadVar(_data, "dTPawn", "")
	state = SAVE.loadVar(_data, "state", "")
	currentActionID = SAVE.loadVar(_data, "cAID", "")
	currentActionArgs = SAVE.loadVar(_data, "cAArgs", {})
	busyActionSeconds = SAVE.loadVar(_data, "busySecs", 0)
	currentActionText = SAVE.loadVar(_data, "cAText", "")
	isWaitingScene = SAVE.loadVar(_data, "ws", false)
	cachedLastDir = SAVE.loadVar(_data, "cLD", -1)
	wasDeleted = SAVE.loadVar(_data, "wD", false)
