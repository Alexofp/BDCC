extends "res://Scenes/SceneBase.gd"

var savedText:String = ""

func _init():
	sceneID = "PlayerTFScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("SOMETHING IS ABOUT TO HAPPEN")
		
		addButton("Continue", "See what happens..", "doTF")
		
	if(state == "afterTF"):
		saynn(savedText)
		addButton("Continue", "See what happens..", "endthescene")
		addButton("UNDO ALL", "See what happens..", "undoall")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "undoall"):
		var tfHolder:TFHolder = GM.pc.getTFHolder()
		tfHolder.undoAllTransformations()
		endScene()
		return
	if(_action == "doTF"):
		var tfHolder:TFHolder = GM.pc.getTFHolder()
		
		var result = tfHolder.doPendingTransformations({})
		savedText = result["text"]
		setState("afterTF")
		return
		
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["savedText"] = savedText

	return data
	
func loadData(data):
	.loadData(data)
	
	savedText = SAVE.loadVar(data, "savedText", "")
