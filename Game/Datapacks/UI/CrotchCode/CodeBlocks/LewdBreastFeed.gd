extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var breastSlot := CrotchSlotVar.new()
var varSlot := CrotchSlotVar.new()

func getCategories():
	return ["Lewd"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	breastSlot.setRawType(CrotchVarType.STRING)
	breastSlot.setRawValue("")
	varSlot.setRawType(CrotchVarType.NUMBER)
	varSlot.setRawValue(1.0)


func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must be a string, got "+str(charName)+" instead")
		return

	var breastName = breastSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(breastName)):
		throwError(_contex, "Character name must be a string, got "+str(breastName)+" instead")
		return

	var amValue = varSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isNumber(amValue)):
		throwError(_contex, "Last argument must be a number, got "+str(amValue)+" instead")
		return
	
	return _contex.charMethod(charName, "breastFedBy", [_contex.getCharacterActualID(breastName), amValue])

func getTemplate():
	return [
		{
			type = "slot",
			id = "name",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
		{
			type = "label",
			text = "Breast feeds on",
		},
		{
			type = "slot",
			id = "breast",
			slot = breastSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
		{
			type = "label",
			text = "scale",
		},
		{
			type = "slot",
			id = "var",
			slot = varSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "breast"):
		return breastSlot
	if(_id == "var"):
		return varSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")
		breastSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
	if(_id == "breast"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
