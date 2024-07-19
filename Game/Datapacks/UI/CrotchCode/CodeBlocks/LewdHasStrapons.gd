extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"


func getCategories():
	return ["Game"]

func getType():
	return CrotchBlocks.VALUE

func execute(_contex:CodeContex):
	return _contex.charMethod("pc", "hasStrapons")

func getTemplate():
	return [
		{
			type = "label",
			text = "Pc has strapons",
		},
	]
