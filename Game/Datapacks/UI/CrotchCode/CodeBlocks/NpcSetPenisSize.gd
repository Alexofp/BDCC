extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var amSlot := CrotchSlotVar.new()
var am2Slot := CrotchSlotVar.new()

func getCategories():
	return ["NPC Manipulation"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	amSlot.setRawType(CrotchVarType.NUMBER)
	amSlot.setRawValue(22.0)
	am2Slot.setRawType(CrotchVarType.NUMBER)
	am2Slot.setRawValue(1.0)

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return
	
	var amValue = amSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isNumber(amValue)):
		throwError(_contex, "Penis size value must a number, got "+str(amValue)+" instead")
		return
	
	var am2Value = am2Slot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isNumber(am2Value)):
		throwError(_contex, "Penis balls size value must a number, got "+str(am2Value)+" instead")
		return
	
	return _contex.setPenisAndBallsSize(charName, amValue, am2Value)


func getTemplate():
	return [
		{
			type = "label",
			text = "Set penis size",
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
			id = "am",
			slot = amSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = "balls",
		},
		{
			type = "slot",
			id = "am2",
			slot = am2Slot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "am"):
		return amSlot
	if(_id == "am2"):
		return am2Slot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
