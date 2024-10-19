extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var varNameSlot := CrotchSlotVar.new()
var varValueSlot := CrotchSlotVar.new()

func getCategories():
	return ["Flags"]

func _init():
	varNameSlot.setRawType(CrotchVarType.STRING)
	varNameSlot.setRawValue("")
	varValueSlot.setRawType(CrotchVarType.NUMBER)
	varValueSlot.setRawValue(1)

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var flagID = str(varNameSlot.getValue(_contex))
	if(_contex.hadAnError()):
		return
	if(!isString(flagID)):
		throwError(_contex, "Flag id must a string, got "+str(flagID)+" instead")
		return
		
	var addValue = varValueSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	
	if(!isNumber(addValue)):
		throwError(_contex, "Increase value should be a number, got: "+str(addValue)+" instead")
		return
		
	_contex.setFlag(flagID, _contex.getFlag(flagID, 0) + addValue, self)

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
	if(_editor != null && _editor.has_method("getAllFlagNames")):
		varNameSlot.setRawValue(_editor.getAllFlagNames()[0] if _editor.getAllFlagNames().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "var"):
		if(_editor != null && _editor.has_method("getAllFlagNames")):
			_visSlot.setPossibleValues(_editor.getAllFlagNames())
