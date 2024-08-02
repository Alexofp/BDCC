extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var amSlot := CrotchSlotVar.new()
var itemSlot := CrotchSlotVar.new()

func getCategories():
	return ["Inventory"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	amSlot.setRawType(CrotchVarType.NUMBER)
	amSlot.setRawValue(1)
	itemSlot.setRawType(CrotchVarType.STRING)
	itemSlot.setRawValue("appleitem")

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var amAmount = amSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isNumber(amAmount)):
		throwError(_contex, "Item amount must a number, got "+str(amAmount)+" instead")
		return
	
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return
	
	var statName = itemSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(statName)):
		throwError(_contex, "Item id must a string, got "+str(statName)+" instead")
		return	
	
	return _contex.charInventoryMethod(charName, "addXOfItemID", [statName, amAmount])


func getTemplate():
	return [
		{
			type = "label",
			text = "Add",
		},
		{
			type = "slot",
			id = "amSlot",
			slot = amSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = "of item id",
		},
		{
			type = "slot",
			id = "item",
			slot = itemSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = "to",
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
	if(_id == "amSlot"):
		return amSlot
	if(_id == "name"):
		return nameSlot
	if(_id == "item"):
		return itemSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
	if(_id == "item"):
		_visSlot.setPossibleValues(GlobalRegistry.getItemRefs().keys())
