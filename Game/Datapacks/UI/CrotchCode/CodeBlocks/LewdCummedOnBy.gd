extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var secondSlot := CrotchSlotVar.new()
var sourceSlot := CrotchSlotVar.new()
var valSlot := CrotchSlotVar.new()

func getCategories():
	return ["Lewd"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	secondSlot.setRawType(CrotchVarType.STRING)
	secondSlot.setRawValue("")
	sourceSlot.setRawType(CrotchVarType.STRING)
	sourceSlot.setRawValue(FluidSource.Names[0])
	valSlot.setRawType(CrotchVarType.NUMBER)
	valSlot.setRawValue(1.0)


func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must be a string, got "+str(charName)+" instead")
		return

	var secondName = secondSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(secondName)):
		throwError(_contex, "Character name must be a string, got "+str(secondName)+" instead")
		return

	var sourceName = sourceSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(sourceName)):
		throwError(_contex, "Source name must be a string, got "+str(sourceName)+" instead")
		return
	var actualSource = FluidSource.nameToSource(sourceName)

	var amValue = valSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isNumber(amValue)):
		throwError(_contex, "Amount must be a number, got "+str(amValue)+" instead")
		return
	
	if(actualSource == FluidSource.Pissing):
		return _contex.charMethod(charName, "pissedOnBy", [_contex.getCharacterActualID(secondName), amValue])
	else:
		return _contex.charMethod(charName, "cummedOnBy", [_contex.getCharacterActualID(secondName), actualSource, amValue])

func getTemplate():
	return [
		{
			type = "slot",
			id = "name",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
		{
			type = "label",
			text = "received facials from",
		},
		{
			type = "slot",
			id = "second",
			slot = secondSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
		{
			type = "label",
			text = "how",
		},
		{
			type = "slot",
			id = "source",
			slot = sourceSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = "scale",
		},
		{
			type = "slot",
			id = "val",
			slot = valSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "second"):
		return secondSlot
	if(_id == "source"):
		return sourceSlot
	if(_id == "val"):
		return valSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")
		secondSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
	if(_id == "second"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
	if(_id == "source"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(FluidSource.Names)
