extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/LewdHasX.gd"

func getType():
	return CrotchBlocks.CALL

func initOp():
	op = "damageClothes"

func getFuncList():
	return [
		"damageClothes",
		"repairAllClothes",
	]
