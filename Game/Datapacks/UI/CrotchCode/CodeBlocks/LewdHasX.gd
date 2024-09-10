extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var op = "hasReachablePenis"
var nameSlot := CrotchSlotVar.new()

func getCategories():
	return ["Lewd"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	initOp()

func initOp():
	pass

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return
	
	return _contex.charMethod(charName, op)

func getFuncList():
	return [
		"hasReachablePenis",
		"hasReachableVagina",
		"hasPenis",
		"hasVagina",
		"hasAnus",
		"hasReachableAnus",
		"hasHair",
		"hasTail",
		"hasHorns",
		"hasNonFlatBreasts",
		"hasBigBreasts",
		"hasSmallBreasts",
		"hasTallymarks",
		"hasBodywritings",
		"hasStrapons",
		"hasCondoms",
	]

func getTemplate():
	return [
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = getFuncList(),
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
	
	op = loadVar(_data, "op", getFuncList()[0])
