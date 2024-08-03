extends Reference
class_name InteractionSystem

var pawns:Dictionary = {}
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

	print(pawns)
	for pawnID in pawns:
		var pawn = pawns[pawnID]
		
		var interaction = pawn.getInteraction()
		if(interactions.has(interaction)):
			continue
		
		if(currentTime >= interaction.nextInteractionAt):
			var actions = interaction.getActions()
			var selectedAction = actions[0]
			
			var actionResult = interaction.doAction(selectedAction["id"], selectedAction["args"] if selectedAction.has("args") else {}, selectedAction)
			
			var theTime:int = 0
			if(actionResult != null && actionResult.has("time")):
				theTime = actionResult["time"]
			elif(selectedAction.has("time")):
				theTime = selectedAction["time"]
			interaction.nextInteractionAt = currentTime + theTime
		else:
			# still doing the current thing
			pass
		
		#pawn.processTime(_howMuch)
	pass

func spawnPawn(charID):
	if(charID == null):
		return
	var newPawn: CharacterPawn = CharacterPawn.new()
	newPawn.charID = charID
	
	pawns[charID] = newPawn

func getPawns() -> Dictionary:
	return pawns

func getPawn(charID:String) -> CharacterPawn:
	if(!pawns.has(charID)):
		return null
	return pawns[charID]

func getPawnsAt(loc:String) -> Array:
	var result := []
	
	for charID in pawns:
		var pawn = pawns[charID]
		
		if(pawn.getLocation() == loc):
			result.append(pawn)
	
	return result

func getInteractionsAt(loc:String) -> Array:
	var result := []
	
	for interaction in interactions:
		if(interaction.getLocation() == loc):
			result.append(interaction)
	
	return result

func getInteractionsThatNeedToProcessed() -> Array:
	return []
