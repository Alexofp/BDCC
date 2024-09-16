extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var valSlot := CrotchSlotVar.new()

var op = "level"

func getCategories():
	return ["NPC Manipulation"]

func _init():
	valSlot.setRawType(CrotchVarType.STRING)
	valSlot.setRawValue(RepStat.Whore)

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	var repName = valSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(repName)):
		throwError(_contex, "Reputation name must be a string, got "+str(repName)+" instead")
		return
	if(GlobalRegistry.getRepStat(repName) == null):
		throwError(_contex, "Reputation stat with the name "+str(repName)+" doesn't exist")
		return
	
	if(op == "level"):
		return _contex.getPCRepLevel(repName)
	else:
		return _contex.getPCRepScore(repName)

func getTemplate():
	return [
		{
			type = "label",
			text = "Get pc rep",
		},
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"level",
				"score",
			],
		},
		{
			type = "slot",
			id = "val",
			slot = valSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "val"):
		return valSlot

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "val"):
		_visSlot.setPossibleValues(GlobalRegistry.getRepStats().keys())

func applyRawValue(_id, _value):
	if(_id == "op"):
		op = _value

func saveData():
	var data = .saveData()
	
	data["op"] = op
	
	return data

func loadData(_data):
	.loadData(_data)
	
	op = loadVar(_data, "op", "level")
