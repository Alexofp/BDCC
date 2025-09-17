extends VBoxContainer

onready var locationLabel = $LocationLabel
onready var timeLabel = $timeLabel
onready var sceneCreatorLabel = $sceneCreatorLabel
var worldScene = preload("res://Game/World/World.tscn")
onready var world = $Viewport/World
signal onDevComButton
onready var compact_label = $"%CompactLabel"
onready var custom_viewport_control = $"%CustomViewportControl"


export var compactMode:bool = false

func _ready():
#	if(OS.get_name() == "Android"):
#		$CustomViewportControl/HBoxContainer.visible = true
#	else:
#		$CustomViewportControl/HBoxContainer.visible = false
	
	if(compactMode):
		compact_label.visible = true
		locationLabel.visible = false
		timeLabel.visible = false

func setLocationName(newname: String):
	locationLabel.text = newname
	if(compactMode):
		compact_label.text = timeLabel.text+". "+locationLabel.text

func onTimePassed(_secondsPassed):
	timeLabel.text = GM.main.getVisibleTime()
	if(compactMode):
		compact_label.text = timeLabel.text+". "+locationLabel.text

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

	if event is InputEventScreenTouch:
		_handle_touch(event)
	elif event is InputEventScreenDrag:
		_handle_drag(event)

func _on_MapAndTimePanel_gui_input(event):
	a_gui_input(event)


func _on_ZoomInButton_pressed():
	world.zoomOut(1.2)

func _on_ZoomOutButton_pressed():
	world.zoomIn(1.2)

var touch_points: Dictionary = {}

func _handle_touch(event: InputEventScreenTouch):
	if event.pressed:
		touch_points[event.index] = event.position
	else:
		if(touch_points.has(event.index)):
			touch_points.erase(event.index)

func _handle_drag(event: InputEventScreenDrag):
	#if touch_points.size() == 1:
		#print(touch_points)
		#offset -= event.relative / zoom.x
		#touch_points[event.index] = event.position
		#touch_points[1] = Vector2(0.0, 0.0)

	if touch_points.size() == 1 || touch_points.size() == 2:
		var pivot_point: Vector2
		
		if(touch_points.size() == 2):
			# Find the index of the other finger
			var pivot_index:int = -1
			for fingerIndex in touch_points:
				if(fingerIndex != event.index):
					pivot_index = fingerIndex
					break
			if(pivot_index < 0):
				return
			pivot_point = touch_points[pivot_index]
		else:
			pivot_point = custom_viewport_control.rect_position + custom_viewport_control.rect_size*0.5 #Vector2(0.0, 0.0)
		
		var old_point: Vector2 = touch_points[event.index]
		var new_point: Vector2 = event.position

		var old_vector: Vector2 = old_point - pivot_point
		var new_vector: Vector2 = new_point - pivot_point
		
		var delta_scale = new_vector.length() / old_vector.length()
		#zoom *= delta_scale
		world.zoomRaw(delta_scale)
		touch_points[event.index] = new_point
		
		#var drag_vector: Vector2 = event.relative
		#offset -= drag_vector / 2 * zoom
