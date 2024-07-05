extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var conditionSlot := CrotchSlotVar.new()
var thenSlot := CrotchSlotCalls.new()

func getCategories():
	return ["Logic"]

func getType():
	return CrotchBlocks.CALL

func setConditionBlock(theBlock):
	conditionSlot.setBlock(theBlock)

func addThenBlock(theBlock):
	thenSlot.addBlock(theBlock)

func execute(_contex:CodeContex):
	if(conditionSlot.isEmpty()):
		throwError(_contex, "Condition can't be empty")
		return false
	
	if(conditionSlot.getValue(_contex)):
		return thenSlot.execute(_contex)
	return false

func shouldExpandTemplate():
	return true

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
			slotType = CrotchBlocks.LOGIC,
		},
		{
			type = "label",
			text = "THEN",
		},
		{
			type = "slot_list",
			id = "thenSlot",
			slot = thenSlot,
		},
	]

func getSlot(_id):
	if(_id == "conditionSlot"):
		return conditionSlot
	if(_id == "thenSlot"):
		return thenSlot

