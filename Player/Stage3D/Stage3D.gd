extends Spatial
class_name Stage3D

var currentScene: BaseStageScene3D
onready var animPlayer = $AnimationPlayer

func _ready():
	call_deferred("play", StageScene.Solo, "stand") # Player is created late
	#call_deferred("play", StageScene.Duo, "kneel", {npc="nova"}) # Player is created late
	#play(StageScene.Solo, "stand")

func play(sceneID, actionID, args = []):
	if(currentScene != null && currentScene.id == sceneID && currentScene.canTransitionTo(actionID, args)):
		currentScene.playAnimation(actionID, args)
		return
	
	if(currentScene != null):
		animPlayer.play("Fade")
		yield(animPlayer, "animation_finished")
		animPlayer.play_backwards("Fade")
		currentScene.queue_free()
		currentScene = null
	
	var newScene:BaseStageScene3D = GlobalRegistry.createStageScene(sceneID)
	if(newScene == null):
		printerr("STAGE: Scene "+str(sceneID)+" wasn't found")
		return
	currentScene = newScene
	add_child(newScene)
	newScene.playAnimation(actionID, args)

func updateSubAnims():
	if(currentScene != null):
		currentScene.updateSubAnims()
