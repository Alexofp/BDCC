extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var varNameSlot := CrotchSlotVar.new()
var varValueSlot := CrotchSlotVar.new()

func getCategories():
	return ["Variables"]

func _init():
	varNameSlot.setRawType(CrotchVarType.STRING)
	varNameSlot.setRawValue("")
	varValueSlot.setRawType(CrotchVarType.NUMBER)
	varValueSlot.setRawValue(1)

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var varName = str(varNameSlot.getValue(_contex))
	print("VAR NAME IS: "+str(varName))
	_contex.setVar(varName, _contex.getVar(varName, 0) + varValueSlot.getValue(_contex))

func getTemplate():
	return [
		{
			type = "label",
			text = "Inc",
		},
		{
			type = "slot",
			id = "var",
			slot = varNameSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = "by",
		},
		{
			type = "slot",
			id = "value",
			slot = varValueSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "var"):
		return varNameSlot
	if(_id == "value"):
		return varValueSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllVarNames")):
		varNameSlot.setRawValue(_editor.getAllVarNames()[0])

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "var"):
		if(_editor != null && _editor.has_method("getAllVarNames")):
			_visSlot.setPossibleValues(_editor.getAllVarNames())
