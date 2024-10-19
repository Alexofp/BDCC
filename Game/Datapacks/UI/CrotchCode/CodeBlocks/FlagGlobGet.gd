extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/FlagGet.gd"

func execute(_contex:CodeContex):
	var flagID = str(varNameSlot.getValue(_contex))
	
	if(_contex.hadAnError()):
		return null
	if(!isString(flagID)):
		throwError(_contex, "Flag id must a string, got "+str(flagID)+" instead")
		return null
	
	return _contex.getFlagRaw(flagID)

func getTemplate():
	return [
		{
			type = "label",
			text = "Get",
		},
		{
			type = "slot",
			id = "var",
			slot = varNameSlot,
			slotType = CrotchBlocks.VALUE,
			extraType = 4,
			expand = true,
		},
	]

func updateEditor(_editor):
	pass
	
func updateVisualSlot(_editor, _id, _visSlot):
	pass

func getVisualBlockTheme():
	return themeFlagGlobal
