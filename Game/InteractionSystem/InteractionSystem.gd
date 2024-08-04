extends Reference
class_name InteractionSystem

var pawns:Dictionary = {}
var pawnsByLoc:Dictionary = {}
var interactions:Array = []

func TEST_DELETE_ME():
	spawnPawn(RNG.pick(GM.main.dynamicCharacters))
	spawnPawn(RNG.pick(GM.main.dynamicCharacters))

func processTime(_howMuch:int):
#	var toUpdate:Array = getInteractionsThatNeedToProcessed()
#	while(toUpdate.size() > 0):
#		for interact in toUpdate:
#			pass
#
#		toUpdate = getInteractionsThatNeedToProcessed()
	var currentTime:int = GM.main.getTime()

	#print(pawns)
	
	for pawnID in pawns:
		var pawn = pawns[pawnID]
		pawn.processTime(_howMuch)
		
		var interaction = pawn.getInteraction()
		if(interactions.has(interaction)):
			continue
		interaction.processTime(_howMuch)
		
		if(currentTime >= interaction.nextInteractionAt):
			interaction.doCurrentAction()
			
			var actions = interaction.getActions()
			var selectedAction = actions[0]
			interaction.setPickedAction(selectedAction)
		else:
			# still doing the current thing
			pass
		
		
		#pawn.processTime(_howMuch)
	print(pawnsByLoc)
	pass

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

func deletePawn(charID):
	if(charID == null):
		return
	
	if(!pawns.has(charID)):
		return
	
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
	if(pawnsByLoc.has(oldLoc)):
		var _ok2 = pawnsByLoc[oldLoc].erase(charID)
		if(pawnsByLoc[oldLoc].empty()):
			var _ok3 = pawnsByLoc.erase(oldLoc)
	if(!pawnsByLoc.has(newLoc)):
		pawnsByLoc[newLoc] = {}
	pawnsByLoc[newLoc][charID] = true

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
