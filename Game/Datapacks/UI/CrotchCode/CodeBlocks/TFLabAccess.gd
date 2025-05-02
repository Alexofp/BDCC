extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

func getCategories():
	return ["Transformation"]

func getType():
	return CrotchBlocks.LOGIC

func execute(_contex:CodeContex):
	return _contex.hasAccessToTFLab()

func getTemplate():
	return [
		{
			type = "label",
			text = "Has Lab Access",
		},
	]
