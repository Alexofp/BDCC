extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/FlagGet.gd"

func getCategories():
	return ["Flags"]

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

func getSlot(_id):
	if(_id == "var"):
		return varNameSlot

func updateEditor(_editor):
	pass
	
func updateVisualSlot(_editor, _id, _visSlot):
	pass

func getVisualBlockTheme():
	return themeFlagGlobal
