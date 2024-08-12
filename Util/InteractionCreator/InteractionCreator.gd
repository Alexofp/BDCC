extends Control
onready var pack_variables = $VBoxContainer/TabContainer/Info/ScrollContainer/PackVariables
onready var generated_text_dialog = $GeneratedTextDialog
onready var generated_text_edit = $GeneratedTextDialog/GeneratedTextEdit
onready var action_name_edit = $VBoxContainer/TabContainer/States/HBoxContainer/VBoxContainer/HBoxContainer/ActionNameEdit
onready var states_list = $VBoxContainer/TabContainer/States/HBoxContainer/VBoxContainer/StatesList
onready var state_pack_variables = $VBoxContainer/TabContainer/States/HBoxContainer/ScrollContainer/VBoxContainer/StatePackVariables
onready var action_pack_variables = $VBoxContainer/TabContainer/States/HBoxContainer/ScrollContainer/VBoxContainer/ActionPackVariables
onready var state_panel = $VBoxContainer/TabContainer/States/HBoxContainer/ScrollContainer/VBoxContainer

var interaction:CreatedInteraction = CreatedInteraction.new()
var selectedState:String = ""

signal onClosePressed

func _ready():
	updateInteraction()
	
	updateStatesList()
	updateSelectedState()

func updateInteraction():
	pack_variables.setVariables(interaction.getEditVars())
	

func _on_PackVariables_onVariableChange(id, value):
	interaction.applyEditVar(id, value)


func _on_CloseButton_pressed():
	emit_signal("onClosePressed")


func showGenText(theText:String):
	generated_text_dialog.popup_centered()
	generated_text_edit.text = theText


func _on_GenerateButton_pressed():
	showGenText("Meow")


func _on_AddStateButton_pressed():
	var actionName = action_name_edit.text
	
	if(interaction.states.has(actionName)):
		return
	var newState:CreatedInteractionState = CreatedInteractionState.new()
	newState.id = actionName
	interaction.states[actionName] = newState
	updateStatesList()

func updateStatesList():
	states_list.clear()
	
	var _i = 0
	for stateID in interaction.states:
		var state:CreatedInteractionState = interaction.states[stateID]
		states_list.add_item(state.id)
		if(state.id == selectedState):
			states_list.select(_i)
		_i += 1

func _on_StatesList_item_selected(index):
	if(index < 0 || index >= interaction.states.size()):
		return
	
	selectedState = interaction.states.keys()[index]
	updateSelectedState()

func updateSelectedState():
	if(!interaction.states.has(selectedState)):
		state_panel.visible = false
		return
	state_panel.visible = true
	
	var theState:CreatedInteractionState = interaction.states[selectedState]
	
	state_pack_variables.setVariables(theState.getEditVars())

func _on_RemoveStateButton_pressed():
	if(interaction.states.has(selectedState)):
		var _ok = interaction.states.erase(selectedState)
		selectedState = ""
	
		updateStatesList()
		updateSelectedState()


func _on_StatePackVariables_onVariableChange(id, value):
	var theState:CreatedInteractionState = interaction.states[selectedState]
	theState.applyEditVar(id, value)
