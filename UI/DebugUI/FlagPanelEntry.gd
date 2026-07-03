extends Control

var flagID
var moduleID
var flagKind:int = FlagType.Kind.GameFlag
var flagValue
var flagType:int = FlagType.Anything

signal changeFlagButton(flagKind, moduleID, flagID, flagValue)

func setNameAndValue(newtext, newvalue):
	$HBoxContainer/Label.text = str(newtext)
	$HBoxContainer/ValueLabel.text = str(newvalue)

func _on_ChangeButton_pressed():
	emit_signal("changeFlagButton", flagKind, moduleID, flagID, flagType, flagValue)
