extends Control

onready var pack_variables = $VBoxContainer/TabContainer/Info/ScrollContainer/PackVariables
onready var vis_slot_calls = $VBoxContainer/TabContainer/States/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/ScrollContainer/PanelContainer/VisSlotCalls
onready var states_list = $VBoxContainer/TabContainer/States/HBoxContainer/StatesList/StatesList
onready var new_state_line_edit = $VBoxContainer/TabContainer/States/HBoxContainer/StatesList/HBoxContainer/NewStateLineEdit
onready var possible_code_blocks_list = $VBoxContainer/TabContainer/States/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer2/ScrollContainer/PossibleCodeBlocksList

var datapack:Datapack
var scene:DatapackScene

var mainSlotCalls = preload("res://Game/Datapacks/UI/CrotchCode/SlotCalls.gd").new()
var codeContex = CodeContex.new()

var selectedStateID:String = ""
var statesListArray = []

func _ready():
	#codeContex.connect("onPrint", self, "doOutput")
	#codeContex.connect("onError", self, "doOutputError")
	
	vis_slot_calls.setSlotCalls(mainSlotCalls)
	vis_slot_calls.editor = self
	
	possible_code_blocks_list.setEditor(self)
	possible_code_blocks_list.populate()
	

func setScene(theScene):
	scene = theScene
	updateSceneInfo()
	updateStatesList()
	updateSelectedState()

func updateSceneInfo():
	pack_variables.setVariables(scene.getEditVars())

func showAlert(theText:String):
	var theMenu = getMenu()
	if(theMenu == null):
		printerr("Was unable to show an alert, no menu var is set. Alert text is: "+str(theText))
	else:
		theMenu.showAlert(theText)

func getMenu():
	var toCheck = self
	while(toCheck != null):
		toCheck = toCheck.get_parent()
		if(toCheck.has_method("isDatapackMenu")):
			return toCheck
	return null

func _on_SaveButton_pressed():
	pack_variables.checkWidgetsFinished()
	getMenu().popMenu()

func _on_PackVariables_onVariableChange(id, value):
	if(scene.applyEditVar(id, value)):
		pass

func onMenuPopped():
	updateSceneInfo()
	updateSelectedState()


func _on_TestButton_pressed():
	print(mainSlotCalls.getBlocks())
	codeContex.execute(mainSlotCalls)
	
#func doOutput(theText):
#	if(!output_label.bbcode_text.empty()):
#		output_label.bbcode_text += "\n"+theText
#	else:
#		output_label.bbcode_text = theText
#	output_label.scroll_to_line(output_label.get_line_count()-1)
#
#func doOutputError(_codeBlock, errorText):
#	doOutput("[color=red]Line "+str(_codeBlock.lineNum)+": "+errorText+"[/color]")
#

func getPossiblePrintStrings():
	return ["Meow", "MEEEEOW", "MEOW", "RAHI???!"]

func updateStatesList():
	states_list.clear()
	statesListArray = []
	
	var _i = 0
	for stateID in scene.states:
		#var state:DatapackSceneState = scene.states[stateID]
		if(stateID == ""):
			states_list.add_item("-- Initial --")
		else:
			states_list.add_item(stateID)
		statesListArray.append(stateID)
		if(stateID == selectedStateID):
			states_list.select(_i)
		_i += 1

func _on_AddNewStateButton_pressed():
	var newStateID = new_state_line_edit.text
	# Sanitize text here
	
	var newState = DatapackSceneState.new()
	newState.id = newStateID
	scene.states[newStateID] = newState
	updateStatesList()


func _on_StatesList_item_selected(index):
	if(index < 0 || index >= statesListArray.size()):
		return
	
	selectedStateID = statesListArray[index]
	updateSelectedState()

func _on_RemoveStateButton_pressed():
	if(selectedStateID == ""):
		showAlert("You can't remove the initial scene")
		return
	if(states_list.get_selected_items().size() <= 0):
		return
	var index = states_list.get_selected_items()[0]
	
	var _ok = scene.states.erase(selectedStateID)
	index -= 1
	if(index < 0):
		index = 0
	selectedStateID = statesListArray[index]
	
	updateStatesList()
	updateSelectedState()

func updateSelectedState():
	$VBoxContainer/TabContainer/States/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Label.text = "Code for the '"+(selectedStateID if selectedStateID != "" else "Initial")+"' state"
