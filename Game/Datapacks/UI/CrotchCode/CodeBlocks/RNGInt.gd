extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var numSlot := CrotchSlotVar.new()
var num2Slot := CrotchSlotVar.new()

func getCategories():
	return ["RNG"]

func _init():
	numSlot.setRawType(CrotchVarType.NUMBER)
	numSlot.setRawValue(0)
	num2Slot.setRawType(CrotchVarType.NUMBER)
	num2Slot.setRawValue(10)

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var theNumber = numSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return 0.0
	if(!isNumber(theNumber)):
		throwError(_contex, "Value is not a number: "+str(theNumber))
		return 0.0
	var theNumber2 = num2Slot.getValue(_contex)
	if(_contex.hadAnError()):
		return 0.0
	if(!isNumber(theNumber2)):
		throwError(_contex, "Value is not a number: "+str(theNumber2))
		return 0.0

	return RNG.randi_range(int(theNumber), int(theNumber2))

func getTemplate():
	return [
		{
			type = "label",
			text = "RNG int",
		},
		{
			type = "slot",
			id = "numSlot",
			slot = numSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = "-",
		},
		{
			type = "slot",
			id = "num2Slot",
			slot = num2Slot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "numSlot"):
		return numSlot
	if(_id == "num2Slot"):
		return num2Slot
