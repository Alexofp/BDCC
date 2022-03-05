extends VBoxContainer

onready var grid = $FlexGridContainer
onready var nameLabel = $NameLabel
onready var creditsLabel = $CreditsLabel
onready var camera = $ViewportContainer/Viewport/Camera2D
onready var theStage = $ViewportContainer/Viewport/TheStage
onready var doll = theStage.getPlayerDoll()
onready var tooltip = $CanvasLayer/TooltipDisplay
onready var viewport = $ViewportContainer/Viewport
onready var staminaBar = $StaminaBar
onready var painBar = $PainBar
onready var lustBar = $LustBar
onready var levelBar = $LevelBar

var previousPosition: Vector2 = Vector2(0, 0)
var draggingCamera: bool = false
var mouseInsideViewport = false
var savedTooltipDoll = null
var savedTooltipBodypartSlot = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var _signal = GM.pc.connect("stat_changed", self, "on_player_statchange")
	updateUI()
	set_process_input(true)
	set_process_unhandled_input(true)
	
	var _s = GM.pc.connect("bodypart_changed", self, "on_player_bodypartchange")
	var _s2 = GM.pc.connect("animation_changed", self, "on_player_animationchange")
	doll.loadFromPlayer(GM.pc)

func on_player_bodypartchange():
	doll.loadFromPlayer(GM.pc)

func loadingSavefileFinished():
	doll.loadFromPlayer(GM.pc)
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
	theStage.setTooltipsActive(false)


func _on_ViewportContainer_mouse_entered():
	mouseInsideViewport = true
	theStage.setTooltipsActive(true)

func getStatusEffectsPanel():
	return grid
	
func on_player_animationchange(newanim):
	theStage.transitionTo(newanim)


func _on_TheStage_onBodypartMouseEntered(_who, _what):
	if(mouseInsideViewport):
		if(_who == doll):
			if(!GM.pc.hasBodypart(_what)):
				return
			
			tooltip.set_is_active(true)
			tooltip.set_text(GM.pc.getBodypartTooltipName(_what), GM.pc.getBodypartTooltipInfo(_what))
			
			savedTooltipDoll = _who
			savedTooltipBodypartSlot = _what


func _on_TheStage_onBodypartMouseExited(_who, _what):
	if(savedTooltipDoll == null || savedTooltipBodypartSlot == null || (_who == savedTooltipDoll && _what == savedTooltipBodypartSlot)):
		savedTooltipDoll = null
		savedTooltipBodypartSlot = null
		tooltip.set_is_active(false)
