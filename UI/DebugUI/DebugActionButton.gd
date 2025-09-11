extends HBoxContainer

var id
var args
var actionName
var isMain = false

signal onActionPressed(debugAction)

func _on_Button_pressed():
	emit_signal("onActionPressed", self)

func setText(newtext):
	$Button.text = newtext

func _ready():
	if(OPTIONS.isTouchFriendlyUI()):
		rect_min_size = Vector2(0.0, 44.0)
