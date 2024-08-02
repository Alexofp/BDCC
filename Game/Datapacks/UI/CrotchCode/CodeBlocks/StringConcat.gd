extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var leftOpSlot := CrotchSlotVar.new()
var rightOpSlot := CrotchSlotVar.new()

func getCategories():
	return ["Strings"]

func _init():
	leftOpSlot.setRawType(CrotchVarType.STRING)
	rightOpSlot.setRawType(CrotchVarType.STRING)

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var leftValue = str(leftOpSlot.getValue(_contex))
	if(_contex.hadAnError()):
		return ""
	var rightValue = str(rightOpSlot.getValue(_contex))
	if(_contex.hadAnError()):
		return ""

	return leftValue + rightValue

func getTemplate():
	return [
		{
			type = "slot",
			id = "left",
			slot = leftOpSlot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "what",
			expand=true,
		},
		{
			type = "label",
			text = "concat",
		},
		{
			type = "slot",
			id = "right",
			slot = rightOpSlot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "with",
			expand=true,
		},
	]

func getSlot(_id):
	if(_id == "left"):
		return leftOpSlot
	if(_id == "right"):
		return rightOpSlot

func shouldExpandTemplate():
	return true
