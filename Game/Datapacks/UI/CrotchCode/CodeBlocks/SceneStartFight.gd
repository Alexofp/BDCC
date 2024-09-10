extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var winSlot := CrotchSlotCalls.new()
var lostSlot := CrotchSlotCalls.new()

func getCategories():
	return ["Scene"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	if(!makeSureReactMode(_contex)):
		return
	
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return
	if(charName == "pc"):
		throwError(_contex, "Can not fight the player")
		return
		
	_contex.runFightScene(charName, winSlot, lostSlot)

func getTemplate():
	return [
		{
			type = "label",
			text = "Start fight",
		},
		{
			type = "slot",
			id = "name",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
		{
			type = "label",
			text = "IF WON:",
		},
		{
			type = "slot_list",
			id = "winSlot",
			slot = winSlot,
		},
		{
			type = "label",
			text = "IF LOST:",
		},
		{
			type = "slot_list",
			id = "lostSlot",
			slot = lostSlot,
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "winSlot"):
		return winSlot
	if(_id == "lostSlot"):
		return lostSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())

func shouldExpandTemplate():
	return true
