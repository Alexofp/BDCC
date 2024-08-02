extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/SceneEndScene.gd"

func getCategories():
	return ["Event"]

func getTemplate():
	return [
		{
			type = "label",
			text = "End Current Scene",
		},
	]
