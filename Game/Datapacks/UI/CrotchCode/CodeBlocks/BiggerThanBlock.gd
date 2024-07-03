extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var leftOpSlot := CrotchSlotVar.new()
var rightOpSlot := CrotchSlotVar.new()

func _init():
	id = "BiggerThanBlock"

func getType():
	return CrotchBlocks.LOGIC

func setLeftBlock(theBlock):
	leftOpSlot.setBlock(theBlock)

func setRightBlock(theBlock):
	rightOpSlot.setBlock(theBlock)

func execute(_contex:CodeContex):
	return leftOpSlot.getValue(_contex) > rightOpSlot.getValue(_contex)

func getTemplate():
	return [
		{
			type = "slot",
			id = "left",
			slot = leftOpSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = ">",
		},
		{
			type = "slot",
			id = "right",
			slot = rightOpSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "left"):
		return leftOpSlot
	if(_id == "right"):
		return rightOpSlot
