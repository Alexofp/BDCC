extends Control

var dialogWhat = ""
onready var addDialog = $WindowDialog

onready var actionPriority = $VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/ActionPropertiesList/ActionPriority

onready var statesList = $VBoxContainer/HBoxContainer/StatesActionsList/StatesList
onready var domActionsList = $VBoxContainer/HBoxContainer/StatesActionsList/DomActionsList
onready var subActionsList = $VBoxContainer/HBoxContainer/StatesActionsList/SubActionsList

var states = {}
var domActions = {}
var subActions = {}
var selectedState = ""
var selectedDomAction = ""
var selectedSubAction = ""
var currentlyEditing = ""

func updateLeftPanel():
	statesList.clear()
	domActionsList.clear()
	subActionsList.clear()
	
	var i = 0
	for stateID in states:
		if(stateID == ""):
			statesList.add_item("-INITIAL STATE-")
		else:
			statesList.add_item(stateID)
		if(selectedState == stateID):
			statesList.select(i)
		i+=1
		
	if(states.has(selectedState)):
		var theState = states[selectedState]
		var theDomActions = theState["domActions"]
		var theSubActions = theState["subActions"]
		
		i = 0
		for domActionID in theDomActions:
			domActionsList.add_item(domActionID)
			if(selectedDomAction == domActionID):
				domActionsList.select(i)
			i+=1
		i = 0
		for subActionID in theSubActions:
			subActionsList.add_item(subActionID)
			if(selectedSubAction == subActionID):
				subActionsList.select(i)
			i+=1

func _ready():
	actionPriority.setOptionName("Priority")

func showAddDialog(theID, text):
	dialogWhat = theID
	$WindowDialog/VBoxContainer/Label.text = text
	$WindowDialog/VBoxContainer/HBoxContainer/LineEdit.text = ""
	addDialog.show_modal()

func _on_WindowAddButton_pressed():
	if(dialogWhat == ""):
		return
	
	var theIdText = $WindowDialog/VBoxContainer/HBoxContainer/LineEdit.text
	addDialog.hide()
	

	if(dialogWhat == "addState"):
		states[theIdText] = {
			domActions = [],
			subActions = [],
			turnActions = [],
		}
		updateLeftPanel()
		return
	if(theIdText == ""):
		return
	if(dialogWhat == "addDomAction"):
		if(states.has(selectedState)):
			if(!domActions.has(theIdText)):
				domActions[theIdText] = createNewAction()
			
			var theState = states[selectedState]
			theState["domActions"].append(theIdText)
	if(dialogWhat == "addSubAction"):
		if(states.has(selectedState)):
			if(!subActions.has(theIdText)):
				subActions[theIdText] = createNewAction()
			
			var theState = states[selectedState]
			theState["subActions"].append(theIdText)
	
	updateLeftPanel()


func _on_AddStateButton_pressed():
	showAddDialog("addState", "Adding a new state")


func _on_AddDomButton_pressed():
	# Check if a state is selected
	showAddDialog("addDomAction", "Adding a new dom action")


func _on_AddSubButton_pressed():
	showAddDialog("addSubAction", "Adding a new sub aciton")


func getCurrentAction():
	if(currentlyEditing == "domAction" && domActions.has(selectedDomAction)):
		return domActions[selectedDomAction]
	if(currentlyEditing == "subAction" && subActions.has(selectedSubAction)):
		return subActions[selectedSubAction]
	return null

func getCurrentActionID():
	if(currentlyEditing == "domAction" && domActions.has(selectedDomAction)):
		return selectedDomAction
	if(currentlyEditing == "subAction" && subActions.has(selectedSubAction)):
		return selectedSubAction
	return null

func updateRightPanel():
	$VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/StatePropertiesList.visible = false
	$VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/ActionPropertiesList.visible = false
	
	if(currentlyEditing == "state"):
		$VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/StatePropertiesList.visible = true
	
	if(currentlyEditing == "domAction"):
		$VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/ActionPropertiesList.visible = true
		$VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/ActionPropertiesList/Label.text = "Editing '"+str(getCurrentActionID())+"' dom action"
	
	if(currentlyEditing == "subAction"):
		$VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/ActionPropertiesList.visible = true
		$VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/ActionPropertiesList/Label.text = "Editing '"+str(getCurrentActionID())+"' sub action"
	
	if(currentlyEditing in ["domAction", "subAction"]):
		var theAction = getCurrentAction()
		if(theAction == null):
			return
		
		
		actionPriority.setOptionValue(theAction["priority"])
		
		

func createNewAction():
	return {
		priority = 0,
		conditions = [],
		actions = [],
	}

func _on_StatePriority_value_changed(_categoryID, _id, newvalue):
	print(newvalue)
	var theAction = getCurrentAction()
	if(theAction == null):
		return
	theAction["priority"] = newvalue

func _on_StatesList_item_selected(index):
	var theSelectedStateID = states.keys()[index]
	selectedState = theSelectedStateID
	currentlyEditing = "state"
	updateLeftPanel()
	updateRightPanel()


func _on_DomActionsList_item_selected(index):
	var theSelectedID = domActions.keys()[index]
	selectedDomAction = theSelectedID
	currentlyEditing = "domAction"
	updateRightPanel()


func _on_SubActionsList_item_selected(index):
	var theSelectedID = subActions.keys()[index]
	selectedSubAction = theSelectedID
	currentlyEditing = "subAction"
	updateRightPanel()
