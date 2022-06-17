extends Spatial
class_name Stage3D

var currentScene: BaseStageScene3D
var viewport
var camera

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

func _process(_delta):
	viewport = get_viewport()
	#var global_mouse_pos = get_viewport().get_mouse_position()
	camera = get_viewport().get_camera()
	#$Sprite3D.translation = get_viewport().get_camera().project_ray_origin(global_mouse_pos)
	
func _input(event: InputEvent):
	if(camera != null && (event is InputEventMouseMotion || event is InputEventMouseButton)):
		$Sprite3D.translation = camera.project_ray_origin(event.position)
