extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var itemSlot := CrotchSlotVar.new()

func getCategories():
	return ["Inventory"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	itemSlot.setRawType(CrotchVarType.STRING)
	itemSlot.setRawValue(InventorySlot.Body)

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
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
		throwError(_contex, "Inventory slot must a string, got "+str(statName)+" instead")
		return	
	
	return _contex.charInventoryMethod(charName, "clearSlot", [statName])


func getTemplate():
	return [
		{
			type = "label",
			text = "Clear slot",
		},
		{
			type = "slot",
			id = "item",
			slot = itemSlot,
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
	]

func getSlot(_id):
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
		_visSlot.setPossibleValues(InventorySlot.getAll())
