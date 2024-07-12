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
	if(_contex.hadAnError()):
		return
		
	var addValue = varValueSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	
	if(!isNumber(addValue)):
		throwError(_contex, "Increase value should be a number, got: "+str(addValue)+" instead")
		return
		
	if(!isString(varName)):
		throwError(_contex, "Variable name must be a string, got "+str(varName)+" instead")
		return
		
	var varValue = _contex.getVar(varName, 0)
	if(_contex.hadAnError()):
		return
	if(!isNumber(varValue)):
		throwError(_contex, "Variable must contain a number value, got "+str(varValue)+" instead")
		return
	_contex.setVar(varName, varValue + addValue, self)

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
		varNameSlot.setRawValue(_editor.getAllVarNames()[0] if _editor.getAllVarNames().size() > 0 else "var")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "var"):
		if(_editor != null && _editor.has_method("getAllVarNames")):
			_visSlot.setPossibleValues(_editor.getAllVarNames())
