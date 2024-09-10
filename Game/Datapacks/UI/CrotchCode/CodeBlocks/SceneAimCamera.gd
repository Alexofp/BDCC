extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("main_punishment_spot")

func getCategories():
	return ["Scene"]

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var nameText = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(nameText)):
		throwError(_contex, "Location must be a string, got "+str(nameText)+" instead")
		return

	_contex.aimCameraAndSetLocName(nameText)
	
func shouldExpandTemplate():
	return true

func getTemplate():
	return [
		{
			type = "label",
			text = "Aim camera",
		},
		{
			type = "slot",
			id = "nameSlot",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			extraType = 2,
			expand = true,
		},
	]

func getSlot(_id):
	if(_id == "nameSlot"):
		return nameSlot
