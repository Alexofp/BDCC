extends VBoxContainer

onready var grid = $FlexGridContainer
onready var painLabel = $PainLabel
onready var lustLabel = $LustLabel
onready var nameLabel = $NameLabel
onready var creditsLabel = $CreditsLabel
onready var camera = $ViewportContainer/Viewport/Camera2D
onready var doll = $ViewportContainer/Viewport/Doll
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var previousPosition: Vector2 = Vector2(0, 0)
var draggingCamera: bool = false
var mouseInsideViewport = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var _signal = GM.pc.connect("stat_changed", self, "on_player_statchange")
	updateUI()
	set_process_input(true)
	set_process_unhandled_input(true)
	
	var _s = GM.pc.connect("bodypart_changed", self, "on_player_bodypartchange")
	doll.loadFromPlayer(GM.pc)

func on_player_bodypartchange():
	doll.loadFromPlayer(GM.pc)

func on_player_statchange():
	updateUI()

func updateUI():
	nameLabel.text = GM.pc.getName()
	painLabel.text = "Pain: "+str(GM.pc.getPain())
	lustLabel.text = "Lust: "+str(GM.pc.getLust())
	creditsLabel.text = "Work Credits: " + str(GM.pc.getCredits())

func _input(event: InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_MIDDLE && mouseInsideViewport:
		camera.position = Vector2(0, 0)
		camera.zoom = Vector2(1, 1)
	
	if event is InputEventMouseButton && mouseInsideViewport:
		if(event.button_index == BUTTON_WHEEL_UP):
			camera.zoom *= 0.9
		if(event.button_index == BUTTON_WHEEL_DOWN):
			camera.zoom *= 1.1
		
		camera.zoom.x = clamp(camera.zoom.x, 0.01, 10)
		camera.zoom.y = clamp(camera.zoom.y, 0.01, 10)
	
	if event is InputEventMouseButton && mouseInsideViewport && (event.button_index == BUTTON_LEFT || event.button_index == BUTTON_RIGHT):
		get_tree().set_input_as_handled();
		if event.is_pressed():
			if(mouseInsideViewport):
				previousPosition = event.position;
				draggingCamera = true;
		else:
			draggingCamera = false;
	elif event is InputEventMouseMotion && draggingCamera:
		get_tree().set_input_as_handled();
		camera.position += (previousPosition - event.position) * camera.zoom;
		previousPosition = event.position;

func _on_ViewportContainer_mouse_exited():
	mouseInsideViewport = false


func _on_ViewportContainer_mouse_entered():
	mouseInsideViewport = true
