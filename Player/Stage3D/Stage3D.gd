extends Spatial
class_name Stage3D

var currentScene: BaseStageScene3D

func _ready():
	call_deferred("play", StageScene.Solo, "stand") # Player is created late
	#play(StageScene.Solo, "stand")

func play(sceneID, actionID, args = []):
	if(currentScene != null && currentScene.id == sceneID):
		currentScene.playAnimation(actionID, args)
		return
	
	if(currentScene != null):
		currentScene.queue_free()
		currentScene = null
	
	var newScene:BaseStageScene3D = GlobalRegistry.createStageScene(sceneID)
	if(newScene == null):
		printerr("STAGE: Scene "+str(sceneID)+" wasn't found")
		return
	currentScene = newScene
	add_child(newScene)
	newScene.playAnimation(actionID, args)
