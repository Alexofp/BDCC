extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var outputSlot := CrotchSlotVar.new()

func getCategories():
	return ["Scene"]

func _init():
	outputSlot.setRawType(CrotchVarType.STRING)
	outputSlot.setRawValue("")

func getType():
	return CrotchBlocks.CALL

func setBlock(theBlock):
	outputSlot.setBlock(theBlock)

func execute(_contex:CodeContex):
	if(!makeSureRunMode(_contex)):
		return ""
	var theText = str(outputSlot.getValue(_contex))
	if(_contex.hadAnError()):
		return ""
	_contex.saynn(theText)
	return theText

func getTemplate():
	return [
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
	if(_id == "outputSlot"):
		return outputSlot

func shouldExpandTemplate():
	return true
