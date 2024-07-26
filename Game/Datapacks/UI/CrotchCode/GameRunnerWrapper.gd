extends Control
onready var game = $Game

signal onStopButtonPressed

var theGame

func run(datapackID, datapackScene, pickedSavePath = null):
	theGame = preload("res://Game/MainScene.tscn").instance()
	game.add_child(theGame)
	theGame.setIsTestingScene(true)
	if(pickedSavePath != null):
		SAVE.loadGame(pickedSavePath)
	#theGame.clearSceneStack()
	#theGame.runScene(newSceneID)
	theGame.loadDatapackAndDependencies(datapackID)
		
	theGame.runScene(datapackID+":"+datapackScene)
	theGame.runCurrentScene()

func _on_StopButton_pressed():
	emit_signal("onStopButtonPressed")
