extends Control

onready var option_button = $HBoxContainer/OptionButton

const scaleOptions:Array = [
	[0.0, "Default"],
	[0.5, "50%"],
	[0.6, "60%"],
	[0.7, "70%"],
	[0.8, "80%"],
	[0.9, "90%"],
	[1.0, "100%"],
	[1.05, "105%"],
	[1.10, "110%"],
	[1.15, "115%"],
	[1.2, "120%"],
	[1.25, "125%"],
	[1.35, "135%"],
	[1.5, "150%"],
]

func _ready():
	for optionData in scaleOptions:
		option_button.add_item(optionData[1])
	option_button.select(0)


func _on_OptionButton_item_selected(index):
	if(index < 0 || index >= scaleOptions.size()):
		return
	
	if(index == 0):
		OPTIONS.applyUIScale()
		return
	
	var newScale:float = scaleOptions[index][0]
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D,SceneTree.STRETCH_ASPECT_EXPAND,Vector2(1280,720), newScale)
	
func _exit_tree():
	OPTIONS.applyUIScale()
