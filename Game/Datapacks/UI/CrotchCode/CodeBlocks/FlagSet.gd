extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var varNameSlot := CrotchSlotVar.new()
var varValueSlot := CrotchSlotVar.new()

func getCategories():
	return ["Flags"]

func _init():
	varNameSlot.setRawType(CrotchVarType.STRING)
	varNameSlot.setRawValue("")
	setRawTypeValue()

func setRawTypeValue():
	varValueSlot.setRawType(CrotchVarType.NUMBER)
	varValueSlot.setRawValue(0)

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var flagID = str(varNameSlot.getValue(_contex))
	if(_contex.hadAnError()):
		return
		
	var setValue = varValueSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
		
	_contex.setFlag(flagID, setValue, self)

func getTemplate():
	return [
		{
			type = "label",
			text = "Set",
		},
		{
			type = "slot",
			id = "var",
			slot = varNameSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = "to",
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
	if(_editor != null && _editor.has_method("getAllFlagNames")):
		varNameSlot.setRawValue(_editor.getAllFlagNames()[0] if _editor.getAllFlagNames().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "var"):
		if(_editor != null && _editor.has_method("getAllFlagNames")):
			_visSlot.setPossibleValues(_editor.getAllFlagNames())
