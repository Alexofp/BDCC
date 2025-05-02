extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var valSlot := CrotchSlotVar.new()

func getCategories():
	return ["Transformation"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("Milk")
	valSlot.setRawType(CrotchVarType.NUMBER)
	valSlot.setRawValue(100.0)

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var fluidName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	if(!isString(fluidName)):
		throwError(_contex, "Fluid name must a string, got "+str(fluidName)+" instead")
		return false
	
	var fluidAmount = valSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	if(!isNumber(fluidAmount)):
		throwError(_contex, "Aceleration ammount must a number, got "+str(fluidAmount)+" instead")
		return false

	return _contex.addTFLabFluid(fluidName, fluidAmount)

func getTemplate():
	return [
		{
			type = "label",
			text = "Add",
		},
		{
			type = "slot",
			id = "name",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
		{
			type = "slot",
			id = "val",
			slot = valSlot,
			slotType = CrotchBlocks.VALUE,
			extraType = 3,
		},
		{
			type = "label",
			text = "ml to lab",
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "val"):
		return valSlot

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		_visSlot.setPossibleValues(GlobalRegistry.getFluids().keys())
