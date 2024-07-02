extends Control
onready var current_code_list = $VBoxContainer/ScrollContainer/CurrentCodeList
onready var possible_code_blocks_list = $VBoxContainer2/ScrollContainer2/PossibleCodeBlocksList

var blocks = []
var PrintHelloWorldBlock= preload("res://Game/Datapacks/UI/CrotchCode/CodeBlocks/PrintHelloWorldBlock.gd")
var IfBlock = preload("res://Game/Datapacks/UI/CrotchCode/CodeBlocks/IfCodeBlock.gd")
var AlwaysTrueBlock = preload("res://Game/Datapacks/UI/CrotchCode/CodeBlocks/AlwaysTrueBlock.gd")
var RawValueBlock = preload("res://Game/Datapacks/UI/CrotchCode/CodeBlocks/RawValueBlock.gd")
var PrintBlock = preload("res://Game/Datapacks/UI/CrotchCode/CodeBlocks/PrintBlock.gd")
var PlusBlock = preload("res://Game/Datapacks/UI/CrotchCode/CodeBlocks/PlusBlock.gd")
func _ready():
	var slotCalls = CrotchSlotCalls.new()
	slotCalls.addBlock(PrintHelloWorldBlock.new())
	var ifBlock = IfBlock.new()
	ifBlock.setConditionBlock(AlwaysTrueBlock.new())
	ifBlock.addThenBlock(PrintHelloWorldBlock.new())
	slotCalls.addBlock(ifBlock)
	
	var rawVal1 = RawValueBlock.new()
	rawVal1.setRawValue("Kittyyyy")
	var rawVal2 = RawValueBlock.new()
	rawVal2.setRawValue(" IS POWERFUL")
	
	var plusBlock = PlusBlock.new()
	plusBlock.setLeftBlock(rawVal1)
	plusBlock.setRightBlock(rawVal2)
	
	var printBlock = PrintBlock.new()
	printBlock.setBlock(plusBlock)
	
	slotCalls.addBlock(printBlock)
	
	slotCalls.execute()
	
	
	
	for blockID in CrotchBlocks.getAll():
		var testCodeblock = CrotchBlocks.createBlock(blockID)
		var visualScene = testCodeblock.createVisualScene()
		if(visualScene == null):
			continue
		possible_code_blocks_list.add_child(visualScene)
		visualScene.setCodeBlock(testCodeblock)
	
	var testblock = addBlockLast("base")
	testblock.data["howmany2"] = CrotchBlocks.createBlock("base")
	updateBlocks()

func addBlockLast(theID):
	var newBlock = CrotchBlocks.createBlock(theID)
	if(newBlock == null):
		return
	
	blocks.append(newBlock)
	updateBlocks()
	return newBlock

func updateBlocks():
	Util.delete_children(current_code_list)
	
	for block in blocks:
		var visualScene = block.createVisualScene()
		if(visualScene == null):
			continue
		current_code_list.add_child(visualScene)
		visualScene.setIsSpawned()
		visualScene.setCodeBlock(block)

func findAndDeleteCodeBlock(theCodeblock):
	# Do this recursively for each block
	blocks.erase(theCodeblock)
	updateBlocks()
