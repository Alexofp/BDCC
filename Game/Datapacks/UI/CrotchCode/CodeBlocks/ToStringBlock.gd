extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var opSlot := CrotchSlotVar.new()

func getCategories():
	return ["Variables"]

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	return doThing(opSlot.getValue(_contex))

func doThing(val):
	return str(val)

func getThingLabel():
	return "To String"

func getTemplate():
	return [
		{
			type = "label",
			text = getThingLabel(),
		},
		{
			type = "slot",
			id = "opSlot",
			slot = opSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "opSlot"):
		return opSlot
