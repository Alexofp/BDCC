extends Control
onready var possible_code_blocks_list = $VBoxContainer2/ScrollContainer2/PossibleCodeBlocksList

var mainSlotCalls = preload("res://Game/Datapacks/UI/CrotchCode/SlotCalls.gd").new()
onready var vis_slot_calls = $VBoxContainer/ScrollContainer/PanelContainer/VisSlotCalls
onready var output_label = $VBoxContainer/PanelContainer/OutputLabel


var codeContex = CodeContex.new()

func _ready():
	codeContex.connect("onPrint", self, "doOutput")
	
	vis_slot_calls.setSlotCalls(mainSlotCalls)
	
	
	for blockID in CrotchBlocks.getAll():
		var testCodeblock = CrotchBlocks.createBlock(blockID)
		var visualScene = load("res://Game/Datapacks/UI/CrotchCode/CrotchBlockVisual.tscn").instance()
		if(visualScene == null):
			continue
		visualScene.id = blockID
		visualScene.setIsPickedVersion()
		possible_code_blocks_list.add_child(visualScene)
		visualScene.setCodeBlock(testCodeblock)
	
	#var testblock = addBlockLast("base")
	#testblock.data["howmany2"] = CrotchBlocks.createBlock("base")
	updateBlocks()

func updateBlocks():
	#Util.delete_children(current_code_list)
#
#	for block in blocks:
#		var visualScene = load("res://Game/Datapacks/UI/CrotchCode/CrotchBlockVisual.tscn").instance()
#		if(visualScene == null):
#			continue
#		visualScene.id = block.id
#		current_code_list.add_child(visualScene)
#		visualScene.setIsSpawned()
#		visualScene.setCodeBlock(block)
	pass

func doOutput(theText):
	if(!output_label.bbcode_text.empty()):
		output_label.bbcode_text += "\n"+theText
	else:
		output_label.bbcode_text = theText
	output_label.scroll_to_line(output_label.get_line_count()-1)

func _on_ExecuteButton_pressed():
	print(mainSlotCalls.getBlocks())
	mainSlotCalls.execute(codeContex)
