extends Control
onready var possible_code_blocks_list = $VBoxContainer2/ScrollContainer2/PossibleCodeBlocksList

onready var vis_slot_calls = $VBoxContainer/ScrollContainer/PanelContainer/VisSlotCalls
onready var output_label = $VBoxContainer/PanelContainer/OutputLabel

var mainSlotCalls = preload("res://Game/Datapacks/UI/CrotchCode/SlotCalls.gd").new()
var codeContex = CodeContex.new()

func _ready():
	codeContex.connect("onPrint", self, "doOutput")
	codeContex.connect("onError", self, "doOutputError")
	
	vis_slot_calls.setSlotCalls(mainSlotCalls)
	vis_slot_calls.editor = self
	
	possible_code_blocks_list.setEditor(self)
	possible_code_blocks_list.populate()
	

func doOutput(theText):
	if(!output_label.bbcode_text.empty()):
		output_label.bbcode_text += "\n"+theText
	else:
		output_label.bbcode_text = theText
	output_label.scroll_to_line(output_label.get_line_count()-1)

func doOutputError(_codeBlock, errorText):
	doOutput("[color=red]Line "+str(_codeBlock.lineNum)+": "+errorText+"[/color]")

func _on_ExecuteButton_pressed():
	print(mainSlotCalls.getBlocks())
	codeContex.execute(mainSlotCalls)

func getPossiblePrintStrings():
	return ["Meow", "MEOW?", "RAHI???"]
