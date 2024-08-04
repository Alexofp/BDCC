extends Reference
class_name PawnInteractionBase

var id:String = "error"


var location:String = "main_punishment_spot"

var involvedPawns:Dictionary = {}
var currentPawn:String = ""

var currentActionID:String = ""
var currentActionArgs:Dictionary = {}

var nextInteractionAt:int = 0

var cachedTarget:String = ""
var cachedPath:Array = []

var cachedLastDir:int = -1

func start(_pawns:Dictionary):
	pass

func getOutputText() -> String:
	return "Something something"

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

func doAction(_id:String, _args:Dictionary):
	pass

func setCurrentPawn(therole:String):
	currentPawn = therole

func getCurrentPawn() -> CharacterPawn:
	return getRolePawn(currentPawn)

func setPickedAction(_actionEntry):
	currentActionID = _actionEntry["id"]
	currentActionArgs = (_actionEntry["args"] if _actionEntry.has("args") else {})

	# Probably will have to be changed to something different
	var currentTime:int = GM.main.getTime()

	var theTime:int = 0
	if(_actionEntry.has("time")):
		theTime = _actionEntry["time"]
	nextInteractionAt = currentTime + theTime



func doCurrentAction():
	if(currentActionID == ""):
		return
	
	doAction(currentActionID, currentActionArgs)
	currentActionID = ""
	currentActionArgs = {}

#func getNextInteractionTime() -> int:
#	return 30

func getLocation() -> String:
	return location

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

func getDebugInfo():
	return [
		#"ID: "+str(id),
		#"Location: "+str(location),
		#"currentPawn: "+str(currentPawn),
		"currentActionID: "+str(currentActionID),
		"nextInteractionAt: "+str(nextInteractionAt),
		#"involvedPawns: "+str(involvedPawns),
	]
