extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var imageSlot := CrotchSlotVar.new()

func _init():
	imageSlot.setRawType(CrotchVarType.STRING)
	imageSlot.setRawValue("")

func getCategories():
	return ["Scene"]

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	if(!makeSureRunMode(_contex)):
		return
	
	var imageID = imageSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(imageID)):
		throwError(_contex, "Image id must a string, got "+str(imageID)+" instead")
		return
		
	_contex.addImageByID(imageID)

func getTemplate():
	return [
		{
			type = "label",
			text = "Show scene image",
		},
		{
			type = "slot",
			id = "image",
			slot = imageSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
	]

func getSlot(_id):
	if(_id == "image"):
		return imageSlot

#func shouldExpandTemplate():
#	return true

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllImageIDs")):
		imageSlot.setRawValue(_editor.getAllImageIDs()[0] if _editor.getAllImageIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "image"):
		if(_editor != null && _editor.has_method("getAllImageIDs")):
			_visSlot.setPossibleValues(_editor.getAllImageIDs())
