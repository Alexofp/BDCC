extends SceneBase

var simpleText:String = ""
var eventID:String = ""
var eventArgs:Array = []

func _init():
	sceneID = "MissionSimpleScene"

func _initScene(_args = []):
	simpleText = _args[0]
	eventID = _args[1]
	eventArgs = _args[2]
	
func _reactInit():
	GM.main.MS.getMission().onSimpleScene(eventID, eventArgs, self)

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		
		saynn(simpleText)

		addButton("Continue", "See what happens next", "endthescene")
		

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["simpleText"] = simpleText
	
	return data
	
func loadData(data):
	.loadData(data)
	
	simpleText = SAVE.loadVar(data, "simpleText", "")
