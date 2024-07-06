extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var varNameSlot := CrotchSlotVar.new()
var varValueSlot := CrotchSlotVar.new()

func getCategories():
	return ["Variables"]

func _init():
	varNameSlot.setRawType(CrotchVarType.STRING)
	varNameSlot.setRawValue("")
	varValueSlot.setRawType(CrotchVarType.NUMBER)
	varValueSlot.setRawValue(1)

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var varName = str(varNameSlot.getValue(_contex))
	
	_contex.setVar(varName, _contex.getVar(varName, 0) + varValueSlot.getValue(_contex))

func getTemplate():
	return [
		{
			type = "label",
			text = "Inc",
		},
		{
			type = "slot",
			id = "varNameSlot",
			slot = varNameSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = "by",
		},
		{
			type = "slot",
			id = "varValueSlot",
			slot = varValueSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "varNameSlot"):
		return varNameSlot
	if(_id == "varValueSlot"):
		return varValueSlot
