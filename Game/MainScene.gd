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
#	theScene = GlobalRegistry.getScene("TestScene")
#	theScene.initScene(gameUI, self)
#	self.add_child(theScene)


	#theScene = prepareScene("TestScene")
	
	#theScene.connect("addButton", gameUI, "_on_SceneBase_addButton")
	#theScene.connect("addDisabledButton", gameUI, "_on_SceneBase_addDisabledButton")
	#theScene.connect("clearButtons", gameUI, "_on_SceneBase_clearButtons")
	#theScene.connect("clearText", gameUI, "_on_SceneBase_clearText")
	#theScene.connect("sayText", gameUI, "_on_SceneBase_sayText")
	
	#theScene.run()
	
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func removeScene(scene, args = []):
	if(sceneStack.has(scene)):
		if(scene == sceneStack.back()):
			sceneStack.erase(scene)
			if(sceneStack.size() > 0):
				sceneStack.back().react_scene_end(args)
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
