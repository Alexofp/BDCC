extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/FlagInc.gd"

func execute(_contex:CodeContex):
	var flagID = str(varNameSlot.getValue(_contex))
	if(_contex.hadAnError()):
		return
	if(!isString(flagID)):
		throwError(_contex, "Flag id must a string, got "+str(flagID)+" instead")
		return
		
	var addValue = varValueSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	
	if(!isNumber(addValue)):
		throwError(_contex, "Increase value should be a number, got: "+str(addValue)+" instead")
		return
		
	_contex.setFlagRaw(flagID, _contex.getFlagRaw(flagID, 0) + addValue, self)

func getTemplate():
	return [
		{
			type = "label",
			text = "Inc",
		},
		{
			type = "slot",
			id = "var",
			slot = varNameSlot,
			slotType = CrotchBlocks.VALUE,
			extraType = 4,
		},
		{
			type = "label",
			text = "by",
		},
		{
			type = "slot",
			id = "value",
			slot = varValueSlot,
			slotType = CrotchBlocks.VALUE,
		},
	]

func updateEditor(_editor):
	pass
	
func updateVisualSlot(_editor, _id, _visSlot):
	pass

func getVisualBlockTheme():
	return themeFlagGlobal
