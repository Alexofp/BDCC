extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var strSlot := CrotchSlotVar.new()

var op = "upper"

func getCategories():
	return ["Strings"]

func _init():
	strSlot.setRawType(CrotchVarType.STRING)

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var string1 = strSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return ""
	if(!isString(string1)):
		throwError(_contex, "First arg is not a string: "+str(string1))
		return ""

	if(op == "upper"):
		return string1.to_upper()
	else:
		return string1.to_lower()

func getTemplate():
	return [
		{
			type = "label",
			text = "To",
		},
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"upper",
				"lower",
			],
		},
		{
			type = "slot",
			id = "str",
			slot = strSlot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "text",
		},
	]

func getSlot(_id):
	if(_id == "str"):
		return strSlot

func applyRawValue(_id, _value):
	if(_id == "op"):
		op = _value

func saveData():
	var data = .saveData()
	
	data["op"] = op
	
	return data

func loadData(_data):
	.loadData(_data)
	
	op = loadVar(_data, "op", "upper")
