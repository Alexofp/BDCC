extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var varSlot := CrotchSlotVar.new()

func getCategories():
	return ["Game"]

func _init():
	varSlot.setRawType(CrotchVarType.NUMBER)
	varSlot.setRawValue(12*60*60)

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var amValue = varSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return

	if(!isNumber(amValue)):
		throwError(_contex, "Argument must be a number, got "+str(amValue)+" instead")
		return
	
	if(GM.main != null && is_instance_valid(GM.main)):
		GM.main.processTimeUntil(amValue)

func getTemplate():
	return [
		{
			type = "label",
			text = "Process time UNTIL",
		},
		{
			type = "slot",
			id = "var",
			slot = varSlot,
			slotType = CrotchBlocks.VALUE,
			minsize = 110,
		},
		{
			type = "label",
			text = "s",
		},
	]

func getSlot(_id):
	if(_id == "var"):
		return varSlot

