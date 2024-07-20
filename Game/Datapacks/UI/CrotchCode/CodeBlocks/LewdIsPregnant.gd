extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/LewdHasX.gd"

func initOp():
	op = "isPregnant"

func getFuncList():
	return [
		"isPregnant",
		"isVisiblyPregnant",
		"isVisiblyPregnantFromPlayer",
		"isHeavilyPregnant",
		"isReadyToGiveBirth",
		"hasAnyWomb",
		"isInHeat",
	]
