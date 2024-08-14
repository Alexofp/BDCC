extends Control
onready var pack_variables = $VBoxContainer/TabContainer/Info/ScrollContainer/PackVariables
onready var generated_text_dialog = $GeneratedTextDialog
onready var generated_text_edit = $GeneratedTextDialog/GeneratedTextEdit
onready var state_name_edit = $VBoxContainer/TabContainer/States/HBoxContainer/VBoxContainer/HBoxContainer/StateNameEdit
onready var states_list = $VBoxContainer/TabContainer/States/HBoxContainer/VBoxContainer/StatesList
onready var state_pack_variables = $VBoxContainer/TabContainer/States/HBoxContainer/ScrollContainer/VBoxContainer/StatePackVariables
onready var action_pack_variables = $VBoxContainer/TabContainer/States/HBoxContainer/ScrollContainer/VBoxContainer/ActionPackVariables
onready var state_panel = $VBoxContainer/TabContainer/States/HBoxContainer/ScrollContainer/VBoxContainer
onready var actions_list = $VBoxContainer/TabContainer/States/HBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/ActionsList
onready var action_name_edit = $VBoxContainer/TabContainer/States/HBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/HBoxContainer/ActionNameEdit
onready var pick_load_dialog = $PickLoadDialog
onready var saved_interaction_list = $PickLoadDialog/VBoxContainer/SavedInteractionList


var interaction:CreatedInteraction = CreatedInteraction.new()
var selectedState:String = ""
var selectedAction:String = ""

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
	showGenText(interaction.generateCode())


func _on_AddStateButton_pressed():
	var actionName = state_name_edit.text
	
	if(interaction.states.has(actionName)):
		return
	var newState:CreatedInteractionState = CreatedInteractionState.new()
	newState.id = actionName
	interaction.states[actionName] = newState
	
	if(interaction.states.size() == 1):
		selectedState = newState.id
	
	updateStatesList()
	updateSelectedState()

func updateStatesList():
	states_list.clear()
	
	var _i = 0
	for stateID in interaction.states:
		var state:CreatedInteractionState = interaction.states[stateID]
		states_list.add_item(state.id if state.id != "" else "init")
		if(state.id == selectedState):
			states_list.select(_i)
		_i += 1

func _on_StatesList_item_selected(index):
	if(index < 0 || index >= interaction.states.size()):
		return
	
	selectedState = interaction.states.keys()[index]
	var state:CreatedInteractionState = interaction.states[selectedState]
	if(!state.actions.empty()):
		selectedAction = state.actions.keys()[0]
	else:
		selectedAction = ""
	updateSelectedState()

func updateSelectedState():
	if(!interaction.states.has(selectedState)):
		state_panel.visible = false
		return
	state_panel.visible = true
	
	var theState:CreatedInteractionState = interaction.states[selectedState]
	
	state_pack_variables.setVariables(theState.getEditVars())
	
	actions_list.clear()
	var _i = 0
	for actionID in theState.actions:
		var action:CreatedInteractionAction = theState.actions[actionID]
		actions_list.add_item(action.id)
		if(action.id == selectedAction):
			actions_list.select(_i)
		_i += 1
	
	updateSelectedAction()

func _on_RemoveStateButton_pressed():
	if(interaction.states.has(selectedState)):
		var _ok = interaction.states.erase(selectedState)
		selectedState = ""
	
		updateStatesList()
		updateSelectedState()


func _on_StatePackVariables_onVariableChange(id, value):
	var theState:CreatedInteractionState = interaction.states[selectedState]
	theState.applyEditVar(id, value)


func _on_ActionsList_item_selected(index):
	if(!interaction.states.has(selectedState)):
		return
	var theState:CreatedInteractionState = interaction.states[selectedState]
	
	if(index < 0 || index >= theState.actions.size()):
		return
	
	selectedAction = theState.actions.keys()[index]
	updateSelectedAction()
	
func updateSelectedAction():
	action_pack_variables.visible = false
	if(!interaction.states.has(selectedState)):
		return
	var theState:CreatedInteractionState = interaction.states[selectedState]
	if(!theState.actions.has(selectedAction)):
		return
	var theAction:CreatedInteractionAction = theState.actions[selectedAction]
	action_pack_variables.visible = true
	action_pack_variables.setVariables(theAction.getEditVars())

func _on_RemoveActionButton_pressed():
	if(!interaction.states.has(selectedState)):
		return
	var theState:CreatedInteractionState = interaction.states[selectedState]
	
	if(!theState.actions.has(selectedAction)):
		return
	
	var _ok = theState.actions.erase(selectedAction)
	updateSelectedState()
	updateSelectedAction()

func _on_AddActionButton_pressed():
	state_pack_variables.checkWidgetsFinished()
	if(!interaction.states.has(selectedState)):
		return
	var theState:CreatedInteractionState = interaction.states[selectedState]
	var newActionName:String = action_name_edit.text
	
	if(newActionName == "" && theState.actions.has(newActionName)):
		return
	
	var newID:String = newActionName
	newID = newID.to_lower().replace(" ", "_")
	
	var newAction:CreatedInteractionAction = CreatedInteractionAction.new()
	newAction.id = newID
	newAction.name = newActionName
	theState.actions[newID] = newAction
	updateSelectedState()
	updateSelectedAction()


func _on_ActionPackVariables_onVariableChange(id, value):
	if(!interaction.states.has(selectedState)):
		return
	var theState:CreatedInteractionState = interaction.states[selectedState]
	if(!theState.actions.has(selectedAction)):
		return
	var theAction:CreatedInteractionAction = theState.actions[selectedAction]
	
	theAction.applyEditVar(id, value)


func _on_SaveButton_pressed():
	interaction.saveToFile()


func _on_PickLoadDialog_confirmed():
	if(!filesToLoad.has(selectedFile)):
		return
	
	interaction.loadFromFile(selectedFile)
	updateInteraction()
	updateStatesList()
	updateSelectedState()

var filesToLoad:Array = []
var selectedFile:String = ""

func _on_LoadButton_pressed():
	filesToLoad.clear()
	saved_interaction_list.clear()
	var _i = 0
	for filePath in Util.getFilesInFolder("user://createdInteractions"):
		filesToLoad.append(filePath)
		saved_interaction_list.add_item(filePath)
		if(selectedFile == filePath):
			saved_interaction_list.select(_i)
		_i += 1

	if(selectedFile == "" && filesToLoad.size() > 0):
		selectedFile = filesToLoad[0]
	pick_load_dialog.popup_centered()


func _on_SavedInteractionList_item_selected(index):
	if(index < 0 || index >= filesToLoad.size()):
		return
	
	selectedFile = filesToLoad[index]

func _on_DownActionButton_pressed():
	if(!interaction.states.has(selectedState)):
		return
	var theState:CreatedInteractionState = interaction.states[selectedState]
	if(!theState.actions.has(selectedAction)):
		return
	Util.moveKeyDown(theState.actions, selectedAction)
	updateSelectedState()

func _on_UpActionButton_pressed():
	if(!interaction.states.has(selectedState)):
		return
	var theState:CreatedInteractionState = interaction.states[selectedState]
	if(!theState.actions.has(selectedAction)):
		return
	Util.moveKeyUp(theState.actions, selectedAction)
	updateSelectedState()


func _on_DownStateButton_pressed():
	if(!interaction.states.has(selectedState)):
		return
	Util.moveKeyDown(interaction.states, selectedState)
	updateStatesList()

func _on_UpStateButton_pressed():
	if(!interaction.states.has(selectedState)):
		return
	Util.moveKeyUp(interaction.states, selectedState)
	updateStatesList()
