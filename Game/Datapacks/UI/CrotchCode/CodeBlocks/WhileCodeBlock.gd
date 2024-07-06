extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var conditionSlot := CrotchSlotVar.new()
var bodySlot := CrotchSlotCalls.new()

func getCategories():
	return ["Logic"]

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	if(conditionSlot.isEmpty()):
		throwError(_contex, "Condition can't be empty")
		return false
	
	var failsafe = 0
	while(conditionSlot.getValue(_contex)):
		bodySlot.execute(_contex)
		failsafe += 1
		if(failsafe > 1000000):
			throwError(_contex, "Infinite While loop detected")
			return false
	return true

func shouldExpandTemplate():
	return true

func getTemplate():
	return [
		{
			type = "label",
			text = "WHILE",
		},
		{
			type = "slot",
			id = "conditionSlot",
			slot = conditionSlot,
			slotType = CrotchBlocks.LOGIC,
		},
		{
			type = "label",
			text = "DO",
		},
		{
			type = "slot_list",
			id = "bodySlot",
			slot = bodySlot,
		},
	]

func getSlot(_id):
	if(_id == "conditionSlot"):
		return conditionSlot
	if(_id == "bodySlot"):
		return bodySlot

func getVisualBlockTheme():
	return themeControl
