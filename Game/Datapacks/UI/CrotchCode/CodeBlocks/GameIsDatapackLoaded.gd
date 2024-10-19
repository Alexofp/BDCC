extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var datapackSlot := CrotchSlotVar.new()

func getCategories():
	return ["Game"]

func _init():
	datapackSlot.setRawType(CrotchVarType.STRING)
	datapackSlot.setRawValue("")

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	var contentType = datapackSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	if(!isString(contentType)):
		throwError(_contex, "Content type must be a string, got "+str(contentType)+" instead")
		return false
	
	return _contex.isDatapackLoaded(contentType)

func getTemplate():
	return [
		{
			type = "label",
			text = "Is datapack loaded",
		},
		{
			type = "slot",
			id = "dat",
			slot = datapackSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "dat"):
		return datapackSlot

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "dat"):
		if(_editor != null && _editor.has_method("getAllDatapackIDs")):
			_visSlot.setPossibleValues(_editor.getAllDatapackIDs())

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllDatapackIDs")):
		datapackSlot.setRawValue(_editor.getAllDatapackIDs()[0] if _editor.getAllDatapackIDs().size() > 0 else "")
