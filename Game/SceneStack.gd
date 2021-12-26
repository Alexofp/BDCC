extends Node

var stack: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func addScene(id: String):
	var scene = GlobalRegistry.getScene(id)
	if(!scene):
		print("[SceneStack] Can't run the scene "+id)
		return null
	
	stack.append(scene)
	
func runSceneNow(id: String):
	var scene = GlobalRegistry.getScene(id)
	if(!scene):
		print("[SceneStack] Can't run the scene "+id)
		return null
	
	var result = yield(scene.run(), "completed") 
	return result
	
func run():
	while(stack.size()):
		var scene = stack.back()
		yield(scene.run(), "completed") 
	print("Stack is empty?")
