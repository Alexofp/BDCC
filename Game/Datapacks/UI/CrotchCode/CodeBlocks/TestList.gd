extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var listSlot := CrotchSlotVar.new()

func _init():
	listSlot.setRawType(CrotchVarType.STRING)

func updateEditor(_editor):
	if(_editor != null):
		listSlot.setRawValue(_editor.getPossiblePrintStrings()[0])

func getType():
	return CrotchBlocks.CALL

func setBlock(theBlock):
	listSlot.setBlock(theBlock)

func execute(_contex:CodeContex):
	return listSlot.getValue(_contex)

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

func updateVisualSlot(_editor, _id, _visSlot):
	if(_editor != null):
		_visSlot.setPossibleValues(_editor.getPossiblePrintStrings())
