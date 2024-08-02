extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var conditionSlot := CrotchSlotVar.new()
var thenSlot := CrotchSlotCalls.new()
var elseSlot := CrotchSlotCalls.new()

func getCategories():
	return ["Logic"]

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	if(conditionSlot.isEmpty()):
		throwError(_contex, "Condition can't be empty")
		return false
	
	var ifValue = conditionSlot.getValue(_contex)
	if(_contex.hadAnError()):
		_contex.resetErrored()
		return false
	if(_contex.shouldReturn()):
		return true
	
	if(ifValue):
		return thenSlot.execute(_contex)
	else:
		return elseSlot.execute(_contex)

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
		{
			type = "label",
			text = "ELSE",
		},
		{
			type = "slot_list",
			id = "elseSlot",
			slot = elseSlot,
		},
	]

func getSlot(_id):
	if(_id == "conditionSlot"):
		return conditionSlot
	if(_id == "thenSlot"):
		return thenSlot
	if(_id == "elseSlot"):
		return elseSlot

func getVisualBlockTheme():
	return themeControl
