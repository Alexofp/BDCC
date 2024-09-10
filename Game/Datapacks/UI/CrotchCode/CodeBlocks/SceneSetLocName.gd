extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")

func getCategories():
	return ["Scene"]

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var nameText = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(nameText)):
		throwError(_contex, "Location name must be a string, got "+str(nameText)+" instead")
		return

	_contex.setLocName(nameText)
	
func shouldExpandTemplate():
	return true

func getTemplate():
	return [
		{
			type = "label",
			text = "Set loc name",
		},
		{
			type = "slot",
			id = "nameSlot",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			expand = true,
			placeholder = "Custom name",
		},
	]

func getSlot(_id):
	if(_id == "nameSlot"):
		return nameSlot
