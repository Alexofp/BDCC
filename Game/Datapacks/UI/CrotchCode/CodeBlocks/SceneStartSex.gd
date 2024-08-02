extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var domSlot := CrotchSlotVar.new()
var subSlot := CrotchSlotVar.new()
var codeSlot := CrotchSlotCalls.new()
var sexType:String = SexType.DefaultSex

func getCategories():
	return ["Scene"]

func _init():
	domSlot.setRawType(CrotchVarType.STRING)
	domSlot.setRawValue("")
	subSlot.setRawType(CrotchVarType.STRING)
	subSlot.setRawValue("")

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	if(!makeSureReactMode(_contex)):
		return
	
	var charName = domSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return
	var charName2 = subSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName2)):
		throwError(_contex, "Character name must a string, got "+str(charName2)+" instead")
		return

	if(charName == charName2):
		throwError(_contex, "Dom can not be the same character as sub")
		return

	_contex.runGenericSexScene(charName, charName2, sexType, codeSlot)

func getTemplate():
	return [
		{
			type = "label",
			text = "Start Sex. Dom=",
		},
		{
			type = "slot",
			id = "dom",
			slot = domSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
		{
			type = "label",
			text = "Sub=",
		},
		{
			type = "slot",
			id = "sub",
			slot = subSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
		{
			type = "rawselector",
			id = "sexType",
			value = sexType,
			values = SexType.getAll(),
		},
		{
			type = "slot_list",
			id = "codeSlot",
			slot = codeSlot,
		},
	]

func getSlot(_id):
	if(_id == "dom"):
		return domSlot
	if(_id == "sub"):
		return subSlot
	if(_id == "codeSlot"):
		return codeSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		domSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")
		subSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id in ["dom", "sub"]):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())

func applyRawValue(_id, _value):
	if(_id == "sexType"):
		sexType = _value

func saveData():
	var data = .saveData()
	
	data["sexType"] = sexType
	
	return data

func loadData(_data):
	.loadData(_data)
	
	sexType = loadVar(_data, "sexType", SexType.DefaultSex)

func shouldExpandTemplate():
	return true
