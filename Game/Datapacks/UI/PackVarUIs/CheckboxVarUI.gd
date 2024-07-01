extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"


func setCheckboxValue(_val):
	$CheckBox.set_pressed_no_signal(_val)

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		$CheckBox.text = _dataLine["name"]
	if(_dataLine.has("value")):
		setCheckboxValue(_dataLine["value"])

func _on_CheckBox_toggled(_button_pressed):
	triggerChange($CheckBox.pressed)
