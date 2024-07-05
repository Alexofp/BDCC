extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var leftOpSlot := CrotchSlotVar.new()
var rightOpSlot := CrotchSlotVar.new()

func getCategories():
	return ["Logic"]

func _init():
	leftOpSlot.setRawType(CrotchVarType.INT)
	rightOpSlot.setRawType(CrotchVarType.INT)

func getType():
	return CrotchBlocks.LOGIC

func setLeftBlock(theBlock):
	leftOpSlot.setBlock(theBlock)

func setRightBlock(theBlock):
	rightOpSlot.setBlock(theBlock)

func execute(_contex:CodeContex):
	var leftValue = leftOpSlot.getValue(_contex)
	if(!isNumber(leftValue)):
		throwError(_contex, "Left value is not a number: "+str(leftValue))
		return false
	var rightValue = rightOpSlot.getValue(_contex)
	if(!isNumber(rightValue)):
		throwError(_contex, "Right value is not a number: "+str(rightValue))
		return false
	return leftValue > rightValue

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
