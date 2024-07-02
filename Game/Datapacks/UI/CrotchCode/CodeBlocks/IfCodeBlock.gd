extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var conditionSlot := CrotchSlotVar.new()
var thenSlot := CrotchSlotCalls.new()

func _init():
	id = "IfCodeBlock"

func setConditionBlock(theBlock):
	conditionSlot.setBlock(theBlock)

func addThenBlock(theBlock):
	thenSlot.addBlock(theBlock)

func execute():
	if(conditionSlot.getValue()):
		return thenSlot.execute()
	return false

func getTemplate():
	return [
		{
			type = "label",
			text = "IF",
		},
		{
			type = "slot",
			id = "conditionSlot",
			slot = conditionSlot,
		},
		{
			type = "label",
			text = "THEN",
		},
		{
			type = "slot",
			id = "thenSlot",
			slot = thenSlot,
		},
	]

func getSlot(_id):
	if(_id == "conditionSlot"):
		return conditionSlot
	if(_id == "thenSlot"):
		return thenSlot
