extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var leftOpSlot := CrotchSlotVar.new()
var rightOpSlot := CrotchSlotVar.new()

func getCategories():
	return ["Logic"]

func getType():
	return CrotchBlocks.LOGIC

func setLeftBlock(theBlock):
	leftOpSlot.setBlock(theBlock)

func setRightBlock(theBlock):
	rightOpSlot.setBlock(theBlock)

func execute(_contex:CodeContex):
	var leftValue = leftOpSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	
	var rightValue = rightOpSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	
	return checkThing(leftValue, rightValue)

func checkThing(a,b):
	return a && b

func getThingLabel():
	return "AND"

func getTemplate():
	return [
		{
			type = "slot",
			id = "left",
			slot = leftOpSlot,
			slotType = CrotchBlocks.LOGIC,
		},
		{
			type = "label",
			text = getThingLabel(),
		},
		{
			type = "slot",
			id = "right",
			slot = rightOpSlot,
			slotType = CrotchBlocks.LOGIC,
		},
	]

func getSlot(_id):
	if(_id == "left"):
		return leftOpSlot
	if(_id == "right"):
		return rightOpSlot
