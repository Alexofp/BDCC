extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/VarSet.gd"

func setRawTypeValue():
	varValueSlot.setRawType(CrotchVarType.STRING)
	varValueSlot.setRawValue("")

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
			placeholder = "text",
		},
	]
