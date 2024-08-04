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
		
		aimCameraAndSetLocName(interaction.getLocation())
		playAnimation(StageScene.Solo, "stand", {pc=pawnID})
		saynn(interaction.getOutputText())
		
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
		if(GM.main.getTime() < interaction.nextInteractionAt):
			GM.main.processTimeUntil(interaction.nextInteractionAt)
		else:
			processTime(30)
		return

	setState(_action)


func saveData():
	var data = .saveData()
	
	data["pawnID"] = pawnID

	return data
	
func loadData(data):
	.loadData(data)
	
	pawnID = SAVE.loadVar(data, "pawnID", "")
