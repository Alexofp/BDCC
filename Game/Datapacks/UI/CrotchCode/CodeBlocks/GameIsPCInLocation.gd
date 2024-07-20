extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var varSlot := CrotchSlotVar.new()

func getCategories():
	return ["Game"]

func _init():
	varSlot.setRawType(CrotchVarType.STRING)
	varSlot.setRawValue("main_punishment_spot")

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	var amValue = varSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return

	if(!isString(amValue)):
		throwError(_contex, "Argument must be a string, got "+str(amValue)+" instead")
		return
	
	return _contex.charMethod("pc", "getLocation", []) == amValue

func getTemplate():
	return [
		{
			type = "label",
			text = "Is PC in location",
		},
		{
			type = "slot",
			id = "var",
			slot = varSlot,
			slotType = CrotchBlocks.VALUE,
			extraType = 2,
			expand = true,
		},
	]

func getSlot(_id):
	if(_id == "var"):
		return varSlot

