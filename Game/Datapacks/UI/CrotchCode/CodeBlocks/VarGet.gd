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
	print("VARNAME: "+str(varNameSlot.getValue(_contex)))
	return _contex.getVar(str(varNameSlot.getValue(_contex)))

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
		varNameSlot.setRawValue(_editor.getAllVarNames()[0])

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "var"):
		if(_editor != null && _editor.has_method("getAllVarNames")):
			_visSlot.setPossibleValues(_editor.getAllVarNames())
