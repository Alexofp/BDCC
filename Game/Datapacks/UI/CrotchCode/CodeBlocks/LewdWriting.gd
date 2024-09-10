extends "res://Game/Datapacks/UI/CrotchCode/CodeBlocks/LewdHasX.gd"

func getType():
	return CrotchBlocks.CALL

func initOp():
	op = "addBodywritingRandom"

func getFuncList():
	return [
		"addBodywritingRandom",
		"addTallymarkFace",
		"addTallymarkCrotch",
		"addTallymarkButt",
		"clearBodywritings",
		"clearTallymarks",
	]
