extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var numSlot := CrotchSlotVar.new()

var op = "round"

func getCategories():
	return ["Math"]

func _init():
	numSlot.setRawType(CrotchVarType.NUMBER)

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var theNumber = numSlot.getValue(_contex)
	
	if(_contex.hadAnError()):
		return 0.0
	
	if(!isNumber(theNumber)):
		throwError(_contex, "Value is not a number: "+str(theNumber))
		return 0.0

	if(op == "round"):
		return round(theNumber)
	if(op == "floor"):
		return floor(theNumber)
	if(op == "ceil"):
		return ceil(theNumber)
	if(op == "abs"):
		return abs(theNumber)
	if(op == "sqrt"):
		return sqrt(theNumber)

	return theNumber

func getTemplate():
	return [
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"round",
				"floor",
				"ceil",
				"abs",
				"sqrt",
			],
		},
		{
			type = "slot",
			id = "numSlot",
			slot = numSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "numSlot"):
		return numSlot

func applyRawValue(_id, _value):
	if(_id == "op"):
		op = _value

func saveData():
	var data = .saveData()
	
	data["op"] = op
	
	return data

func loadData(_data):
	.loadData(_data)
	
	op = loadVar(_data, "op", "round")
