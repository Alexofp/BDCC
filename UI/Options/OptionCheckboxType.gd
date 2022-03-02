extends HBoxContainer

signal value_changed(categoryID, id, newvalue)

var id
var categoryID

func setOptionName(newname):
	$Label.text = newname

func setOptionValue(_newvalue):
	$Checkbox.pressed = _newvalue

func _on_Checkbox_toggled(button_pressed):
	emit_signal("value_changed", categoryID, id, button_pressed)
