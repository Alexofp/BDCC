extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var contentSlot := CrotchSlotVar.new()

func getCategories():
	return ["Game"]

func _init():
	contentSlot.setRawType(CrotchVarType.STRING)
	contentSlot.setRawValue(ContentType.Watersports)

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	var contentType = contentSlot.getValue(_contex)
	
	if(_contex.hadAnError()):
		return false
	if(!isString(contentSlot)):
		throwError(_contex, "Content type must be a string, got "+str(contentSlot)+" instead")
		return false
	
	return OPTIONS.isContentEnabled(contentType)

func getTemplate():
	return [
		{
			type = "label",
			text = "Is content enabled",
		},
		{
			type = "slot",
			id = "con",
			slot = contentSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "con"):
		return contentSlot

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "con"):
		_visSlot.setPossibleValues(ContentType.getAll())
