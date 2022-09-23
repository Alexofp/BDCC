extends VBoxContainer

onready var locationLabel = $LocationLabel
onready var timeLabel = $timeLabel
onready var sceneCreatorLabel = $sceneCreatorLabel
var worldScene = preload("res://Game/World/World.tscn")
onready var world = $Viewport/World

func setLocationName(newname: String):
	locationLabel.text = newname

func onTimePassed(_secondsPassed):
	timeLabel.text = GM.main.getVisibleTime()

func getLocationName():
	return locationLabel.text

func setSceneCreator(newcreator):
	if(newcreator == null || newcreator == "" || !OPTIONS.shouldShowSceneCreator()):
		sceneCreatorLabel.visible = false
		return
	sceneCreatorLabel.visible = true
	sceneCreatorLabel.text = "Scene by "+str(newcreator)

func recreateWorld():
	if(world != null):
		world.queue_free()
		world = null
	world = worldScene.instance()
	$Viewport.add_child(world)
