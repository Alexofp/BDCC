extends Reference
class_name PawnInteractionBase

var id:String = "error"


var location:String = "main_punishment_spot"

var involvedPawns:Dictionary = {} # Role = ID
var currentPawn:String = "" # Role
var state:String = ""

var currentActionID:String = ""
var currentActionArgs:Dictionary = {}

var busyActionSeconds:int = 0
var isNew:bool = false
var isWaitingScene:bool = false
var isWaitingAction:String = ""

var cachedTarget:String = ""
var cachedPath:Array = []

var cachedLastDir:int = -1

func start(_pawns:Dictionary):
	pass

func getOutputText() -> String:
	return "Something something"

func getOutputTextFinal() -> String:
	var methodName:String = (state if state != "" else "init")+"_text"
	if(has_method(methodName)):
		return call(methodName)
	return getOutputText()

func getActions() -> Array:
	return [
		{
			id = "test",
			name = "Test",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 60,
		},
	]

func getActionsFinal() -> Array:
	var methodName:String = (state if state != "" else "init")+"_actions"
	if(has_method(methodName)):
		return call(methodName)
	return getActions()

func doAction(_id:String, _args:Dictionary, _context:Dictionary):
	pass

func doActionFinal(_id:String, _args:Dictionary, _context:Dictionary = {}):
	var methodName:String = (state if state != "" else "init")+"_do"
	if(has_method(methodName)):
		return call(methodName, _id, _args, _context)
	return doAction(_id, _args, _context)

func setState(newState:String, newRole:String):
	setCurrentPawn(newRole)
	state = newState

func getState() -> String:
	return state

func setCurrentPawn(therole:String):
	currentPawn = therole

func getCurrentPawn() -> CharacterPawn:
	return getRolePawn(currentPawn)

func setPickedAction(_actionEntry, _context:Dictionary = {}):
	currentActionID = _actionEntry["id"]
	currentActionArgs = (_actionEntry["args"] if _actionEntry.has("args") else {})

	var theTime:int = 0
	if(_actionEntry.has("time")):
		theTime = _actionEntry["time"]
	busyActionSeconds = theTime
	
	
	if(_actionEntry.has("start_fight")):
		var fightersData = _actionEntry["start_fight"]
		currentActionArgs["fight"] = _actionEntry["start_fight"]
		
		var whoID:String = involvedPawns[fightersData[0]]
		var withWhomID:String = involvedPawns[fightersData[1]]
		
		if((whoID == "pc" || withWhomID == "pc") && _context.has("scene")):
			isWaitingScene = true
			_context["scene"].startInteractionFight(whoID, withWhomID)

func getFightResult(_args:Dictionary):
	if(_args.has("scene_result")):
		return _args["scene_result"]
	
	var _fightersData = currentActionArgs["fight"]
	return {won=RNG.chance(50)}


func doCurrentAction(_context:Dictionary = {}):
	if(currentActionID == ""):
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
		#"involvedPawns: "+str(involvedPawns),
	]

func receiveSceneStatusFinal(_result:Dictionary):
	isWaitingScene = false
	
	currentActionArgs["scene_result"] = _result
	doCurrentAction()

func isWaitingForScene() -> bool:
	return isWaitingScene



#	currentActionID = _actionEntry["id"]
#	currentActionArgs = (_actionEntry["args"] if _actionEntry.has("args") else {})
#
#	var theTime:int = 0
#	if(_actionEntry.has("time")):
#		theTime = _actionEntry["time"]
#	busyActionSeconds = theTime
