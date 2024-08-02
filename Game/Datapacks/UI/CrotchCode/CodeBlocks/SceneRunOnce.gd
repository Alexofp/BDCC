extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var codeSlot := CrotchSlotCalls.new()

func getCategories():
	return ["Scene"]

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	if(!makeSureRunMode(_contex)):
		return
	
	if(_contex.shouldExecuteCodeOnce()):
		codeSlot.execute(_contex)

func getTemplate():
	return [
		{
			type = "label",
			text = "Run code once",
		},
		{
			type = "slot_list",
			id = "code",
			slot = codeSlot,
		},
	]

func getSlot(_id):
	if(_id == "code"):
		return codeSlot

func shouldExpandTemplate():
	return true
