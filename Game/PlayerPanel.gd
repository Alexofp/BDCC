extends VBoxContainer

onready var grid = $FlexGridContainer
onready var nameLabel = $NameLabel
onready var creditsLabel = $CreditsLabel
#onready var camera = $ViewportContainer/Viewport/Camera2D
onready var camera3d = $ViewportWrapper/Viewport/Camera
onready var stage3d = $ViewportWrapper/Viewport/Stage3D
onready var tooltip = $CanvasLayer/TooltipDisplay
onready var viewport = $ViewportWrapper/Viewport
#onready var viewport = $ViewportContainer/Viewport
onready var staminaBar = $StaminaBar
onready var painBar = $PainBar
onready var lustBar = $LustBar
onready var levelBar = $LevelBar

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

func _gui_input(event: InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_MIDDLE:
		camera3d.size = 10
		camera3d.transform.origin = Vector3(0.0,0.0,0.0)
	
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
	elif draggingCamera and event is InputEventMouseMotion:
		var delta = previousPosition - event.position
		camera3d.translate(Vector3(delta.x * camera3d.size / 500.0, -delta.y * camera3d.size / 500.0, 0.0))
		previousPosition = event.position

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
