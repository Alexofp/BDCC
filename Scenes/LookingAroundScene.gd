extends "res://Scenes/SceneBase.gd"

var pawnID:String = ""

func _init():
	sceneID = "LookingAroundScene"

func _run():
	if(state == ""):
		setCharactersEasyList(GM.main.IS.getPawnIDsAt(GM.pc.getLocation()))
		
		saynn("Here is what's happening around you:")
		addButtonAt(14, "Back", "Enough looking around", "endthescene")
		
		var pcLoc:String = GM.pc.getLocation()
		var allPawns:Array = GM.main.IS.getPawnsAt(pcLoc)
		
		for pawnA in allPawns:
			var pawn:CharacterPawn = pawnA
			if(pawn.isPlayer()):
				continue
			var character:BaseCharacter = pawn.getCharacter()
			pawnID = pawn.charID
			
			var interaction:PawnInteractionBase = pawn.getInteraction()
			
			if(interaction == null):
				sayn("{pawn.name} is not doing anything.")
			else:
				sayn(interaction.getPreviewLineForPawn(pawn))
			
			addButton(character.getName(), "Focus your attention on this person", "focus", [pawn])
		
		pawnID = ""

	if(state == "focus"):
		var pcPawn:CharacterPawn = GM.main.IS.getPawn("pc")
		addButtonAt(14, "Back", "Go back to the previous menu", "")
		var pawn:CharacterPawn = GM.main.IS.getPawn(pawnID)
		
		if(pawn == null):
			saynn("Pawn not found, sorry.")
			#addButton("Back", "Enough spying", "")
			return
			
		addButton("Spy on", "See what they are up to", "spyon", [pawn])
			
		var interaction:PawnInteractionBase = pawn.getInteraction()
		if(interaction == null):
			saynn("{pawn.name} is not doing anything right now.")
			return
		
		#saynn("{pawn.name} is in a "+interaction.id+" interaction")
		if(interaction.getCurrentActionText() != ""):
			saynn(interaction.getCurrentActionText())
		
		interaction.playAnimation()
		saynn(interaction.getOutputTextFinal())
		
		if(pcPawn == null):
			return
		for action in interaction.getInterruptActionsFinal(pcPawn):
			addButton(action["name"], action["desc"], "doInterrupt", [pawn, interaction, action])

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "focus"):
		pawnID = _args[0].charID
	if(_action == "spyon"):
		endScene()
		runScene("SpyOnPawnScene", [_args[0].charID])
		return
	if(_action == "doInterrupt"):
		#var pawn = _args[0]
		var interaction:PawnInteractionBase = _args[1]
		var action = _args[2]
		if(interaction == null || interaction.wasDeleted):
			return
		endScene()
		
		interaction.doInterruptActionFinal(GM.main.IS.getPawn("pc"), action["id"], action["args"])
		return


	setState(_action)

func resolveCustomCharacterName(_charID):
	if(_charID == "pawn" && pawnID != ""):
		return pawnID
	
	var pawn:CharacterPawn = GM.main.IS.getPawn(pawnID)
	if(pawn == null):
		return .resolveCustomCharacterName(_charID)
	var interaction:PawnInteractionBase = pawn.getInteraction()
	if(interaction == null):
		return .resolveCustomCharacterName(_charID)

	if(interaction.involvedPawns.has(_charID)):
		return interaction.involvedPawns[_charID]
	return .resolveCustomCharacterName(_charID)

func saveData():
	var data = .saveData()
	
	data["pawnID"] = pawnID

	return data
	
func loadData(data):
	.loadData(data)
	
	pawnID = SAVE.loadVar(data, "pawnID", "")

func supportsShowingPawns() -> bool:
	return true
