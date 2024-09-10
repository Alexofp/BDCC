extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var listSlot := CrotchSlotVar.new()

func getCategories():
	return ["Variables"]

func _init():
	listSlot.setRawType(CrotchVarType.STRING)

func getType():
	return CrotchBlocks.VALUE

func setBlock(theBlock):
	listSlot.setBlock(theBlock)

func execute(_contex:CodeContex):
	var theValue = listSlot.getValue(_contex)
	return theValue

func getTemplate():
	return [
		{
			type = "slot",
			id = "listSlot",
			slot = listSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "listSlot"):
		return listSlot

func updateEditor(_editor):
	if(_editor != null):
		listSlot.setRawValue(_editor.getPossiblePrintStrings()[0])

func updateVisualSlot(_editor, _id, _visSlot):
	if(_editor != null):
		_visSlot.setPossibleValues(_editor.getPossiblePrintStrings())
