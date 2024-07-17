extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var numSlot := CrotchSlotVar.new()

func getCategories():
	return ["RNG"]

func _init():
	numSlot.setRawType(CrotchVarType.NUMBER)
	numSlot.setRawValue(50)

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	var theNumber = numSlot.getValue(_contex)
	
	if(_contex.hadAnError()):
		return 0.0
	
	if(!isNumber(theNumber)):
		throwError(_contex, "Value is not a number: "+str(theNumber))
		return 0.0

	return RNG.chance(theNumber)

func getTemplate():
	return [
		{
			type = "label",
			text = "Chance",
		},
		{
			type = "slot",
			id = "numSlot",
			slot = numSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "numSlot"):
		return numSlot
