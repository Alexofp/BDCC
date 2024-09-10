extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var strSlot := CrotchSlotVar.new()

func getCategories():
	return ["Strings"]

func _init():
	strSlot.setRawType(CrotchVarType.STRING)

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var string1 = strSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	if(!isString(string1)):
		throwError(_contex, "First arg is not a string: "+str(string1))
		return false

	return string1.length()

func getTemplate():
	return [
		{
			type = "label",
			text = "Length",
		},
		{
			type = "slot",
			id = "str",
			slot = strSlot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "of text",
		},
	]

func getSlot(_id):
	if(_id == "str"):
		return strSlot
