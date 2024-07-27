extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var strSlot := CrotchSlotVar.new()
var str2Slot := CrotchSlotVar.new()
var str3Slot := CrotchSlotVar.new()

var op = "replace"

func getCategories():
	return ["Strings"]

func _init():
	strSlot.setRawType(CrotchVarType.STRING)
	str2Slot.setRawType(CrotchVarType.STRING)
	str3Slot.setRawType(CrotchVarType.STRING)

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var string1 = strSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return ""
	if(!isString(string1)):
		throwError(_contex, "First arg is not a string: "+str(string1))
		return ""
	var string2 = str2Slot.getValue(_contex)
	if(_contex.hadAnError()):
		return ""
	if(!isString(string2)):
		throwError(_contex, "Second arg is not a string: "+str(string2))
		return ""
	var string3 = str3Slot.getValue(_contex)
	if(_contex.hadAnError()):
		return ""
	if(!isString(string3)):
		throwError(_contex, "Third arg is not a string: "+str(string3))
		return ""

	if(op == "replace"):
		return string1.replace(string2, string3)
	else:
		return string1.replacen(string2, string3)

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
				"replace",
				"replace caseless",
			],
		},
		{
			type = "slot",
			id = "str2",
			slot = str2Slot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "what",
		},
		{
			type = "label",
			text = "with",
		},
		{
			type = "slot",
			id = "str3",
			slot = str3Slot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "new",
		},
	]

func getSlot(_id):
	if(_id == "str"):
		return strSlot
	if(_id == "str2"):
		return str2Slot
	if(_id == "str3"):
		return str3Slot

func applyRawValue(_id, _value):
	if(_id == "op"):
		op = _value

func saveData():
	var data = .saveData()
	
	data["op"] = op
	
	return data

func loadData(_data):
	.loadData(_data)
	
	op = loadVar(_data, "op", "replace")
