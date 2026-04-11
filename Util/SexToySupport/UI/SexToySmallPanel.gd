extends HBoxContainer

onready var popup_panel = $"%PopupPanel"

func _ready():
	pass

func _on_BPButton_pressed():
	popup_panel.popup(Rect2(
		rect_global_position+Vector2(-50, 30), Vector2(206, 175)
	))
