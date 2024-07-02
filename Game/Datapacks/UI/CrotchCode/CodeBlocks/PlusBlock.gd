extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var leftOpSlot := CrotchSlotVar.new()
var rightOpSlot := CrotchSlotVar.new()

func _init():
	id = "PlusBlock"

func setLeftBlock(theBlock):
	leftOpSlot.setBlock(theBlock)

func setRightBlock(theBlock):
	rightOpSlot.setBlock(theBlock)

func execute():
	return leftOpSlot.getValue() + rightOpSlot.getValue()

func getTemplate():
	return [
		{
			type = "slot",
			id = "left",
			slot = leftOpSlot,
		},
		{
			type = "label",
			text = "PLUS",
		},
		{
			type = "slot",
			id = "right",
			slot = rightOpSlot,
		},
	]

func getSlot(_id):
	if(_id == "left"):
		return leftOpSlot
	if(_id == "right"):
		return rightOpSlot
