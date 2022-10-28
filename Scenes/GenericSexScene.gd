extends "res://Scenes/SceneBase.gd"

var sexEngine:SexEngine
#var whatHappened = "ASD"

func _init():
	sceneID = "GenericSexScene"

func _initScene(_args = []):
	sexEngine = SexEngine.new()
	
	var top = _args[0]
	
	#sexEngine.initPeople("pc", top)
	sexEngine.initPeople(top, "pc")
	#sexEngine.initPeople(top, "rahi")
	sexEngine.generateGoals()
	
	sexEngine.start()


func _run():
	if(state == ""):
		saynn("Nya")
		
		#saynn(whatHappened)
		saynn(sexEngine.getFinalText())
		for actionInfo in sexEngine.getActions():
			addButton(actionInfo["name"], "ASD", "doAction", [actionInfo])
		
		#addButton("Process", "Process", "processTurn")
		
		addButton("Close", "Close the scene", "endthescene")


func _react(_action: String, _args):
	if(_action == "doAction"):
		sexEngine.doAction(_args[0])
		setState("")
		return
	
#	if(_action == "processTurn"):
#		var turnInfo = sexEngine.processTurn()
#		whatHappened = turnInfo["text"]
#		setState("")
#		return
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
