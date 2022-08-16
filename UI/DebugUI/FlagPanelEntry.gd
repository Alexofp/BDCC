extends Control

func setNameAndValue(newtext, newvalue):
	$HBoxContainer/Label.text = str(newtext)
	$HBoxContainer/ValueLabel.text = str(newvalue)
