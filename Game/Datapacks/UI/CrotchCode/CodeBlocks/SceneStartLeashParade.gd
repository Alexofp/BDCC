extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var locSlot := CrotchSlotVar.new()
var afterSlot := CrotchSlotCalls.new()

func getCategories():
	return ["Scene"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	locSlot.setRawType(CrotchVarType.STRING)
	locSlot.setRawValue("main_punishment_spot")

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	if(!makeSureReactMode(_contex)):
		return
	
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Char id must a string, got "+str(charName)+" instead")
		return
		
	var locValue = locSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(locValue)):
		throwError(_contex, "Argument must be a string, got "+str(locValue)+" instead")
		return
		
	_contex.runLeashParadeScene(charName, locValue, afterSlot)

func getTemplate():
	return [
		{
			type = "label",
			text = "Start leash parade. Dom:",
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
			text = "Final loc:",
		},
		{
			type = "slot",
			id = "locSlot",
			slot = locSlot,
			slotType = CrotchBlocks.VALUE,
			extraType = 2,
			expand = true,
		},
		{
			type = "slot_list",
			id = "afterSlot",
			slot = afterSlot,
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "locSlot"):
		return locSlot
	if(_id == "afterSlot"):
		return afterSlot

func shouldExpandTemplate():
	return true

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
