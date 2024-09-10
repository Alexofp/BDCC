extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var op = "useBestCondom"

func getCategories():
	return ["Lewd"]

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	return _contex.charMethod("pc", op)

func getFuncList():
	return [
		"useBestCondom",
		"useWorstCondom",
	]

func getTemplate():
	return [
		{
			type = "label",
			text = "PC",
		},
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = getFuncList(),
		},
	]

func applyRawValue(_id, _value):
	if(_id == "op"):
		op = _value

func saveData():
	var data = .saveData()
	
	data["op"] = op
	
	return data

func loadData(_data):
	.loadData(_data)
	
	op = loadVar(_data, "op", getFuncList()[0])
