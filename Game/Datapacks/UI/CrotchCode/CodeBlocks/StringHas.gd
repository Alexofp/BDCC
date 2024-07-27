extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var strSlot := CrotchSlotVar.new()
var str2Slot := CrotchSlotVar.new()

var op = "has"

func getCategories():
	return ["Strings"]

func _init():
	strSlot.setRawType(CrotchVarType.STRING)
	str2Slot.setRawType(CrotchVarType.STRING)

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	var string1 = strSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	if(!isString(string1)):
		throwError(_contex, "First arg is not a string: "+str(string1))
		return false
	var string2 = str2Slot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	if(!isString(string2)):
		throwError(_contex, "Second arg is not a string: "+str(string2))
		return false

	if(op == "has"):
		return (string2 in string1)
	if(op == "begins with"):
		return string1.begins_with(string2)
	if(op == "ends with"):
		return string1.ends_with(string2)

	return false

func getTemplate():
	return [
		{
			type = "slot",
			id = "str",
			slot = strSlot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "text",
		},
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"has",
				"begins with",
				"ends with",
			],
		},
		{
			type = "slot",
			id = "str2",
			slot = str2Slot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "what",
		},
	]

func getSlot(_id):
	if(_id == "str"):
		return strSlot
	if(_id == "str2"):
		return str2Slot

func applyRawValue(_id, _value):
	if(_id == "op"):
		op = _value

func saveData():
	var data = .saveData()
	
	data["op"] = op
	
	return data

func loadData(_data):
	.loadData(_data)
	
	op = loadVar(_data, "op", "has")
