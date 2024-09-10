extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()

func getCategories():
	return ["Scene"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	if(!makeSureReactMode(_contex)):
		return
	
	var stateName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(stateName)):
		throwError(_contex, "State name must a string, got "+str(stateName)+" instead")
		return
	
	_contex.setState(stateName)

func getTemplate():
	return [
		{
			type = "label",
			text = "Set state to",
		},
		{
			type = "slot",
			id = "name",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllStateIDs")):
		nameSlot.setRawValue(_editor.getAllStateIDs()[0] if _editor.getAllStateIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllStateIDs")):
			_visSlot.setPossibleValues(_editor.getAllStateIDs())
