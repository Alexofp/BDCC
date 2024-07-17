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
		{
			type = "label",
			text = "Raw",
		},
		{
			id = "rawValue",
			type = "rawstring", # Some text input here
			value = rawValue,
			expand = true,
		},
	]
	
func applyRawValue(_id, _value):
	if(_id == "rawValue"):
		rawValue = _value

func shouldExpandTemplate():
	return true

func saveData():
	var data = .saveData()
	
	data["rawValue"] = rawValue
	
	return data

func loadData(_data):
	.loadData(_data)
	
	rawValue = loadVar(_data, "rawValue", "")
