extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var nameSlot := CrotchSlotVar.new()
var speciesSlot := CrotchSlotVar.new()

func getCategories():
	return ["NPC Manipulation"]

func _init():
	nameSlot.setRawType(CrotchVarType.STRING)
	nameSlot.setRawValue("")
	speciesSlot.setRawType(CrotchVarType.STRING)
	var speciesKeys = GlobalRegistry.getAllSpecies().keys()
	speciesSlot.setRawValue(speciesKeys[0] if speciesKeys.size()>0 else "")

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	var charName = nameSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(charName)):
		throwError(_contex, "Character name must a string, got "+str(charName)+" instead")
		return
	
	var speciesId = speciesSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(speciesId)):
		throwError(_contex, "Species must a string, got "+str(speciesId)+" instead")
		return
	if(!(speciesId in GlobalRegistry.getAllSpecies().keys())):
		throwError(_contex, "Species with id "+speciesId+" doesn't exist. If your species is modded, make sure to have the mod loaded and add it as a requirement")
		return
	
	
	
	return (speciesId in _contex.charMethod(charName, "getSpecies", [], []))


func getTemplate():
	return [
		{
			type = "label",
			text = "Does",
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
			text = "belong to the",
		},
		{
			type = "slot",
			id = "species",
			slot = speciesSlot,
			slotType = CrotchBlocks.VALUE,
		},
		{
			type = "label",
			text = "species",
		},
	]

func getSlot(_id):
	if(_id == "name"):
		return nameSlot
	if(_id == "species"):
		return speciesSlot

func updateEditor(_editor):
	if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
		nameSlot.setRawValue(_editor.getAllInvolvedCharIDs()[0] if _editor.getAllInvolvedCharIDs().size() > 0 else "")

func updateVisualSlot(_editor, _id, _visSlot):
	if(_id == "name"):
		if(_editor != null && _editor.has_method("getAllInvolvedCharIDs")):
			_visSlot.setPossibleValues(_editor.getAllInvolvedCharIDs())
	if(_id == "species"):
		_visSlot.setPossibleValues(GlobalRegistry.getAllSpecies().keys())
