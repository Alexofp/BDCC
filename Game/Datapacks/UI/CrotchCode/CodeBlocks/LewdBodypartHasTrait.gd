extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var valSlot := CrotchSlotVar.new()
var traitSlot := CrotchSlotVar.new()

func getCategories():
	return ["Lewd"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	valSlot.setRawType(CrotchVarType.STRING)
	valSlot.setRawValue(BodypartSlot.Penis)
	traitSlot.setRawType(CrotchVarType.STRING)
	traitSlot.setRawValue(PartTrait.traitNames[0])

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return
	
	var statName = valSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(statName)):
		throwError(_contex, "Bodypart name must a string, got "+str(statName)+" instead")
		return	
		
	var traitName = traitSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(traitName)):
		throwError(_contex, "Bodypart trait must a string, got "+str(traitName)+" instead")
		return	
		
	var traitActual = PartTrait.textToTrait(traitName)
	return _contex.charMethod(charName, "bodypartHasTrait", [statName, traitActual])


func getTemplate():
	return [
		{
			type = "slot",
			id = "name",
			slot = nameSlot,
			slotType = CrotchBlocks.VALUE,
			expand=true,
		},
		{
			type = "slot",
			id = "val",
			slot = valSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = "has trait",
		},
		{
			type = "slot",
			id = "trait",
			slot = traitSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "val"):
		return valSlot
	if(_id == "trait"):
		return traitSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
	if(_id == "val"):
		_visSlot.setPossibleValues(BodypartSlot.getAll())
	if(_id == "trait"):
		_visSlot.setPossibleValues(PartTrait.traitNames)
