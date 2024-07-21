extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var valSlot := CrotchSlotVar.new()
var amSlot := CrotchSlotVar.new()

func getCategories():
	return ["NPC Manipulation"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	valSlot.setRawType(CrotchVarType.STRING)
	valSlot.setRawValue(Fetish.BeingBred)
	amSlot.setRawType(CrotchVarType.NUMBER)
	amSlot.setRawValue(0.0)

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return
	
	var statName = valSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(statName)):
		throwError(_contex, "Fetish must be a string, got "+str(statName)+" instead")
		return
	if(GlobalRegistry.getFetish(statName) == null):
		throwError(_contex, "Fetish with the name "+statName+" doesn't exist")
		return
		
	var amValue = amSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isNumber(amValue)):
		throwError(_contex, "Personality stat value must a number, got "+str(amValue)+" instead")
		return
	
	return _contex.charFetishHolderMethod(charName, "setFetishValue", [statName, amValue])


func getTemplate():
	return [
		{
			type = "label",
			text = "Set",
		},
		{
			type = "slot",
			id = "val",
			slot = valSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = "of",
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
			text = "to",
		},
		{
			type = "slot",
			id = "am",
			slot = amSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "val"):
		return valSlot
	if(_id == "am"):
		return amSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
	if(_id == "val"):
		_visSlot.setPossibleValues(GlobalRegistry.getFetishes().keys())
	if(_id == "am"):
		_visSlot.setPossibleValues([-1.0, -0.75, -0.5, -0.25, 0.0, 0.25, 0.5, 0.75, 1.0])
