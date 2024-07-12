extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var leftOpSlot := CrotchSlotVar.new()
var rightOpSlot := CrotchSlotVar.new()

func getCategories():
	return ["Math"]

func _init():
	leftOpSlot.setRawType(CrotchVarType.NUMBER)
	rightOpSlot.setRawType(CrotchVarType.NUMBER)

func getType():
	return CrotchBlocks.LOGIC

func setLeftBlock(theBlock):
	leftOpSlot.setBlock(theBlock)

func setRightBlock(theBlock):
	rightOpSlot.setBlock(theBlock)

func execute(_contex:CodeContex):
	var onlyNumbers = thingOnlyNumbers()
	
	var leftValue = leftOpSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	if(onlyNumbers && !isNumber(leftValue)):
		throwError(_contex, "Left value is not a number: "+str(leftValue))
		return false
	var rightValue = rightOpSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	if(onlyNumbers && !isNumber(rightValue)):
		throwError(_contex, "Right value is not a number: "+str(rightValue))
		return false
	return checkThing(leftValue, rightValue)

func thingOnlyNumbers():
	return true

func checkThing(a, b):
	return a > b

func getThingLabel():
	return ">"

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
			text = getThingLabel(),
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
