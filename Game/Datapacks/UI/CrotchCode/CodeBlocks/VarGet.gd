extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var varNameSlot := CrotchSlotVar.new()

func getCategories():
	return ["Variables"]

func _init():
	varNameSlot.setRawType(CrotchVarType.STRING)
	varNameSlot.setRawValue("")

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var varID = str(varNameSlot.getValue(_contex))
	
	if(_contex.hadAnError()):
		return null
	if(!isString(varID)):
		throwError(_contex, "Variable name must be a string got "+str(varID)+" instead")
		return null
	return _contex.getVar(varID)

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
	if(_editor != null && _editor.has_method("getAllVarNames")):
		varNameSlot.setRawValue(_editor.getAllVarNames()[0] if _editor.getAllVarNames().size() > 0 else "var")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "var"):
		if(_editor != null && _editor.has_method("getAllVarNames")):
			_visSlot.setPossibleValues(_editor.getAllVarNames())
