extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"
onready var color_picker_button = $ColorPickerButton

func setColorValue(_value):
	color_picker_button.color = _value

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		$Label.text = _dataLine["name"]
	if(_dataLine.has("value")):
		setColorValue(_dataLine["value"])

var isDebouncing = false
func _on_ColorPickerButton_color_changed(_color):
	if(isDebouncing):
		return
	isDebouncing = true
	yield(get_tree().create_timer(0.3), "timeout")
	
	triggerChange(color_picker_button.color)
	
	isDebouncing = false
