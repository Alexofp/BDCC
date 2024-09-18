extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var valSlot := CrotchSlotVar.new()
var amSlot := CrotchSlotVar.new()

func getCategories():
	return ["NPC Manipulation"]

func _init():
	valSlot.setRawType(CrotchVarType.STRING)
	valSlot.setRawValue(RepStat.Whore)
	amSlot.setRawType(CrotchVarType.NUMBER)
	amSlot.setRawValue(0)

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var repName = valSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(repName)):
		throwError(_contex, "Reputation name must be a string, got "+str(repName)+" instead")
		return
	if(GlobalRegistry.getRepStat(repName) == null):
		throwError(_contex, "Reputation stat with the name "+str(repName)+" doesn't exist")
		return
		
	var amValue = amSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isNumber(amValue)):
		throwError(_contex, "Rep value must a number, got "+str(amValue)+" instead")
		return
	
	_contex.setPCRepLevel(repName, int(amValue))

func getTemplate():
	return [
		{
			type = "label",
			text = "Set pc rep level",
		},
		{
			type = "slot",
			id = "val",
			slot = valSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "slot",
			id = "am",
			slot = amSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "val"):
		return valSlot
	if(_id == "am"):
		return amSlot

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "val"):
		_visSlot.setPossibleValues(GlobalRegistry.getRepStats().keys())
