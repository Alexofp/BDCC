extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var rawValue = 0

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
		{
			type = "label",
			text = "Raw",
		},
		{
			id = "rawValue",
			type = "rawint", # Some text input here
			value = rawValue,
		},
	]
	
func applyRawValue(_id, _value):
	if(_id == "rawValue"):
		rawValue = _value

func saveData():
	var data = .saveData()
	
	data["rawValue"] = rawValue
	
	return data

func loadData(_data):
	.loadData(_data)
	
	rawValue = loadVar(_data, "rawValue", 0)
	
