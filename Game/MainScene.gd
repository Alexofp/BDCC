extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#onready var theScene = $SceneBase
onready var gameUI = $GameUI
var theScene
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
	
	runScene(prepareScene("WorldScene"))#"TestScene"))

func prepareScene(id: String):
	var scene = GlobalRegistry.getScene(id)
	scene.initScene()
	add_child(scene)
	sceneStack.append(scene)
	return scene

func runScene(scene, args = []):
	theScene = scene
	theScene.run(args)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func removeScene(scene):
	if(sceneStack.has(scene)):
		sceneStack.erase(scene)
	if(theScene == scene):
		if(sceneStack.size() > 0):
			theScene = sceneStack.back()
		else:
			print("Error: no more scenes in the scenestack")
			theScene = null

func _on_GameUI_on_option_button(method, args):
	theScene.react(method, args)

func resume():
	if(theScene):
		theScene._resume()
