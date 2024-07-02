extends Object
class_name CrotchBlocks

static func getAll():
	return ["base"]

static func createBlock(theID):
	var newBlock
	if(theID == "base"):
		newBlock = load("res://Game/Datapacks/UI/CrotchCode/CrotchBlock.gd").new()
		
	if(newBlock != null):
		newBlock.initWithDefaultData()
	return newBlock
