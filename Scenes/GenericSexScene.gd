extends "res://Scenes/SceneBase.gd"

var sexEngine:SexEngine
var whatHappened = "ASD"

func _init():
	sceneID = "GenericSexScene"

func _initScene(_args = []):
	sexEngine = SexEngine.new()
	
	var top = _args[0]
	
	sexEngine.initPeople(top, "pc")
	sexEngine.generateGoals()


func _run():
	if(state == ""):
		saynn("Nya")
		
		saynn(whatHappened)
		addButton("Process", "Process", "processTurn")
		
		addButton("Close", "Close the log", "endthescene")


func _react(_action: String, _args):
	if(_action == "processTurn"):
		var turnInfo = sexEngine.processTurn()
		whatHappened = turnInfo["text"]
		setState("")
		return
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
