extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()

func getCategories():
	return ["Transformation"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("Milk")

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var fluidName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return 0.0
	if(!isString(fluidName)):
		throwError(_contex, "Fluid name must a string, got "+str(fluidName)+" instead")
		return 0.0
	
	return _contex.getTFLabFluid(fluidName)

func getTemplate():
	return [
		{
			type = "label",
			text = "Get amount of",
		},
		{
			type = "slot",
			id = "name",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
		{
			type = "label",
			text = "in lab",
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		_visSlot.setPossibleValues(GlobalRegistry.getFluids().keys())
