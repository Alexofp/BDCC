extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

func getCategories():
	return ["Game"]

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	if(!makeSureReactMode(_contex)):
		return
	_contex.showLog()

func getTemplate():
	return [
		{
			type = "label",
			text = "Show log screen",
		},
	]
