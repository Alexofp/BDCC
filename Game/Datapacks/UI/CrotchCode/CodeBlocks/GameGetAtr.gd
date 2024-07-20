extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var op = "pain"
var nameSlot := CrotchSlotVar.new()

func getCategories():
	return ["Game"]

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
	
	if(op == "pain"):
		return _contex.getPain(charName)
	elif(op == "lust"):
		return _contex.getLust(charName)
	elif(op == "stamina"):
		return _contex.getStamina(charName)
	elif(op == "max pain"):
		return _contex.charMethod(charName, "painThreshold")
	elif(op == "max lust"):
		return _contex.charMethod(charName, "lustThreshold")
	elif(op == "max stamina"):
		return _contex.charMethod(charName, "getMaxStamina")
	elif(op == "pain level"):
		return _contex.charMethod(charName, "getPainLevel")
	elif(op == "lust level"):
		return _contex.charMethod(charName, "getLustLevel")
	elif(op == "stamina level"):
		return _contex.charMethod(charName, "getStaminaLevel")
	elif(op == "level"):
		return _contex.charMethod(charName, "getLevel")
	elif(op == "name"):
		return _contex.charMethod(charName, "getName")
	elif(op == "arousal"):
		return _contex.charMethod(charName, "getArousal")
	elif(op == "femininity"):
		return _contex.charMethod(charName, "getFemininity")
	elif(op == "thickness"):
		return _contex.charMethod(charName, "getThickness")
	elif(op == "fertility"):
		return _contex.charMethod(charName, "getFertility")
	elif(op == "virility"):
		return _contex.charMethod(charName, "getVirility")
	else:
		return 0


func getTemplate():
	return [
		{
			type = "label",
			text = "Get",
		},
		{
			type = "rawselector",
			id = "op",
			value = op,
			values = [
				"pain",
				"lust",
				"stamina",
				"max pain",
				"max lust",
				"max stamina",
				"pain level",
				"lust level",
				"stamina level",
				"level",
				"name",
				"arousal",
				"femininity",
				"thickness",
				"fertility",
				"virility",
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
	
	op = loadVar(_data, "op", "pain")
