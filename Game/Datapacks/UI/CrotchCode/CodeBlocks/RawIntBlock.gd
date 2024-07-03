extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var rawValue:int = 0

func _init():
	id = "RawIntBlock"

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	return rawValue

func setRawValue(theValue):
	rawValue = theValue

func getTemplate():
	return [
#		{
#			type = "label",
#			text = "INT=",
#		},
		{
			id = "rawValue",
			type = "rawint", # Some text input here
			value = rawValue,
		},
	]
	
func applyRawValue(_id, _value):
	if(_id == "rawValue"):
		rawValue = _value
