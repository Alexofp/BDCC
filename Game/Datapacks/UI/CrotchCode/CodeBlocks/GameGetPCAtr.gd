extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var op = "credits"

func getCategories():
	return ["Game"]

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	if(op == "credits"):
		return _contex.charMethod("pc", "getCredits", [])
	elif(op == "intoxication"):
		return _contex.charMethod("pc", "getIntoxicationLevel", [])
	elif(op == "inmate type index"):
		return _contex.charMethod("pc", "getInmateType", [])
	elif(op == "inmate type name"):
		return _contex.charMethod("pc", "getInmateTypeString", [])
	elif(op == "location"):
		return _contex.charMethod("pc", "getLocation", [])
	elif(op == "exposure"):
		return _contex.charMethod("pc", "getExposure", [])
	
func getTemplate():
	return [
		{
			type = "label",
			text = "Get pc",
		},
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"credits",
				"intoxication",
				"inmate type index",
				"inmate type name",
				"location",
				"exposure",
			],
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
	
	op = loadVar(_data, "op", "credits")
