extends Spatial
class_name Stage3D

var currentScene: BaseStageScene3D
onready var animPlayer = $AnimationPlayer

func _ready():
	resetToNothing() # Player is created late
	#call_deferred("play", StageScene.Duo, "kneel", {npc="nova"}) # Player is created late
	#play(StageScene.Solo, "stand")

var fading:bool = false
#signal fadingDone
func play(sceneID, actionID, args = {}, skipFade = false, forceReset = false):
	if(fading):
		while(fading):
			yield(get_tree(), "idle_frame")
	
	if(currentScene != null && currentScene.id == sceneID && !forceReset && currentScene.canTransitionTo(actionID, args)):
		currentScene.playAnimationFinal(actionID, args)
		return
	
	if(currentScene != null):
		if(!skipFade):
			fading = true
			animPlayer.play("Fade")
			yield(animPlayer, "animation_finished")
			animPlayer.play_backwards("Fade")
			fading = false
			#emit_signal("fadingDone")
		currentScene.queue_free()
		currentScene = null
	
	var newScene:BaseStageScene3D = GlobalRegistry.createStageScene(sceneID)
	if(newScene == null):
		Log.printerr("STAGE: Scene "+str(sceneID)+" wasn't found")
		return
	currentScene = newScene
	add_child(newScene)
	newScene.playAnimationFinal(actionID, args)

func updateSubAnims():
	if(currentScene != null):
		currentScene.updateSubAnims()

func resetToNothing():
	play(StageScene.Nothing, "", [], true)
