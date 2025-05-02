extends "res://Scenes/SceneBase.gd"

var savedText:String = ""
var tfCount:int = 0

func _init():
	sceneID = "PlayerTFScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.TFLook, "start")
		saynn("A strange sensation begins to wash over you..")
		
		saynn("Something is happening to your body.. you can feel it..")
		
		addButton("Continue", "See what happens..", "doTF")
		
	if(state == "afterTF"):
		#if(tfCount >= 2):
		#	saynn("But that's not all..")
		
		saynn(savedText)
		
		var tfHolder:TFHolder = GM.pc.getTFHolder()
		if(tfHolder.hasPendingTransformations()):
			saynn("You get a feeling that something else is about to happen to you..")
			
			addButton("More??", "See what happens to you next..", "doTF")
		else:
			addButton("Continue", "You changed..", "endthescene")
		
		#if(true):
		#	addButton("UNDO ALL", "See what happens..", "undoall")

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
		
		var result:Dictionary = tfHolder.doFirstPendingTransformation({})
		savedText = result["text"]
		
		if(result.has("say") && result["say"] != ""):
			savedText += "\n\n[say=pc]"+result["say"]+"[/say]"
		
		tfCount += 1
		
		if(result.has("anim") && result["anim"].size() > 2):
			var animInfo:Array = result["anim"]
			playAnimation(animInfo[0], animInfo[1], animInfo[2])
		
		setState("afterTF")
		return
		
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["savedText"] = savedText
	data["tfCount"] = tfCount

	return data
	
func loadData(data):
	.loadData(data)
	
	savedText = SAVE.loadVar(data, "savedText", "")
	tfCount = SAVE.loadVar(data, "tfCount", 0)
