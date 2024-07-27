extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var descSlot := CrotchSlotVar.new()
var stateSlot := CrotchSlotVar.new()
var codeSlot := CrotchSlotCalls.new()
var checksSlot := CrotchSlotButtonChecks.new()

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	descSlot.setRawType(CrotchVarType.STRING)
	descSlot.setRawValue("")
	stateSlot.setRawType(CrotchVarType.STRING)
	stateSlot.setRawValue("")

func getCategories():
	return ["Scene"]

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	if(!makeSureRunMode(_contex)):
		return
#	if(conditionSlot.isEmpty()):
#		throwError(_contex, "Condition can't be empty")
#		return false
#
#	if(conditionSlot.getValue(_contex)):
#		return thenSlot.execute(_contex)
	var nameText = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(nameText)):
		throwError(_contex, "Button name must be a string, got "+str(nameText)+" instead")
		return
	var descText = descSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(descText)):
		throwError(_contex, "Button description must be a string, got "+str(descText)+" instead")
		return
	var nextState = stateSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(nextState)):
		throwError(_contex, "Button state must be a string, got "+str(nextState)+" instead")
		return
	
	_contex.addButton(nameText, descText, nextState, codeSlot, checksSlot.getFinalChecks())

func shouldExpandTemplate():
	return true

func getTemplate():
	return [
		{
			type = "label",
			text = "Button",
		},
		{
			type = "slot",
			id = "nameSlot",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "Name",
			minsize = 100,
		},
		{
			type = "slot",
			id = "descSlot",
			slot = descSlot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "Description",
			expand=true,
		},
		{
			type = "slot",
			id = "stateSlot",
			slot = stateSlot,
			slotType = CrotchBlocks.VALUE,
			placeholder = "State",
		},
		{
			type = "button_checks",
			id = "checksSlot",
			slot = checksSlot,
		},
		{
			type = "slot_list",
			id = "codeSlot",
			slot = codeSlot,
		},
	]

func getSlot(_id):
	if(_id == "nameSlot"):
		return nameSlot
	if(_id == "descSlot"):
		return descSlot
	if(_id == "stateSlot"):
		return stateSlot
	if(_id == "codeSlot"):
		return codeSlot
	if(_id == "checksSlot"):
		return checksSlot

func getVisualBlockTheme():
	return themeControl

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllStateIDs")):
		stateSlot.setRawValue(_editor.getAllStateIDs()[0])

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "stateSlot"):
		if(_editor != null && _editor.has_method("getAllStateIDs")):
			_visSlot.setPossibleValues(_editor.getAllStateIDs())
