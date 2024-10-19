extends VBoxContainer

onready var locationLabel = $LocationLabel
onready var timeLabel = $timeLabel
onready var sceneCreatorLabel = $sceneCreatorLabel
var worldScene = preload("res://Game/World/World.tscn")
onready var world = $Viewport/World
signal onDevComButton

func _ready():
	if(OS.get_name() == "Android"):
		$CustomViewportControl/HBoxContainer.visible = true
	else:
		$CustomViewportControl/HBoxContainer.visible = false

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

func a_gui_input(event: InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_MIDDLE:
		world.zoomReset()
	
	if event is InputEventMouseButton:
		if(event.button_index == BUTTON_WHEEL_UP):
			world.zoomOut()
		if(event.button_index == BUTTON_WHEEL_DOWN):
			world.zoomIn()

func _on_MapAndTimePanel_gui_input(event):
	a_gui_input(event)


func _on_ZoomInButton_pressed():
	world.zoomOut(1.2)

func _on_ZoomOutButton_pressed():
	world.zoomIn(1.2)
