extends VBoxContainer

onready var grid = $FlexGridContainer
onready var nameLabel = $NameLabel
onready var creditsLabel = $CreditsLabel
#onready var camera = $ViewportContainer/Viewport/Camera2D
onready var camera3d = $ViewportWrapper/Viewport/Camera
onready var stage3d = $ViewportWrapper/Viewport/Stage3D
onready var viewport = $ViewportWrapper/Viewport
#onready var viewport = $ViewportContainer/Viewport
onready var staminaBar = $StaminaBar
onready var painBar = $PainBar
onready var lustBar = $HBoxContainer/LustBar
onready var levelBar = $LevelBar

onready var consciousnessBar = $ConsciousnessBar
onready var arousalBar = $HBoxContainer/ArousalBar

var previousPosition: Vector2 = Vector2(0, 0)
var startMousePosition: Vector2 = Vector2(0, 0)
var draggingCamera: bool = false
var mouseInsideViewport = false
var savedTooltipDoll = null
var savedTooltipBodypartSlot = null

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	set_process_unhandled_input(true)
	
	camera3d.current = true

func loadingSavefileFinished():
	updateUI()

func on_player_statchange():
	updateUI()

func updateUI():
	nameLabel.text = GM.pc.getName() + ", " + GM.pc.getSpeciesFullName()
	creditsLabel.text = "Work Credits: " + str(GM.pc.getCredits())

	painBar.setProgressBarValueInt(GM.pc.getPain(), GM.pc.painThreshold())
	painBar.setText( str(GM.pc.getPain()) + " / " + str(GM.pc.painThreshold()) )

	lustBar.setProgressBarValueInt(GM.pc.getLust(), GM.pc.lustThreshold())
	lustBar.setText( str(GM.pc.getLust()) + " / " + str(GM.pc.lustThreshold()) )

	staminaBar.setProgressBarValueInt(GM.pc.getStamina(), GM.pc.getMaxStamina())
	staminaBar.setText( str(GM.pc.getStamina()) + " / " + str(GM.pc.getMaxStamina()) )
	
	levelBar.setProgressBarValue(GM.pc.getSkillsHolder().getLevelProgress())
	levelBar.setText(str(GM.pc.getSkillsHolder().getLevel()))
	
	var arousal = GM.pc.getArousal()
	if(arousal > 0.0):
		arousalBar.visible = true
		arousalBar.setProgressBarValue(arousal)
		arousalBar.setText( str(Util.roundF(arousal*100.0))+"%" )
		lustBar.setText( str(Util.roundF(GM.pc.getLustLevel()*100.0))+"%" )
	else:
		arousalBar.visible = false
		arousalBar.setProgressBarValue(0.0)

	var consciousness = GM.pc.getConsciousness()
	if(consciousness < 1.0):
		levelBar.visible = false
		consciousnessBar.visible = true
		consciousnessBar.setProgressBarValue(consciousness)
		consciousnessBar.setText( str(Util.roundF(consciousness*100.0))+"%" )
	else:
		levelBar.visible = true
		consciousnessBar.visible = false
		consciousnessBar.setProgressBarValue(1.0)

func _gui_input(event: InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_MIDDLE:
		camera3d.size = 10
		camera3d.transform.origin = Vector3(0.0,4.141,50.0)
	
	if event is InputEventMouseButton:
		if(event.button_index == BUTTON_WHEEL_UP):
			camera3d.size *= 0.9
		if(event.button_index == BUTTON_WHEEL_DOWN):
			camera3d.size *= 1.1
	
	if event is InputEventMouseButton:
		if event.pressed:
			draggingCamera = true
			startMousePosition = event.position
			previousPosition = event.position
		else:
			draggingCamera = false
	elif touch_points.size() <= 1 && draggingCamera && event is InputEventMouseMotion:
		var delta = previousPosition - event.position
		camera3d.translate(Vector3(delta.x * camera3d.size / 500.0, -delta.y * camera3d.size / 500.0, 0.0))
		previousPosition = event.position

	if event is InputEventScreenTouch:
		_handle_touch(event)
	elif event is InputEventScreenDrag:
		_handle_drag(event)

func _on_ViewportContainer_mouse_exited():
	mouseInsideViewport = false

func _on_ViewportContainer_mouse_entered():
	mouseInsideViewport = true

func getStatusEffectsPanel():
	return grid

func getStage3d() -> Stage3D:
	return stage3d

func _on_ViewportWrapper_gui_input(event):
	_gui_input(event)




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

	if touch_points.size() == 2:
		var pivot_point: Vector2
		
		# Find the index of the other finger
		var pivot_index:int = -1
		for fingerIndex in touch_points:
			if(fingerIndex != event.index):
				pivot_index = fingerIndex
				break
		if(pivot_index < 0):
			return
		pivot_point = touch_points[pivot_index]
		
		var old_point: Vector2 = touch_points[event.index]
		var new_point: Vector2 = event.position

		var old_vector: Vector2 = old_point - pivot_point
		var new_vector: Vector2 = new_point - pivot_point
		
		var delta_scale = new_vector.length() / old_vector.length()
		camera3d.size *= delta_scale
		#world.zoomRaw(delta_scale)
		touch_points[event.index] = new_point
		
		var drag_vector: Vector2 = event.relative
		#offset -= drag_vector / 2 * zoom
		var offsetTranslate :Vector2 = drag_vector# / 2.0 * camera3d.zoom
		camera3d.translate(Vector3(offsetTranslate.x * camera3d.size / 500.0, -offsetTranslate.y * camera3d.size / 500.0, 0.0))
