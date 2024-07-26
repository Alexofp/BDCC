extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var partSlot := CrotchSlotVar.new()
var amSlot := CrotchSlotVar.new()

func getCategories():
	return ["Lewd"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	partSlot.setRawType(CrotchVarType.STRING)
	partSlot.setRawValue(BodypartSlot.Anus)
	amSlot.setRawType(CrotchVarType.NUMBER)
	amSlot.setRawValue(40.0)


func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return

	var partName = partSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(partName)):
		throwError(_contex, "Bodypart slot must a string, got "+str(partName)+" instead")
		return
	
	var amValue = amSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isNumber(amValue)):
		throwError(_contex, "Stretch amount must be a number, got "+str(amValue)+" instead")
		return
	
	return _contex.charMethod(charName, "gotOrificeStretchedWith", [partName, amValue])

func getTemplate():
	return [
		{
			type = "label",
			text = "Stretch",
		},
		{
			type = "slot",
			id = "part",
			slot = partSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = "of",
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
			text = "size",
		},
		{
			type = "slot",
			id = "am",
			slot = amSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = "cm",
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "am"):
		return amSlot
	if(_id == "part"):
		return partSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
	if(_id == "part"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues([BodypartSlot.Anus, BodypartSlot.Vagina, BodypartSlot.Head])
