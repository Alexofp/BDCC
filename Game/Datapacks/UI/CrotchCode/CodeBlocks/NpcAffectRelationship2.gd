extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var secondSlot := CrotchSlotVar.new()
var valSlot := CrotchSlotVar.new()

var op := "add affection"

func getCategories():
	return ["NPC Manipulation"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	secondSlot.setRawType(CrotchVarType.STRING)
	secondSlot.setRawValue("")
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

	var amValue = valSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isNumber(amValue)):
		throwError(_contex, "Amount must be a number, got "+str(amValue)+" instead")
		return
	
	if(op == "add affection"):
		_contex.addAffection(charName, secondName, amValue)
	elif(op == "set affection"):
		_contex.setAffection(charName, secondName, amValue)
	elif(op == "add lust"):
		_contex.addRelationshipLust(charName, secondName, amValue)
	else:
		_contex.setRelationshipLust(charName, secondName, amValue)

func getTemplate():
	return [
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"add affection",
				"set affection",
				"add lust",
				"set lust",
			],
		},
		{
			type = "slot",
			id = "name",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
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
			text = "amount",
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

func applyRawValue(_id, _value):
	if(_id == "op"):
		op = _value

func saveData():
	var data = .saveData()
	
	data["op"] = op
	
	return data

func loadData(_data):
	.loadData(_data)
	
	op = loadVar(_data, "op", "add affection")
