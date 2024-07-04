extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var leftOpSlot := CrotchSlotVar.new()
var rightOpSlot := CrotchSlotVar.new()

func _init():
	leftOpSlot.setRawType(CrotchVarType.INT)
	rightOpSlot.setRawType(CrotchVarType.INT)

func getType():
	return CrotchBlocks.VALUE

func setLeftBlock(theBlock):
	leftOpSlot.setBlock(theBlock)

func setRightBlock(theBlock):
	rightOpSlot.setBlock(theBlock)

func execute(_contex:CodeContex):
	var leftValue = leftOpSlot.getValue(_contex)
	var rightValue = rightOpSlot.getValue(_contex)
	if(isString(leftValue)):
		if(!isString(rightValue)):
			throwError(_contex, "Left value is a string ("+str(leftValue)+") but the right value isn't: "+str(rightValue))
			return false
		return leftValue + rightValue
	if(!isNumber(leftValue)):
		throwError(_contex, "Left value is not a number: "+str(leftValue))
		return false
	if(!isNumber(rightValue)):
		throwError(_contex, "Right value is not a number: "+str(rightValue))
		return false
	return leftValue + rightValue

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
			text = "PLUS",
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
