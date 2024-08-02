extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var op = "all"

func getCategories():
	return ["Lewd"]

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
	
	if(op == "all"):
		return _contex.getChildAmount(charName)
	if(op == "only mother"):
		return _contex.getChildAmountOnlyMother(charName)
	if(op == "only father"):
		return _contex.getChildAmountOnlyFather(charName)
	return 0


func getTemplate():
	return [
		{
			type = "label",
			text = "Get child amount",
		},
		{
			type = "slot",
			id = "name",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"all",
				"only mother",
				"only father",
			],
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
	
	op = loadVar(_data, "op", "all")
