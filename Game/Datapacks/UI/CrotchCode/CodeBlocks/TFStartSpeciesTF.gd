extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var op = "SpeciesTF"
var nameSlot := CrotchSlotVar.new()
var valSlot := CrotchSlotVar.new()

func getCategories():
	return ["Transformation"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	valSlot.setRawType(CrotchVarType.STRING)
	valSlot.setRawValue(Species.Feline)

func getType():
	return CrotchBlocks.CALL

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
		throwError(_contex, "Species must a string, got "+str(tfName)+" instead")
		return false
	
	if(op == "SpeciesTF"):
		return _contex.startSpeciesTF(charName, tfName)
	if(op == "HybridTF"):
		return _contex.startHybridSpeciesTF(charName, tfName)
	return false

func getTemplate():
	return [
		{
			type = "label",
			text = "Start",
		},
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"SpeciesTF",
				"HybridTF",
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
		_visSlot.setPossibleValues(GlobalRegistry.getAllSpecies().keys())

func applyRawValue(_id, _value):
	if(_id == "op"):
		op = _value

func saveData():
	var data = .saveData()
	
	data["op"] = op
	
	return data

func loadData(_data):
	.loadData(_data)
	
	op = loadVar(_data, "op", "SpeciesTF")
