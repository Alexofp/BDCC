extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var stateSlot := CrotchSlotVar.new()
var codeSlot := CrotchSlotCalls.new()

func getCategories():
	return ["Lewd"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	stateSlot.setRawType(CrotchVarType.STRING)
	stateSlot.setRawValue("")

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return

	var nextState = stateSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(nextState)):
		throwError(_contex, "Button state must be a string, got "+str(nextState)+" instead")
		return
	
	_contex.addStraponButtonsFor(charName, nextState, codeSlot)

func shouldExpandTemplate():
	return true

func getTemplate():
	return [
		{
			type = "label",
			text = "Add strapon buttons. Wearer=",
		},
		{
			type = "slot",
			id = "name",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "slot",
			id = "stateSlot",
			slot = stateSlot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "State",
		},
		{
			type = "slot_list",
			id = "codeSlot",
			slot = codeSlot,
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "stateSlot"):
		return stateSlot
	if(_id == "codeSlot"):
		return codeSlot

func getSupportedEditors():
	return CrotchBlockEditorType.SCENE

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")
	if(_editor != null && _editor.has_method("getAllStateIDs")):
		stateSlot.setRawValue(_editor.getAllStateIDs()[0])

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
	if(_id == "stateSlot"):
		if(_editor != null && _editor.has_method("getAllStateIDs")):
			_visSlot.setPossibleValues(_editor.getAllStateIDs())
