extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var whoSlot := CrotchSlotVar.new()

func getCategories():
	return ["Game"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	whoSlot.setRawType(CrotchVarType.STRING)
	whoSlot.setRawValue("")


func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return

	var whoName = whoSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(whoName)):
		throwError(_contex, "Character name must a string, got "+str(whoName)+" instead")
		return
	
	_contex.charMethod(charName, "doWound", [_contex.getCharacterActualID(whoName)])

func getTemplate():
	return [
		{
			type = "label",
			text = "Wound",
		},
		{
			type = "slot",
			id = "name",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
		{
			type = "label",
			text = "by",
		},
		{
			type = "slot",
			id = "who",
			slot = whoSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "who"):
		return whoSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")
		whoSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
	if(_id == "who"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
