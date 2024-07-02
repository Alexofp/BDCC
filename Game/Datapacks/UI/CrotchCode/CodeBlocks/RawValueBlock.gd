extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var rawValue

func _init():
	id = "RawValueBlock"

func execute():
	return rawValue

func setRawValue(theValue):
	rawValue = theValue

func getTemplate():
	return [
		{
			type = "label",
			text = "RAW VALUE=",
		},
		{
			type = "label", # Some text input here
			text = str(rawValue),
		},
	]
