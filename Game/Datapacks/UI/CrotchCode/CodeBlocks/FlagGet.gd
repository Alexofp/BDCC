extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var varNameSlot := CrotchSlotVar.new()

func getCategories():
	return ["Flags"]

func _init():
	varNameSlot.setRawType(CrotchVarType.STRING)
	varNameSlot.setRawValue("")

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var flagID = str(varNameSlot.getValue(_contex))
	
	if(_contex.hadAnError()):
		return null
	if(!isString(flagID)):
		throwError(_contex, "Flag id must a string, got "+str(flagID)+" instead")
		return null
	
	return _contex.getFlag(flagID, null, self)

func getTemplate():
	return [
		{
			type = "label",
			text = "Get",
		},
		{
			type = "slot",
			id = "var",
			slot = varNameSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "var"):
		return varNameSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllFlagNames")):
		varNameSlot.setRawValue(_editor.getAllFlagNames()[0] if _editor.getAllFlagNames().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "var"):
		if(_editor != null && _editor.has_method("getAllFlagNames")):
			_visSlot.setPossibleValues(_editor.getAllFlagNames())
