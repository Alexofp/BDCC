extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var printSlot := CrotchSlotVar.new()

func getCategories():
	return ["Variables"]

func _init():
	printSlot.setRawType(CrotchVarType.STRING)
	printSlot.setRawValue("")

func getType():
	return CrotchBlocks.CALL

func setBlock(theBlock):
	printSlot.setBlock(theBlock)

func execute(_contex:CodeContex):
	var theValue = str(printSlot.getValue(_contex))
	if(_contex.hadAnError()):
		return
	_contex.doDebugPrint(theValue)

func getTemplate():
	return [
		{
			type = "label",
			text = "Console Print",
		},
		{
			type = "slot",
			id = "printSlot",
			slot = printSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
	]

func getSlot(_id):
	if(_id == "printSlot"):
		return printSlot

func shouldExpandTemplate():
	return true

func getVisualBlockTheme():
	return themeOutput
