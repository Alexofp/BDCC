extends Control

var flagID
var moduleID

signal changeFlagButton(moduleID, flagID)

func setNameAndValue(newtext, newvalue):
	$HBoxContainer/Label.text = str(newtext)
	$HBoxContainer/ValueLabel.text = str(newvalue)

func _on_ChangeButton_pressed():
	emit_signal("changeFlagButton", moduleID, flagID)
