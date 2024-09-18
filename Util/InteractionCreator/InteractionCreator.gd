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
onready var int_pack_variables = $VBoxContainer/TabContainer/Interruptions/HBoxContainer/ScrollContainer/VBoxContainer/IntPackVariables
onready var interruptions_list = $VBoxContainer/TabContainer/Interruptions/HBoxContainer/VBoxContainer/InterruptionsList
onready var int_name_edit = $VBoxContainer/TabContainer/Interruptions/HBoxContainer/VBoxContainer/HBoxContainer/IntNameEdit


var interaction:CreatedInteraction = CreatedInteraction.new()
var selectedState:String = ""
var selectedAction:String = ""
var selectedInt:String = ""

signal onClosePressed

func _ready():
	updateInteraction()
	
	updateStatesList()
	updateSelectedState()
	updateInterruptionList()
	updateSelectedInterruption()

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
	updateInterruptionList()
	updateSelectedInterruption()

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


func updateInterruptionList():
	interruptions_list.clear()
	
	var _i = 0
	for intID in interaction.interruptions:
		#var interruption:CreatedInteractionInterruption = interaction.interruptions[intID]
		interruptions_list.add_item(intID)
		if(intID == selectedInt):
			interruptions_list.select(_i)
		
		_i += 1

func updateSelectedInterruption():
	int_pack_variables.visible = true
	if(!interaction.interruptions.has(selectedInt)):
		int_pack_variables.visible = false
		return
	
	var curInterruption:CreatedInteractionInterruption = interaction.interruptions[selectedInt]
	int_pack_variables.setVariables(curInterruption.getEditVars(interaction.states.keys()))
	
func _on_InterruptionsList_item_selected(index):
	if(index < 0 || index >= interaction.interruptions.size()):
		return
	selectedInt = interaction.interruptions.keys()[index]
	updateSelectedInterruption()

func _on_DownIntButton_pressed():
	if(!interaction.interruptions.has(selectedInt)):
		return
	Util.moveKeyDown(interaction.interruptions, selectedInt)
	updateInterruptionList()

func _on_UpIntButton_pressed():
	if(!interaction.interruptions.has(selectedInt)):
		return
	Util.moveKeyUp(interaction.interruptions, selectedInt)
	updateInterruptionList()

func _on_RemoveIntButton_pressed():
	if(!interaction.interruptions.has(selectedInt)):
		return
	var _ok = interaction.interruptions.erase(selectedInt)
	selectedInt = ""
	updateSelectedInterruption()
	updateInterruptionList()

func _on_AddIntButton_pressed():
	var interruptionName:String = int_name_edit.text
	if(interruptionName == ""):
		return
	
	var newID:String = interruptionName
	newID = newID.to_lower().replace(" ", "_")
	if(interaction.interruptions.has(newID)):
		return
	
	var newAction:CreatedInteractionInterruption = CreatedInteractionInterruption.new()
	newAction.id = newID
	newAction.name = interruptionName
	interaction.interruptions[newID] = newAction
	if(selectedInt == ""):
		selectedInt = newID
	updateSelectedInterruption()
	updateInterruptionList()

func _on_IntPackVariables_onVariableChange(id, value):
	if(!interaction.interruptions.has(selectedInt)):
		return
	var selInt:CreatedInteractionInterruption = interaction.interruptions[selectedInt]
	selInt.applyEditVar(id, value)
