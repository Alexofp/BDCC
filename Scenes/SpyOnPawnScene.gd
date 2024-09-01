extends "res://Scenes/SceneBase.gd"

var pawnID:String = ""

func _initScene(_args = []):
	pawnID = _args[0]

func _init():
	sceneID = "SpyOnPawnScene"

func _run():
	if(state == ""):
		var pawn:CharacterPawn = GM.main.IS.getPawn(pawnID)
		
		if(pawn == null):
			saynn("Pawn not found, sorry.")
			addButton("Close scene", "Enough spying", "endthescene")
			return
		
		var interaction:PawnInteractionBase = pawn.getInteraction()
		if(interaction == null):
			saynn("Pawn is not doing anything, sorry.")
			addButton("Close scene", "Enough spying", "endthescene")
			return
		
		setCharactersEasyList(interaction.getAllInvolvedCharIDs())
		interaction.playAnimation()
		aimCameraAndSetLocName(interaction.getLocation())
		
		if(interaction.getCurrentActionText() != ""):
			saynn(interaction.getCurrentActionText())
		
		saynn(interaction.getOutputTextFinal())
		
		if(true):
			sayn("[b]Debug info[/b]:")
			saynn(Util.join(pawn.getDebugInfo(), "\n"))
		
		addButtonAt(14, "End", "Enough spying", "endthescene")
		
		addButton("Continue", "See what happens next", "progress_interaction")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "progress_interaction"):
		var pawn:CharacterPawn = GM.main.IS.getPawn(pawnID)
		var interaction:PawnInteractionBase = pawn.getInteraction()
		if(interaction.currentActionID == ""):
			GM.main.IS.decideNextAction(interaction, {scene=self})
		
		if(!interaction.isWaitingForScene()):
			if(interaction.busyActionSeconds > 0):
				processTime(interaction.busyActionSeconds)
			else:
				processTime(30)
			interaction.doCurrentAction({scene=self})
			#GM.main.IS.decideNextAction(pawn.getInteraction(), {scene=self})
		return

	setState(_action)

func isSpyingOnInteractionsWith(_charID:String):
	if(_charID == pawnID):
		return true
	return false

func startInteractionSex(domID:String, subID:String, sexType = SexType.DefaultSex, extraParams:Dictionary = {}):
	runScene("GenericSexScene", [domID, subID, sexType, extraParams], "interaction_sex")

func sendStatusToInteraction(_result):
	var pawn:CharacterPawn = GM.main.IS.getPawn(pawnID)
	if(pawn == null):
		return
	var interaction:PawnInteractionBase = pawn.getInteraction()
	if(interaction == null):
		return
	
	interaction.receiveSceneStatusFinal(_result)

func _react_scene_end(_tag, _result):
	if(_tag == "interaction_sex"):
		sendStatusToInteraction(_result[0])

func resolveCustomCharacterName(_charID):
	var pawn:CharacterPawn = GM.main.IS.getPawn(pawnID)
	if(pawn == null):
		return
	var interaction:PawnInteractionBase = pawn.getInteraction()
	if(interaction == null):
		return
	
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
