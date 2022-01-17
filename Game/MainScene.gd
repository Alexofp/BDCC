extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#onready var theScene = $SceneBase
onready var gameUI = $GameUI
var sceneStack: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	GM.main = self
	
	runScene("WorldScene")#"TestScene")) #WorldScene
	#runScene("FightScene", ["testchar"])

func runScene(id, _args = []):
	var scene = GlobalRegistry.getScene(id)
	add_child(scene)
	sceneStack.append(scene)
	print("Starting scene "+id)
	
	scene.initScene(_args)
	scene.run()
	return scene

func removeScene(scene, args = []):
	if(sceneStack.has(scene)):
		if(scene == sceneStack.back()):
			var savedTag = scene.sceneTag
			sceneStack.erase(scene)
			if(sceneStack.size() > 0):
				sceneStack.back().react_scene_end(savedTag, args)
			if(sceneStack.size() > 0):
				sceneStack.back().run()
		else:
			sceneStack.erase(scene)
	
	if(sceneStack.size() == 0):
		print("Error: no more scenes in the scenestack")
		gameUI.clearText()
		gameUI.clearButtons()
		gameUI.say("Error: no more scenes in the scenestack. Please let the developer know")
		return

func _on_GameUI_on_option_button(method, args):
	if(sceneStack.size() > 0):
		var scene = sceneStack.back()
		
		if(sceneStack.back().react(method, args)):
			return
		if(scene.is_queued_for_deletion()):
			return

	if(sceneStack.size() > 0):
		sceneStack.back().run()

func reRun():
	if(sceneStack.size() > 0):
		sceneStack.back().run()

func loadingSavefileFinished():
	reRun()

func canSave():
	for scene in sceneStack:
		if(!scene.canSave()):
			return false
	
	return true

func saveData():
	var data = {}
	data["scenes"] = []
	for scene in sceneStack:
		var sceneData = {}
		sceneData["id"] = scene.sceneID
		sceneData["sceneData"] = scene.saveData()
		data["scenes"].append(sceneData)
	
	return data

func loadData(data):
	var scenes = SAVE.loadVar(data, "scenes", [])
	
	for scene in sceneStack:
		scene.queue_free()
	sceneStack = []
	
	GM.ui.setCharacterData(null)
	GM.ui.setCharactersPanelVisible(false)
	for sceneData in scenes:
		var id = SAVE.loadVar(sceneData, "id", "error")
		
		var scene = GlobalRegistry.getScene(id)
		add_child(scene)
		sceneStack.append(scene)
		print("Starting scene "+id)
		
		#scene.initScene(_args)
		scene.loadData(SAVE.loadVar(sceneData, "sceneData", {}))
