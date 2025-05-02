extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var op = "canStartTF"
var nameSlot := CrotchSlotVar.new()
var valSlot := CrotchSlotVar.new()

func getCategories():
	return ["Transformation"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	valSlot.setRawType(CrotchVarType.STRING)
	valSlot.setRawValue("Demonification")

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return false
	
	var tfName = valSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	if(!isString(tfName)):
		throwError(_contex, "TF id must a string, got "+str(tfName)+" instead")
		return false

	if(op == "canStartTF"):
		return _contex.canStartTF(charName, tfName)
	if(op == "hasTF"):
		return _contex.hasTF(charName, tfName)
	if(op == "hasTFFinalStage"):
		return _contex.hasTFFinalStage(charName, tfName)
	return false

func getTemplate():
	return [
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"canStartTF",
				"hasTF",
				"hasTFFinalStage",
			],
		},
		{
			type = "slot",
			id = "val",
			slot = valSlot,
			slotType = CrotchBlocks.VALUE,
			extraType = 3,
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
	if(_id == "val"):
		return valSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
	if(_id == "val"):
		_visSlot.setPossibleValues(GlobalRegistry.getTransformationRefs().keys())

func applyRawValue(_id, _value):
	if(_id == "op"):
		op = _value

func saveData():
	var data = .saveData()
	
	data["op"] = op
	
	return data

func loadData(_data):
	.loadData(_data)
	
	op = loadVar(_data, "op", "canStartTF")
