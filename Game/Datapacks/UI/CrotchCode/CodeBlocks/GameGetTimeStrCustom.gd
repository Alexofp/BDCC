extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var valSlot := CrotchSlotVar.new()

func _init():
	valSlot.setRawType(CrotchVarType.NUMBER)
	valSlot.setRawValue(6*60*60)

func getCategories():
	return ["Game"]

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var val = valSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	
	if(!isNumber(val)):
		throwError(_contex, "Time should be a number, got: "+str(val)+" instead")
		return
	
	return Util.getTimeStringHHMM(val)

func getTemplate():
	return [
		{
			type = "label",
			text = "Get time formatted for",
		},
		{
			type = "slot",
			id = "val",
			slot = valSlot,
			slotType = CrotchBlocks.VALUE,
			minsize = 110,
		},
		{
			type = "label",
			text = "s",
		},
	]

func getSlot(_id):
	if(_id == "val"):
		return valSlot
