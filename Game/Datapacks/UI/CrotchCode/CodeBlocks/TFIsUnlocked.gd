extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var op = "isTFEffectUnlocked"
var valSlot := CrotchSlotVar.new()

func getCategories():
	return ["Transformation"]

func _init():
	valSlot.setRawType(CrotchVarType.STRING)
	valSlot.setRawValue("Demonification")

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	var tfName = valSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return false
	if(!isString(tfName)):
		throwError(_contex, "TF id must a string, got "+str(tfName)+" instead")
		return false

	if(op == "isTFEffectUnlocked"):
		return _contex.isTFEffectUnlocked(tfName)
	if(op == "isTFEffectTested"):
		return _contex.isTFEffectTested(tfName)
	return false

func getTemplate():
	return [
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"isTFEffectUnlocked",
				"isTFEffectTested",
			],
		},
		{
			type = "slot",
			id = "val",
			slot = valSlot,
			slotType = CrotchBlocks.VALUE,
			extraType = 3,
		},
	]

func getSlot(_id):
	if(_id == "val"):
		return valSlot


func updateVisualSlot(_editor, _id, _visSlot):
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
	
	op = loadVar(_data, "op", "isTFEffectUnlocked")
