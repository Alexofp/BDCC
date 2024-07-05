extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var varNameSlot := CrotchSlotVar.new()

func getCategories():
	return ["Variables"]

func _init():
	varNameSlot.setRawType(CrotchVarType.STRING)
	varNameSlot.setRawValue("")

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	return _contex.getVar(str(varNameSlot.getValue(_contex)))

func getTemplate():
	return [
		{
			type = "label",
			text = "Get",
		},
		{
			type = "slot",
			id = "varNameSlot",
			slot = varNameSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "varNameSlot"):
		return varNameSlot
