extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var op = "credits"
var varSlot := CrotchSlotVar.new()

func getCategories():
	return ["Game"]

func _init():
	setUpArgument()

func setUpArgument():
	varSlot.setRawType(CrotchVarType.NUMBER)
	varSlot.setRawValue(10)

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	var amValue = varSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return

	if(!isNumber(amValue)):
		throwError(_contex, "Second argument must be a number, got "+str(amValue)+" instead")
		return
	
	if(op == "credits"):
		_contex.charMethod("pc", "addCredits", [int(amValue)])
	elif(op == "experience"):
		_contex.charMethod("pc", "addExperience", [int(amValue)])
	elif(op == "intoxication"):
		_contex.charMethod("pc", "addIntoxication", [amValue])

func getTemplate():
	return [
		{
			type = "label",
			text = "Add to pc",
		},
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"credits",
				"experience",
				"intoxication",
			],
		},
		{
			type = "slot",
			id = "var",
			slot = varSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "var"):
		return varSlot

func applyRawValue(_id, _value):
	if(_id == "op"):
		op = _value

func saveData():
	var data = .saveData()
	
	data["op"] = op
	
	return data

func loadData(_data):
	.loadData(_data)
	
	op = loadVar(_data, "op", "credits")
