extends Control

var dialogWhat = ""
onready var addDialog = $WindowDialog

onready var actionPriority = $VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/ActionPropertiesList/ActionPriority

onready var statesList = $VBoxContainer/HBoxContainer/StatesActionsList/StatesList
onready var domActionsList = $VBoxContainer/HBoxContainer/StatesActionsList/DomActionsList
onready var subActionsList = $VBoxContainer/HBoxContainer/StatesActionsList/SubActionsList

onready var perTurnActionsList = $VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/StatePropertiesList/PerTurnActions

onready var actionEditingDialog = $ActionEditingDialog
onready var actionEditingArgsList = $ActionEditingDialog/VBoxContainer/ArgsListScroll/ArgsList
onready var actionEditingLabel = $ActionEditingDialog/VBoxContainer/Label

onready var exportedCodeDialog = $ExportedCodeDialog
onready var exportedCodeTextEdit = $ExportedCodeDialog/VBoxContainer/TextEdit

var states = {}
var domActions = {}
var subActions = {}
var selectedState = ""
var selectedDomAction = ""
var selectedSubAction = ""
var currentlyEditing = ""

var registeredActions = {}
var registeredArgScenes = {}

func _ready():
	registerAction("res://Util/SexActivityCreator/Actions/Code.gd")
	registerAction("res://Util/SexActivityCreator/Actions/BaseAction.gd")
	registerAction("res://Util/SexActivityCreator/Actions/IfCondition.gd")
	registerAction("res://Util/SexActivityCreator/Actions/EndCondition.gd")
	actionPriority.setOptionName("Priority")
	
	registerArgScene("res://Util/SexActivityCreator/ActionArgScenes/BigStringCode.tscn")

func registerArgScene(path):
	var theAction = load(path)
	var theActionObject= theAction.instance()
	registeredArgScenes[theActionObject.id] = theAction
	theActionObject.queue_free()

func createArgScene(id):
	return registeredArgScenes[id].instance()

func registerAction(path):
	var theAction = load(path)
	var theActionObject= theAction.new()
	registeredActions[theActionObject.id] = theAction
	
	perTurnActionsList.addOption(theActionObject.id, theActionObject.getName())

func createAction(id):
	return registeredActions[id].new()

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
		states[theIdText] = createNewState()
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
	
		if(!states.has(selectedState)):
			return
		
		var currentState = states[selectedState]
		perTurnActionsList.clearActions()
		var actionIndex = 0
		for action in currentState["turnActions"]:
			perTurnActionsList.addAction(actionIndex, action.getVisibleText())
			
			actionIndex += 1
	
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

func createNewState():
	return {
		domActions = [],
		subActions = [],
		turnActions = [],
	}

func _on_StatePriority_value_changed(_categoryID, _id, newvalue):
	#print(newvalue)
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

func getCurrentState():
	if(!states.has(selectedState)):
		return null
	
	return states[selectedState]

func _on_PerTurnActions_onAddButton(what):
	if(!states.has(selectedState)):
		return
	
	var currentState = states[selectedState]
	
	var newAction = createAction(what)
	#var actionIndex = currentState["turnActions"].size()
	currentState["turnActions"].append(newAction)
	
	# Start editing the new action here
	var theArgs = newAction.getArgs()
	if(theArgs != null && theArgs != {}):
		startEditingAction(newAction)
	
	updateRightPanel()


func _on_PerTurnActions_onDownPressed(id):
	var currentState = getCurrentState()
	if(currentState == null):
		return
		
	moveValueDown(currentState["turnActions"], id)
	updateRightPanel()

func _on_PerTurnActions_onUpPressed(id):
	var currentState = getCurrentState()
	if(currentState == null):
		return
	
	moveValueUp(currentState["turnActions"], id)
	updateRightPanel()

func moveValueUp(theArray, theIndex):
	var thingie = theArray[theIndex]
	theArray.remove(theIndex)
	theIndex -= 1
	if(theIndex < 0):
		theIndex = 0
	theArray.insert(theIndex, thingie)

func moveValueDown(theArray, theIndex):
	var thingie = theArray[theIndex]
	theArray.remove(theIndex)
	theIndex += 1
	if(theIndex > theArray.size()):
		theIndex = theArray.size()
	theArray.insert(theIndex, thingie)

var currentlyEditingAction = null
var addedEditingActionArgs = {}
func startEditingAction(theAction):
	addedEditingActionArgs.clear()
	currentlyEditingAction = theAction
	Util.delete_children(actionEditingArgsList)
	
	var theArgs = theAction.getArgs()
	for argID in theArgs:
		var arg = theArgs[argID]
		var theScene = createArgScene(arg["type"])
		actionEditingArgsList.add_child(theScene)
		theScene.valueID = argID
		theScene.setOptions(arg)
		if(arg.has("text")):
			theScene.setText(arg["text"])
		addedEditingActionArgs[argID] = theScene
	
	actionEditingDialog.show_modal()


func _on_ConfirmActionEditButton_pressed():
	if(currentlyEditingAction == null):
		return
	
	var result = {}
	for argID in addedEditingActionArgs:
		result[argID] = addedEditingActionArgs[argID].getData()
	print(result)
	currentlyEditingAction.applyArgs(result)
	currentlyEditingAction = null
	updateRightPanel()
	actionEditingDialog.hide()


func _on_PerTurnActions_onEditPressed(id):
	var currentState = getCurrentState()
	if(currentState == null):
		return
		
	startEditingAction(currentState["turnActions"][id])


func _on_PerTurnActions_onDeletePressed(id):
	var currentState = getCurrentState()
	if(currentState == null):
		return
	currentState["turnActions"].remove(id)
	updateRightPanel()


func _on_GenerateCodeButton_pressed():
	var result = []
	
	result.append("extends SexActivityBase")
	result.append("")
	result.append("func _init():")
	result.append("\tid = \"TESTACTIVITY\"")
	result.append("")
	result.append("func getGoals():")
	result.append("\treturn {}")
	result.append("")
	result.append("func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):")
	result.append("\treturn .canStartActivity(_sexEngine, _domInfo, _subInfo)")
	result.append("")
	result.append("func getVisibleName():")
	result.append("\treturn \"CHANGE ME\"")
	result.append("")
	result.append("func getCategory():")
	result.append("\treturn [\"Fuck\"]")
	result.append("")
	result.append("func getDomTags():")
	result.append("\treturn []")
	result.append("")
	result.append("func getSubTags():")
	result.append("\treturn []")
	result.append("")
	result.append("func getDomTagsCheck():")
	result.append("\treturn .getDomTagsCheck()")
	result.append("")
	result.append("func getSubTagsCheck():")
	result.append("\treturn .getSubTagsCheck()")
	result.append("")
	
	result.append("func startActivity(_args):")
	result.append("\tstate = \"\"")
	result.append("\tvar text = \"\"")
	# stuff should happen here
	result.append("\treturn {")
	result.append("\t\ttext = text,")
	result.append("\t}")
	result.append("")
	result.append("func onSwitchFrom(_otherActivity, _args):")
	result.append("\treturn .onSwitchFrom(_otherActivity, _args)")
	result.append("")
	result.append("func processTurn():")
	
	for stateID in states:
		var theState = states[stateID]
		result.append("\tif(state == \""+stateID+"\"):")
		result.append("\t\tvar text = \"\"")
		
		var currentFlow = 0
		
		for everyAction in theState["turnActions"]:
			var extraTabs = ""
			for _i in range(currentFlow):
				extraTabs += "\t"
			
			var generatedCode = everyAction.generateCode()
			if(generatedCode == null || generatedCode == ""):
				continue
			var genCodeAr = generatedCode.split("\n")
			for line in genCodeAr:
				result.append("\t\t"+extraTabs+line)
			
			currentFlow += everyAction.changesFlow()
		
		result.append("\t\treturn {text = text}")
		
		
	
	if(states.empty()):
		result.append("\tpass")
	
	
	exportedCodeDialog.show_modal()
	exportedCodeTextEdit.text = Util.join(result, "\n")
