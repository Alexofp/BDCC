extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var tagSlot := CrotchSlotVar.new()
var op = "anywhere"

func getCategories():
	return ["Inventory"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	tagSlot.setRawType(CrotchVarType.STRING)
	tagSlot.setRawValue(ItemTag.tagNames[0])

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return
	
	var tagName = tagSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(tagName)):
		throwError(_contex, "Item tag must a string, got "+str(tagName)+" instead")
		return
	
	var actualTag = ItemTag.nameToTag(tagName)
	if(op == "anywhere"):
		return _contex.charInventoryMethod(charName, "hasItemsWithTag", [actualTag]) || _contex.charInventoryMethod(charName, "hasEquippedItemWithTag", [actualTag])
	if(op == "in inventory"):
		return _contex.charInventoryMethod(charName, "hasItemsWithTag", [actualTag])
	if(op == "equipped"):
		return _contex.charInventoryMethod(charName, "hasEquippedItemWithTag", [actualTag])

func getTemplate():
	return [
		{
			type = "label",
			text = "Has items with tag",
		},
		{
			type = "slot",
			id = "tagSlot",
			slot = tagSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"anywhere",
				"in inventory",
				"equipped",
			],
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
	if(_id == "tagSlot"):
		return tagSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
	if(_id == "tagSlot"):
		if(_editor != null):
			_visSlot.setPossibleValues(ItemTag.tagNames)

func applyRawValue(_id, _value):
	if(_id == "op"):
		op = _value

func saveData():
	var data = .saveData()
	
	data["op"] = op
	
	return data

func loadData(_data):
	.loadData(_data)
	
	op = loadVar(_data, "op", "anywhere")
