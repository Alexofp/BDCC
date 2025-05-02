extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var valSlot := CrotchSlotVar.new()

func getCategories():
	return ["Transformation"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	valSlot.setRawType(CrotchVarType.NUMBER)
	valSlot.setRawValue(100.0)

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return false
	
	var tfName = valSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	if(!isNumber(tfName)):
		throwError(_contex, "Aceleration ammount must a number, got "+str(tfName)+" instead")
		return false

	return _contex.accelerateProgressTFs(charName, tfName/100.0)

func getTemplate():
	return [
		{
			type = "label",
			text = "Accelerate TFs",
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
			id = "val",
			slot = valSlot,
			slotType = CrotchBlocks.VALUE,
			extraType = 3,
		},
		{
			type = "label",
			text = "%",
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "val"):
		return valSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
