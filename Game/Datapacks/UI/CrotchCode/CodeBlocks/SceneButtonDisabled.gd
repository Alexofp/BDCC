extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var descSlot := CrotchSlotVar.new()

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	descSlot.setRawType(CrotchVarType.STRING)
	descSlot.setRawValue("")

func getCategories():
	return ["Scene"]

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var nameText = nameSlot.getValue(_contex)
	var descText = descSlot.getValue(_contex)
	
	_contex.addDisabledButton(nameText, descText)

func shouldExpandTemplate():
	return true

func getTemplate():
	return [
		{
			type = "label",
			text = "Disabled Button",
		},
		{
			type = "slot",
			id = "nameSlot",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "Name",
		},
		{
			type = "slot",
			id = "descSlot",
			slot = descSlot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "Decription",
			expand=true,
		},
	]

func getSlot(_id):
	if(_id == "nameSlot"):
		return nameSlot
	if(_id == "descSlot"):
		return descSlot

func getVisualBlockTheme():
	return themeControl
