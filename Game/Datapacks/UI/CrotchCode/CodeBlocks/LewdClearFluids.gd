extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/LewdHasX.gd"

func getType():
	return CrotchBlocks.CALL

func initOp():
	op = "clearBodyFluids"

func getFuncList():
	return [
		"clearBodyFluids",
		"clearOrificeFluids",
		"clearOrificeFluidsCheckBlocked",
	]
