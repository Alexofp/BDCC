extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/FlagSet.gd"

func execute(_contex:CodeContex):
	var flagID = str(varNameSlot.getValue(_contex))
	if(_contex.hadAnError()):
		return
		
	var setValue = varValueSlot.getValue(_contex)
	if(_contex.hadAnError()):
		return
	if(!isString(flagID)):
		throwError(_contex, "Flag id must a string, got "+str(flagID)+" instead")
		return
		
	_contex.setFlagRaw(flagID, setValue, self)

func getTemplate():
	return [
		{
			type = "label",
			text = "Set",
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
			text = "to",
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
