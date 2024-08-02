extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var outputSlot := CrotchSlotVar.new()

func getCategories():
	return ["Game"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	outputSlot.setRawType(CrotchVarType.STRING)
	outputSlot.setRawValue("")

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var logName = str(nameSlot.getValue(_contex))
	if(_contex.hadAnError()):
		return
	var theText = str(outputSlot.getValue(_contex))
	if(_contex.hadAnError()):
		return
	_contex.addLog(logName, theText)

func getTemplate():
	return [
		{
			type = "label",
			text = "Add log",
		},
		{
			type = "slot",
			id = "name",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "Title",
			expand=true,
		},
		{
			type = "new_line",
		},
		{
			type = "slot",
			id = "outputSlot",
			slot = outputSlot,
			slotType = CrotchBlocks.VALUE,
			extraType = 1,
			expand=true,
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "outputSlot"):
		return outputSlot

func shouldExpandTemplate():
	return true
