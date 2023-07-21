extends SceneBase

func _init():
	sceneID = "Ch6TaviTalkScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		addCharacter("tavi")
		aimCameraAndSetLocName("cellblock_red_nearcell")
		
		#var taviModule = getModule("TaviModule")
		
		addButton("Leave", "Enough talking", "endthescene")
		
	
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func getDebugActions():
	if(true):
		return []
	return [
		{
			"id": "raiseObedience",
			"name": "Raise Obedience",
			"args": [
			],
		},
		{
			"id": "raiseAffection",
			"name": "Raise Affection",
			"args": [
			],
		},
		{
			"id": "setStage",
			"name": "Set Slavery Stage",
			"args": [
				{
					"id": "stage",
					"name": "Stage",
					"type": "number",
					"value": 8,
				},
			]
		},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "raiseObedience"):
		increaseFlag("RahiModule.rahiObedience", 10)
	if(_id == "raiseAffection"):
		increaseFlag("RahiModule.rahiAffection", 10)
	if(_id == "setStage"):
		setFlag("RahiModule.rahiSlaveryStage", _args["stage"])
