extends Reference
class_name InteractionSystem

var pawns:Dictionary = {}
var pawnsByLoc:Dictionary = {}
var interactions:Array = []

var globalTasks:Dictionary = {}

func TEST_DELETE_ME():
	spawnPawn("pc")
	spawnPawn(RNG.pick(GM.main.dynamicCharacters))
	spawnPawn(RNG.pick(GM.main.dynamicCharacters))

func _init():
	for taskID in GlobalRegistry.getGlobalTasks():
		var newTask = GlobalRegistry.createGlobalTask(taskID)
		globalTasks[newTask.id] = newTask

func processTime(_howMuch:int):
#	var toUpdate:Array = getInteractionsThatNeedToProcessed()
#	while(toUpdate.size() > 0):
#		for interact in toUpdate:
#			pass
#
#		toUpdate = getInteractionsThatNeedToProcessed()
	#var currentTime:int = GM.main.getTime()

	#print(pawns)
	var maxProcesses:int = 50
	
	var interaction:PawnInteractionBase = getClosestInteraction()
	while(interaction != null && _howMuch > 0):
		var interactionBusySecs:int = interaction.busyActionSeconds
		if(_howMuch < interactionBusySecs):
			break
		
		if(interactionBusySecs > 0):
			processBusyAllInteractions(interactionBusySecs)
			_howMuch -= interactionBusySecs
		interaction.doCurrentAction()
		
		if(!interaction.getCurrentPawn().isPlayer()):
			decideNextAction(interaction)
		
		maxProcesses -= 1
		if(maxProcesses <= 0):
			print("[Interaction System] HIT THE MAX PROCESS LIMIT")
			break
		interaction = getClosestInteraction()
		
	processBusyAllInteractions(_howMuch)
		
	for theinteraction in interactions:
		theinteraction.isNew = false
	print(pawnsByLoc)
	print(interactions)
	pass

func decideNextAction(interaction, _context:Dictionary = {}):
	if(interaction == null):
		assert(false, "Interation is null!")
		return
	if(interaction.wasDeleted):
		return
	var actions = interaction.getActionsFinal()
	
	if(actions == null || !(actions is Array) || actions.size() <= 0):
		Log.printerr("No actions found for interaction: "+str(interaction.id))
		return
	
	var maxScore:float = 0.0
	for action in actions:
		if(maxScore > action["score"]):
			maxScore = action["score"]
	
	var minScore:float = maxScore * 0.1 # Filtering out unlikely actions
	var possibleActions := []
	for action in actions:
		if(action["score"] >= minScore):
			possibleActions.append([action, action["score"]])
	
	if(possibleActions.size() <= 0):
		Log.printerr("No possible actions found for interaction: "+str(interaction.id))
		interaction.setPickedAction(RNG.pick(actions), _context)
		return
	
	var selectedAction = RNG.pickWeightedPairs(possibleActions)#actions[0]
	interaction.setPickedAction(selectedAction, _context)

func processBusyAllInteractions(howManySeconds:int):
	if(howManySeconds <= 0):
		return
	for pawnID in pawns:
		var pawn = pawns[pawnID]
		pawn.processTime(howManySeconds)
	for interaction in interactions:
		interaction.busyActionSeconds -= howManySeconds
		interaction.processTime(howManySeconds)

func getClosestInteraction() -> PawnInteractionBase:
	var result = null
	for interaction in interactions:
		if(interaction == null):# || interaction.isNew):
			continue
		if(result == null || interaction.busyActionSeconds < result.busyActionSeconds):
			if(!interaction.isBeingSpied() && !interaction.isWaitingForScene()):
				result = interaction
	return result

func spawnPawn(charID):
	if(charID == null):
		return
	var newPawn: CharacterPawn = CharacterPawn.new()
	newPawn.charID = charID
	
	if(pawns.has(charID)):
		deletePawn(charID)
	pawns[charID] = newPawn
	
	var loc = newPawn.getLocation()
	if(!pawnsByLoc.has(loc)):
		pawnsByLoc[loc] = {}
	pawnsByLoc[loc][charID] = true
	
	newPawn.onSpawn()

func deletePawn(charID):
	if(charID == null):
		return
	
	if(!pawns.has(charID)):
		return
	stopInteractionsForPawnID(charID)
	
	var pawn = pawns[charID]
	pawn.isDeleted = true
	var loc = pawn.getLocation()
	var _ok = pawns.erase(charID)
	if(pawnsByLoc.has(loc)):
		var _ok2 = pawnsByLoc[loc].erase(charID)

func onPawnMoved(charID, oldLoc:String, newLoc:String):
	if(charID == null):
		return
	if(oldLoc == newLoc):
		return
	var pawn = getPawn(charID)
	if(pawn == null):
		return
	if(pawnsByLoc.has(oldLoc)):
		var _ok2 = pawnsByLoc[oldLoc].erase(charID)
		if(pawnsByLoc[oldLoc].empty()):
			var _ok3 = pawnsByLoc.erase(oldLoc)
	if(!pawnsByLoc.has(newLoc)):
		pawnsByLoc[newLoc] = {}
	pawnsByLoc[newLoc][charID] = true
	
	var allNewPawns:Array = getPawnsAt(newLoc)
	for otherpawn in allNewPawns:
		if(otherpawn.charID == pawn.charID):
			continue
		
		if(otherpawn.onMeetWith(pawn, true)):
			break
		if(pawn.onMeetWith(otherpawn, false)):
			break

func getPawns() -> Dictionary:
	return pawns

func getPawn(charID:String) -> CharacterPawn:
	if(!pawns.has(charID)):
		return null
	return pawns[charID]

func getPawnsAt(loc:String) -> Array:
	if(!pawnsByLoc.has(loc)):
		return []
	var result := []
	
	for pawnID in pawnsByLoc[loc]:
		result.append(getPawn(pawnID))
#	for charID in pawns:
#		var pawn = pawns[charID]
#
#		if(pawn.getLocation() == loc):
#			result.append(pawn)
	
	return result

func getPawnIDsAt(loc:String) -> Array:
	if(!pawnsByLoc.has(loc)):
		return []
	var result := []
	
	for pawnID in pawnsByLoc[loc]:
		result.append(pawnID)
	return result

func hasPawnsAt(loc:String) -> bool:
	if(!pawnsByLoc.has(loc)):
		return false
	if(pawnsByLoc[loc].size() > 0):
		return true
	return false

func hasPawnsAtIgnorePC(loc:String) -> bool:
	if(!pawnsByLoc.has(loc)):
		return false
	for pawnID in pawnsByLoc[loc]:
		if(pawnID != "pc"):
			return true
	return false

func getInteractionsAt(loc:String) -> Array:
	var result := []
	
	for interaction in interactions:
		if(interaction.getLocation() == loc):
			result.append(interaction)
	
	return result

func getInteractionsThatNeedToProcessed() -> Array:
	return []

# slow
func rebuildPawnsByLoc():
	pawnsByLoc.clear()
	
	for pawnID in pawns:
		var pawn = pawns[pawnID]
		var loc = pawn.getLocation()
		if(!pawnsByLoc.has(loc)):
			pawnsByLoc[loc] = {}
		pawnsByLoc[loc][pawnID] = true

func clearAll():
	for charID in pawns.keys():
		deletePawn(charID)
	pawns.clear()
	interactions.clear()

func startInteraction(interactionID:String, involvedPawns:Dictionary, args:Dictionary = {}, waitUntilNextProcess:bool = true):
	var interaction = GlobalRegistry.createInteraction(interactionID)
	assert(interaction != null)
	interactions.append(interaction)
	
	for pawnRole in involvedPawns:
		#var pawn = getPawn(involvedPawns[pawnRole])
		stopInteractionsForPawnID(involvedPawns[pawnRole])
		
	for pawnRole in involvedPawns:
		var pawn = getPawn(involvedPawns[pawnRole])
		pawn.setInteraction(interaction)
	
	interaction.isNew = waitUntilNextProcess
	interaction.start(involvedPawns, args)

func stopInteraction(interaction:PawnInteractionBase):
	interactions.erase(interaction)
	interaction.wasDeleted = true
	
	for pawnRole in interaction.involvedPawns:
		var pawn = getPawn(interaction.involvedPawns[pawnRole])
		if(pawn != null):
			pawn.setInteraction(null)

func stopInteractionsForPawnID(charID:String):
	for interaction in interactions.duplicate():
		for pawnRole in interaction.involvedPawns:
			if(interaction.involvedPawns[pawnRole] == charID):
				stopInteraction(interaction)
				break

func stopInteractionsForPawn(pawn):
	stopInteractionsForPawnID(pawn.charID)

func checkOnMeetInteractions(pawn1, pawn2, pawn2Moved:bool):
	for interacitonID in GlobalRegistry.getInteractions():
		var interaction:PawnInteractionBase = GlobalRegistry.getInteractionRef(interacitonID)
		
		var shouldRunData = interaction.shouldRunOnMeet(pawn1, pawn2, pawn2Moved)
		
		if(shouldRunData[0]):
			startInteraction(interaction.id, shouldRunData[1], shouldRunData[2] if shouldRunData.size() > 2 else {})
			return true
	return false

func getGlobalTasks() -> Dictionary:
	return globalTasks

func getGlobalTask(id:String) -> GlobalTask:
	if(!globalTasks.has(id)):
		return null
	return globalTasks[id]
