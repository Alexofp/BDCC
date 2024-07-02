extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var printSlot := CrotchSlotVar.new()

func _init():
	id = "PrintBlock"

func setBlock(theBlock):
	printSlot.setBlock(theBlock)

func execute():
	print(str(printSlot.getValue()))

func getTemplate():
	return [
		{
			type = "label",
			text = "Print",
		},
		{
			type = "slot",
			id = "printSlot",
			slot = printSlot,
		},
	]

func getSlot(_id):
	if(_id == "printSlot"):
		return printSlot
