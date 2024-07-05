extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var rawValue:String = "String"

func getCategories():
	return ["Variables"]

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
#			text = "RAW VALUE=",
#		},
		{
			id = "rawValue",
			type = "rawstring", # Some text input here
			value = rawValue,
		},
	]
	
func applyRawValue(_id, _value):
	if(_id == "rawValue"):
		rawValue = _value
