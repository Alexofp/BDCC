extends VBoxContainer

onready var locationLabel = $LocationLabel
onready var timeLabel = $timeLabel
onready var sceneCreatorLabel = $sceneCreatorLabel
var worldScene = preload("res://Game/World/World.tscn")
onready var world = $Viewport/World
signal onDevComButton

func setLocationName(newname: String):
	locationLabel.text = newname

func onTimePassed(_secondsPassed):
	timeLabel.text = GM.main.getVisibleTime()

func getLocationName():
	return locationLabel.text

func setSceneCreator(newcreator, shouldShowDevCommentaryIcon = false):
	if(newcreator == null || newcreator == "" || !OPTIONS.shouldShowSceneCreator()):
		if(shouldShowDevCommentaryIcon):
			sceneCreatorLabel.visible = true
			sceneCreatorLabel.text = "[Developer Commentary]"
			return
		sceneCreatorLabel.visible = false
		return
	sceneCreatorLabel.visible = true
	sceneCreatorLabel.text = "Scene by "+str(newcreator)
	if(shouldShowDevCommentaryIcon):
		sceneCreatorLabel.text = "[DC] "+sceneCreatorLabel.text

func recreateWorld():
	if(world != null):
		world.queue_free()
		world = null
	world = worldScene.instance()
	$Viewport.add_child(world)


func _on_TextureButton_pressed():
	emit_signal("onDevComButton")
