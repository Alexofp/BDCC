extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var varSlot := CrotchSlotVar.new()

func getCategories():
	return ["Game"]

func _init():
	varSlot.setRawType(CrotchVarType.STRING)
	varSlot.setRawValue("main_punishment_spot")

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var amValue = varSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return ""
	
	if(!isString(amValue)):
		throwError(_contex, "Location id must be a string, got "+str(amValue)+" instead")
		return ""
	
	if(GM.world == null || !is_instance_valid(GM.world)):
		return "!LOC NAME HERE!"
	var room = GM.world.getRoomByID(amValue)
	if(room == null):
		throwError(_contex, "Room with the id "+str(amValue)+" wasn't found!")
		return ""
	return room.getName()

func getTemplate():
	return [
		{
			type = "label",
			text = "Get loc name",
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

