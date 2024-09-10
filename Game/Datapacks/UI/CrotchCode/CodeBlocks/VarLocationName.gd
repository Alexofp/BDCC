extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var varSlot := CrotchSlotVar.new()

func getCategories():
	return ["Variables"]

func _init():
	varSlot.setRawType(CrotchVarType.STRING)
	varSlot.setRawValue("main_punishment_spot")

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var amValue = varSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	
	return amValue

func getTemplate():
	return [
		{
			type = "label",
			text = "LocID",
		},
		{
			type = "slot",
			id = "var",
			slot = varSlot,
			slotType = CrotchBlocks.VALUE,
			extraType = 2,
			expand = true,
		},
	]

func getSlot(_id):
	if(_id == "var"):
		return varSlot

