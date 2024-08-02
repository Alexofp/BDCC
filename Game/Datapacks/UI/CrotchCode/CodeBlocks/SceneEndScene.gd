extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

func getCategories():
	return ["Scene"]

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	if(!makeSureReactMode(_contex)):
		return
	_contex.endScene()

func getTemplate():
	return [
		{
			type = "label",
			text = "End Scene",
		},
	]
