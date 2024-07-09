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
#	if(conditionSlot.isEmpty()):
#		throwError(_contex, "Condition can't be empty")
#		return false
#
#	if(conditionSlot.getValue(_contex)):
#		return thenSlot.execute(_contex)
	var nameText = nameSlot.getValue(_contex)

	_contex.aimCameraAndSetLocName(nameText)
	#_contex.addButton(nameText, descText, nextState, codeSlot)
	
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
