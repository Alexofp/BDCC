extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var op = "getBreastSize"
var nameSlot := CrotchSlotVar.new()

func getCategories():
	return ["NPC Manipulation"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return

	if(op == "getBreastSize"):
		return _contex.getBreastSize(charName)
	if(op == "getOriginalBreastSize"):
		return _contex.getOriginalBreastSize(charName)
	if(op == "getPenisLen"):
		return _contex.getPenisLen(charName)
	if(op == "getPenisBallsScale"):
		return _contex.getPenisBallsScale(charName)

func getTemplate():
	return [
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"getBreastSize",
				"getOriginalBreastSize",
				"getPenisLen",
				"getPenisBallsScale",
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

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
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
	
	op = loadVar(_data, "op", "getBreastSize")
