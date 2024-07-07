extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var opSlot := CrotchSlotVar.new()

func getCategories():
	return ["Logic"]

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):	
	return checkThing(opSlot.getValue(_contex))

func checkThing(a):
	return !a

func getThingLabel():
	return "NOT"

func getTemplate():
	return [
		{
			type = "label",
			text = getThingLabel(),
		},
		{
			type = "slot",
			id = "op",
			slot = opSlot,
			slotType = CrotchBlocks.LOGIC,
		},
	]

func getSlot(_id):
	if(_id == "op"):
		return opSlot
