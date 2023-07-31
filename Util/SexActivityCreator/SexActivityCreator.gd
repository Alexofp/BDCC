extends Control

var dialogWhat = ""
onready var addDialog = $WindowDialog

onready var statesList = $VBoxContainer/HBoxContainer/StatesActionsList/StatesList
onready var domActionsList = $VBoxContainer/HBoxContainer/StatesActionsList/DomActionsList
onready var subActionsList = $VBoxContainer/HBoxContainer/StatesActionsList/SubActionsList

onready var perTurnActionsList = $VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/StatePropertiesList/PerTurnActions
onready var actionActionsList = $VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/ActionPropertiesList/ActionActionsList
onready var conditionsList = $VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/ActionPropertiesList/ConditionsList

onready var actionEditingDialog = $ActionEditingDialog
onready var actionEditingArgsList = $ActionEditingDialog/VBoxContainer/ArgsListScroll/ArgsList
onready var actionEditingLabel = $ActionEditingDialog/VBoxContainer/Label

onready var exportedCodeDialog = $ExportedCodeDialog
onready var exportedCodeTextEdit = $ExportedCodeDialog/VBoxContainer/TextEdit

onready var stateDynamicPropertiesList = $VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/StatePropertiesList/StateDynamicPropertiestList
onready var dynamicPropertiesList = $VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/ActionPropertiesList/DynamicPropertiestList
onready var activityPropertiesList = $VBoxContainer/ActivitySettingsScreen/VBoxContainer/ActivityPropertiesList
onready var startActionsList = $VBoxContainer/ActivitySettingsScreen/VBoxContainer/VBoxContainer/StartActionsList
onready var startConditionsList = $VBoxContainer/ActivitySettingsScreen/VBoxContainer/VBoxContainer/StartConditionsList

onready var stateDefaultAnimPicker = $VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/StatePropertiesList/StateDefaultAnimPicker
onready var animsWithConditionList = $VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/StatePropertiesList/AnimsWithConditionList

signal onClosePressed

var states = {}
var domActions = {}
var subActions = {}
var selectedState = ""
var selectedDomAction = ""
var selectedSubAction = ""
var currentlyEditing = ""

var registeredActions = {}
var registeredArgScenes = {}

var stateDynamicPropertiesObjects = {}
var dynamicPropertiesObjects = {}
var activityPropertiesObjects = {}

var customVariables = {}

func _init():
	if(!GlobalRegistry.isInitialized):
		GlobalRegistry.registerFetishesFolder("res://Game/SexEngine/Fetish/")
		GlobalRegistry.registerSexGoalsFolder("res://Game/SexEngine/Goal/")
		GlobalRegistry.registerStageSceneFolder("res://Player/StageScene3D/Scenes/")

func _ready():
	
	for path in Util.getFilesInFolder("res://Util/SexActivityCreator/Actions/"):
		registerAction(path)
	for path in Util.getFilesInFolder("res://Util/SexActivityCreator/Conditions/"):
		registerAction(path)
	
	for path in Util.getFilesInFolder("res://Util/SexActivityCreator/ActionArgScenes/"):
		if(path.get_extension() == "tscn"):
			registerArgScene(path)

	var actionPropertiesData = getActionProperties()
	for propertyID in actionPropertiesData:
		var theData = actionPropertiesData[propertyID]
		var theScene = createArgScene(theData["type"])
		dynamicPropertiesList.add_child(theScene)
		theScene.dataID = propertyID
		theScene.setOptions(theData)
		if(theData.has("text")):
			theScene.setText(theData["text"])
		theScene.connect("onChange", self, "onActionPropertyChange")
		dynamicPropertiesObjects[propertyID] = theScene
		
	var statePropertiesData = getStateProperties()
	for propertyID in statePropertiesData:
		var theData = statePropertiesData[propertyID]
		var theScene = createArgScene(theData["type"])
		stateDynamicPropertiesList.add_child(theScene)
		theScene.dataID = propertyID
		theScene.setOptions(theData)
		if(theData.has("text")):
			theScene.setText(theData["text"])
		theScene.connect("onChange", self, "onStatePropertyChange")
		stateDynamicPropertiesObjects[propertyID] = theScene

	var activityPropertiesData = getSexActivityProperties()
	for propertyID in activityPropertiesData:
		var theData = activityPropertiesData[propertyID]
		var theScene = createArgScene(theData["type"])
		activityPropertiesList.add_child(theScene)
		theScene.dataID = propertyID
		theScene.setOptions(theData)
		if(theData.has("text")):
			theScene.setText(theData["text"])
		theScene.setData(sexActivityProperties[propertyID])
		theScene.connect("onChange", self, "onActivityPropertyChange")
		activityPropertiesObjects[propertyID] = theScene
	
	hideAllScreens()
	$VBoxContainer/ActivitySettingsScreen.visible = true
	states[""] = createNewState()
	updateLeftPanel()
	updateRightPanel()
	

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
	if(theActionObject.id == "error"):
		return
	registeredActions[theActionObject.id] = theAction
	
	if(theActionObject.isAction()):
		perTurnActionsList.addOption(theActionObject.id, theActionObject.getName())
		actionActionsList.addOption(theActionObject.id, theActionObject.getName())
		startActionsList.addOption(theActionObject.id, theActionObject.getName())
	if(theActionObject.isCondition()):
		conditionsList.addOption(theActionObject.id, theActionObject.getName())
		startConditionsList.addOption(theActionObject.id, theActionObject.getName())
	
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
	if(states.has(selectedState)):
		showAddDialog("addDomAction", "Adding a new dom action")


func _on_AddSubButton_pressed():
	if(states.has(selectedState)):
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
	
	startActionsList.actionObjects = sexActivityProperties["startActions"]
	startActionsList.updateActions()
	
	startConditionsList.actionObjects = sexActivityProperties["startConditions"]
	startConditionsList.updateActions()
	
	if(currentlyEditing == "state"):
		$VBoxContainer/HBoxContainer/ScrollContainer/VBoxContainer/StatePropertiesList.visible = true
	
		if(!states.has(selectedState)):
			return
		
		var currentState = states[selectedState]
		perTurnActionsList.actionObjects = currentState["turnActions"]
		perTurnActionsList.updateActions()
#		perTurnActionsList.clearActions()
#		var actionIndex = 0
#		for action in currentState["turnActions"]:
#			perTurnActionsList.addAction(actionIndex, action.getVisibleText())
#
#			actionIndex += 1
		for propertyID in stateDynamicPropertiesObjects:
			stateDynamicPropertiesObjects[propertyID].setData(currentState[propertyID])
		
		stateDefaultAnimPicker.setData(currentState["animation"])
		
		Util.delete_children(animsWithConditionList)
		var index = 0
		for animWithCondition in currentState["animsWithCondition"]:
			var newConAnimScene = preload("res://Util/SexActivityCreator/AnimPickerWithCondition.tscn").instance()
			animsWithConditionList.add_child(newConAnimScene)
			newConAnimScene.setData(animWithCondition)
			newConAnimScene.id = index
			newConAnimScene.connect("onDeletePressed", self, "onDeletingAnimWithCondition")
			newConAnimScene.connect("onUpPressed", self, "onUpAnimWithCondition")
			index += 1
	
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
		
		
		actionActionsList.actionObjects = theAction["actions"]
		actionActionsList.updateActions()
		conditionsList.actionObjects = theAction["conditions"]
		conditionsList.updateActions()
		
		for propertyID in dynamicPropertiesObjects:
			dynamicPropertiesObjects[propertyID].setData(theAction[propertyID])

func createNewAction():
	return {
		priority = 0,
		conditions = [],
		actions = [],
		name = "New action",
		desc = "Change the description",
		score = "1.0",
		chance = "",
	}

func createNewState():
	return {
		domActions = [],
		subActions = [],
		turnActions = [],
		animation = {
			selectedStage = StageScene.SexAllFours,
			selecedAnim = "tease",
			selectedPC = "domID",
			selectedNPC = "subID",
		},
		animsWithCondition = [],
	}

func getActionProperties():
	return {
		"priority": {
			"text": "Priority",
			"type": "number",
		},
		"name": {
			"text": "Name",
			"type": "string",
		},
		"desc": {
			"text": "Description",
			"type": "string",
		},
		"score": {
			"text": "Score",
			"type": "string",
		},
		"chance": {
			"text": "Chance",
			"type": "string",
		},
	}

func getStateProperties():
	return {
	}

var sexActivityProperties = {
	"id": "new_sex_action",
	"name": "New sex action",
	"startActions": [],
	"startConditions": [],
	"category": "return [\"Fuck\"]",
	"goals": {},
	"domTags": {},
	"subTags": {},
}
func getSexActivityProperties():
	return {
		"id": {
			"text": "ID",
			"type": "string",
		},
		"name": {
			"text": "Name",
			"type": "string",
		},
		"category": {
			"text": "Category",
			"type": "string",
		},
		"goals": {
			"text": "Goals",
			"type": "fetishesWithNumbers",
			"goals": true,
		},
		"domTags": {
			"text": "Dom tags",
			"type": "tags",
			"tags": SexActivityTag.getAllStrings(),
		},
		"subTags": {
			"text": "Sub tags",
			"type": "tags",
			"tags": SexActivityTag.getAllStrings(),
		},
	}

func _on_StatesList_item_selected(index):
	var theSelectedStateID = states.keys()[index]
	selectedState = theSelectedStateID
	currentlyEditing = "state"
	updateLeftPanel()
	updateRightPanel()


func _on_DomActionsList_item_selected(index):
	var currentState = getCurrentState()
	if(currentState == null):
		return
	
	var theSelectedID = currentState["domActions"][index]
	selectedDomAction = theSelectedID
	currentlyEditing = "domAction"
	updateRightPanel()


func _on_SubActionsList_item_selected(index):
	var currentState = getCurrentState()
	if(currentState == null):
		return
	
	var theSelectedID = currentState["subActions"][index]
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

func processTags(theTags):
	var result = []
	for tag in theTags:
		result.append("SexActivityTag."+tag)
	return Util.join(result, ", ")

func _on_GenerateCodeButton_pressed():
	var result = []
	
	result.append("extends SexActivityBase")
	if(!customVariables.empty()):
		result.append("")
		for varID in customVariables:
			result.append("var "+varID+" = "+customVariables[varID]["default"])
	
	result.append("")
	result.append("func _init():")
	result.append("\tid = \""+sexActivityProperties["id"]+"\"")
	result.append("")
	result.append("func getGoals():")
	result.append("\treturn {")
	for goalID in sexActivityProperties["goals"]:
		result.append("\t\t"+goalID+": "+sexActivityProperties["goals"][goalID]+",")
	result.append("\t}")
	result.append("")
	result.append("func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):")
	for condition in sexActivityProperties["startConditions"]:
		result.append("\tif(!("+condition.generateCode()+")):")
		result.append("\t\treturn false")
	result.append("\treturn .canStartActivity(_sexEngine, _domInfo, _subInfo)")
	result.append("")
	result.append("func getVisibleName():")
	result.append("\treturn \""+sexActivityProperties["name"]+"\"")
	result.append("")
	result.append("func getCategory():")
	result.append("\t"+sexActivityProperties["category"])
	result.append("")
	result.append("func getDomTags():")
	result.append("\treturn ["+processTags(sexActivityProperties["domTags"])+"]")
	result.append("")
	result.append("func getSubTags():")
	result.append("\treturn ["+processTags(sexActivityProperties["subTags"])+"]")
#	result.append("")
#	result.append("func getDomTagsCheck():")
#	result.append("\treturn .getDomTagsCheck()")
#	result.append("")
#	result.append("func getSubTagsCheck():")
#	result.append("\treturn .getSubTagsCheck()")
	result.append("")
	
	result.append("func startActivity(_args):")
	result.append("\tstate = \"\"")
	result.append("\tvar text = \"\"")
	var hasDomSubReactions = false
	if(hasDomSubAction(sexActivityProperties["startActions"])):
		hasDomSubReactions = true
		result.append("\tvar domSay = null")
		result.append("\tvar subSay = null")
	# stuff should happen here
	if(true):
		var currentFlow = 0
		
		for everyAction in sexActivityProperties["startActions"]:
			currentFlow += everyAction.preChangeFlow()
			var extraTabs = ""
			for _i in range(currentFlow):
				extraTabs += "\t"
			
			var generatedCode = everyAction.generateCode()
			if(generatedCode == null || generatedCode == ""):
				currentFlow += everyAction.changesFlow()
				continue
			var genCodeAr = generatedCode.split("\n")
			for line in genCodeAr:
				result.append("\t"+extraTabs+line)
			
			currentFlow += everyAction.changesFlow()
	result.append("\treturn {")
	result.append("\t\ttext = text,")
	if(hasDomSubReactions):
		result.append("\t\tdomSay = domSay,")
		result.append("\t\tsubSay = subSay,")
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
		var hasDomSubReactionsTurn = false
		if(hasDomSubAction(theState["turnActions"])):
			hasDomSubReactionsTurn = true
			result.append("\t\tvar domSay = null")
			result.append("\t\tvar subSay = null")
		
		var currentFlow = 0
		
		for everyAction in theState["turnActions"]:
			currentFlow += everyAction.preChangeFlow()
			var extraTabs = ""
			for _i in range(currentFlow):
				extraTabs += "\t"
			
			var generatedCode = everyAction.generateCode()
			if(generatedCode == null || generatedCode == ""):
				currentFlow += everyAction.changesFlow()
				continue
			var genCodeAr = generatedCode.split("\n")
			for line in genCodeAr:
				result.append("\t\t"+extraTabs+line)
			
			currentFlow += everyAction.changesFlow()
		
		result.append("\t\treturn {")
		result.append("\t\t\ttext = text,")
		if(hasDomSubReactionsTurn):
			result.append("\t\t\tdomSay = domSay,")
			result.append("\t\t\tsubSay = subSay,")
		result.append("\t\t}")
		
		
	
	if(states.empty()):
		result.append("\tpass")
	
	result.append("")
	var domActionToStates = {}
	var subActionToStates = {}
	for stateID in states:
		for actionID in states[stateID]["domActions"]:
			if(!domActionToStates.has(actionID)):
				domActionToStates[actionID] = []
			domActionToStates[actionID].append(stateID)
		for actionID in states[stateID]["subActions"]:
			if(!subActionToStates.has(actionID)):
				subActionToStates[actionID] = []
			subActionToStates[actionID].append(stateID)
	
	var actionsStuff = [
		["func getDomActions():", domActionToStates, domActions, "func doDomAction(_id, _actionInfo):"],
		["func getSubActions():", subActionToStates, subActions, "func doSubAction(_id, _actionInfo):"],
	]
	
	for actionSide in actionsStuff:
		result.append(actionSide[0])
		result.append("\tvar actions = []")
		for actionID in actionSide[1]:
			var usedStates = actionSide[1][actionID]
			result.append("\tif(state in ["+Util.joinWithBorders(usedStates, ", ", "\"")+"]):")
			
			var theAction = actionSide[2][actionID]
			var beforeTT = "\t\t"
			if(theAction["conditions"].size() > 0):
				var cons = []
				for con in theAction["conditions"]:
					cons.append(con.generateCode())
				
				result.append("\t\tif("+Util.joinWithDifferentBorders(cons, " && ", "(", ")")+"):")
				beforeTT = "\t\t\t"
			
			result.append(beforeTT+"actions.append({")
			result.append(beforeTT+'\t"id": "'+actionID+'",')
			result.append(beforeTT+'\t"score": '+str(theAction["score"])+',')
			result.append(beforeTT+'\t"name": "'+str(theAction["name"])+'",')
			result.append(beforeTT+'\t"desc": "'+str(theAction["desc"])+'",')
			result.append(beforeTT+'\t"priority" : '+str(theAction["priority"])+',')
			if(theAction["chance"] != ""):
				result.append(beforeTT+'\t"chance" : '+str(theAction["chance"])+',')
			result.append(beforeTT+"})")
				
		result.append("\treturn actions")
		result.append("")
		
		result.append(actionSide[3])
		if(actionSide[2].empty()):
			result.append("\tpass")
		
		for actionID in actionSide[2]:
			result.append("\tif(_id == \""+actionID+"\"):")
			result.append("\t\tvar text = \"\"")
			var hasDomSubReactionsActions = false
			if(hasDomSubAction(actionSide[2][actionID]["actions"])):
				hasDomSubReactionsActions = true
				result.append("\t\tvar domSay = null")
				result.append("\t\tvar subSay = null")
			
			var currentFlow = 0
			
			for everyAction in actionSide[2][actionID]["actions"]:
				currentFlow += everyAction.preChangeFlow()
				var extraTabs = ""
				for _i in range(currentFlow):
					extraTabs += "\t"
				
				var generatedCode = everyAction.generateCode()
				if(generatedCode == null || generatedCode == ""):
					currentFlow += everyAction.changesFlow()
					continue
				var genCodeAr = generatedCode.split("\n")
				for line in genCodeAr:
					result.append("\t\t"+extraTabs+line)
				
				currentFlow += everyAction.changesFlow()
			
			result.append("\t\treturn {")
			result.append("\t\t\ttext = text,")
			if(hasDomSubReactionsActions):
				result.append("\t\t\tdomSay = domSay,")
				result.append("\t\t\tsubSay = subSay,")
			result.append("\t\t}")
		
		result.append("")
	
	var customCodeText = $VBoxContainer/CustomCodeTab/TextEdit.text
	for line in customCodeText.split("\n"):
		result.append(line)
	
	if(!customVariables.empty()):
		result.append("")
		
		result.append("func saveData():")
		result.append("\tvar data = .saveData()")
		result.append("")
		for varID in customVariables:
			result.append("\tdata[\""+varID+"\"] = "+varID)
		
		result.append("")
		result.append("\treturn data")
		result.append("")
		result.append("func loadData(_data):")
		result.append("\t.loadData(_data)")
		result.append("")
		for varID in customVariables:
			result.append("\t"+varID+" = SAVE.loadVar(_data, \""+varID+"\", "+customVariables[varID]["default"]+")")
	
	if(!states.empty()):
		result.append("")
		result.append("func getAnimation():")
		
		for stateID in states:
			var state = states[stateID]
			var anim = state["animation"]
			
			result.append("\tif(state == \""+stateID+"\"):")
			for animWithCondition in state["animsWithCondition"]:
				var conanim = animWithCondition["animData"]
				result.append("\t\tif("+animWithCondition["condition"]+"):")
				result.append("\t\t\treturn [StageScene."+conanim["selectedStage"]+", \""+conanim["selecedAnim"]+"\", {pc="+conanim["selectedPC"]+", npc="+conanim["selectedNPC"]+"}]")
			
			result.append("\t\treturn [StageScene."+anim["selectedStage"]+", \""+anim["selecedAnim"]+"\", {pc="+anim["selectedPC"]+", npc="+anim["selectedNPC"]+"}]")
			
	
	exportedCodeDialog.show_modal()
	exportedCodeTextEdit.text = Util.join(result, "\n")


func _on_ActionActionsList_onAddButton(what):
	var theCurrentAction = getCurrentAction()
	if(theCurrentAction == null):
		return
	
	var newAction = createAction(what)
	#var actionIndex = currentState["turnActions"].size()
	theCurrentAction["actions"].append(newAction)
	
	# Start editing the new action here
	var theArgs = newAction.getArgs()
	if(theArgs != null && theArgs != {}):
		startEditingAction(newAction)
	
	updateRightPanel()


func _on_ActionActionsList_onEditPressed(id):
	var theCurrentAction = getCurrentAction()
	if(theCurrentAction == null):
		return
		
	startEditingAction(theCurrentAction["actions"][id])


func _on_ConditionsList_onAddButton(what):
	var theCurrentAction = getCurrentAction()
	if(theCurrentAction == null):
		return
	
	var newAction = createAction(what)
	#var actionIndex = currentState["turnActions"].size()
	theCurrentAction["conditions"].append(newAction)
	
	# Start editing the new action here
	var theArgs = newAction.getArgs()
	if(theArgs != null && theArgs != {}):
		startEditingAction(newAction)
	
	updateRightPanel()


func _on_ConditionsList_onEditPressed(id):
	var theCurrentAction = getCurrentAction()
	if(theCurrentAction == null):
		return
		
	startEditingAction(theCurrentAction["conditions"][id])

func onActionPropertyChange(id, data):
	var theCurrentAction = getCurrentAction()
	if(theCurrentAction == null):
		return
	
	if(!theCurrentAction.has(id)):
		assert(false, "There is no "+str(id)+" in this")
	
	theCurrentAction[id] = data

func onStatePropertyChange(id, data):
	var theCurrentState = getCurrentState()
	if(theCurrentState == null):
		return
	
	if(!theCurrentState.has(id)):
		assert(false, "There is no "+str(id)+" in this")
	
	theCurrentState[id] = data

func onActivityPropertyChange(id, data):
	if(!sexActivityProperties.has(id)):
		assert(false, "There is no "+str(id)+" in this")
	
	sexActivityProperties[id] = data


func hideAllScreens():
	$VBoxContainer/HBoxContainer.visible = false
	$VBoxContainer/ActivitySettingsScreen.visible = false
	$VBoxContainer/CustomCodeTab.visible = false
	$VBoxContainer/CustomVariablesTab.visible = false

func _on_ActivitySettingsButton_pressed():
	hideAllScreens()
	$VBoxContainer/ActivitySettingsScreen.visible = true

func _on_StateAndActionsSettings_pressed():
	hideAllScreens()
	$VBoxContainer/HBoxContainer.visible = true


func _on_StartActionsList_onAddButton(what):
	var newAction = createAction(what)
	#var actionIndex = currentState["turnActions"].size()
	sexActivityProperties["startActions"].append(newAction)
	
	# Start editing the new action here
	var theArgs = newAction.getArgs()
	if(theArgs != null && theArgs != {}):
		startEditingAction(newAction)
	
	updateRightPanel()

func _on_StartActionsList_onEditPressed(id):
	startEditingAction(sexActivityProperties["startActions"][id])


func _on_CustomCodeButton_pressed():
	hideAllScreens()
	$VBoxContainer/CustomCodeTab.visible = true


func _on_CustomVarsButton_pressed():
	hideAllScreens()
	$VBoxContainer/CustomVariablesTab.visible = true

func updateVariableList():
	$VBoxContainer/CustomVariablesTab/VariableList.clear()
	for variableID in customVariables:
		$VBoxContainer/CustomVariablesTab/VariableList.add_item(variableID + " = "+str(customVariables[variableID]["default"]))
		
func _on_AddVariableButton_pressed():
	var newVarName = $VBoxContainer/CustomVariablesTab/VBoxContainer/HBoxContainer/LineEdit.text
	var newVarDefault = $VBoxContainer/CustomVariablesTab/VBoxContainer/HBoxContainer2/LineEdit.text
	if(newVarName == "" || newVarDefault == ""):
		return
	
	customVariables[newVarName] = {default = newVarDefault}
	updateVariableList()

func _on_RemoveVariableButton_pressed():
	if(!$VBoxContainer/CustomVariablesTab/VariableList.is_anything_selected()):
		return
	
	var selectedVarIndex = $VBoxContainer/CustomVariablesTab/VariableList.get_selected_items()[0]
	var selectedVar = customVariables.keys()[selectedVarIndex]
	customVariables.erase(selectedVar)
	updateVariableList()


#var states = {}
#var domActions = {}
#var subActions = {}
#
#var customVariables = {}

func serializeActions(actionsArray):
	var result = []
	for action in actionsArray:
		result.append({
			id = action.id,
			data = action.saveData(),
		})
	return result

func fixActionKeys(actionOrStateArray):
	for actionOrStateID in actionOrStateArray:
		var actionOrState = actionOrStateArray[actionOrStateID]
		for key in actionOrState:
			if(actionOrState[key] is Array && actionOrState[key].size() > 0 && actionOrState[key][0] is Reference):
				actionOrState[key] = serializeActions(actionOrState[key])
	return actionOrStateArray

func fixPropertiesKeys(actionOrState):
	for key in actionOrState:
		if(actionOrState[key] is Array && actionOrState[key].size() > 0 && actionOrState[key][0] is Reference):
			actionOrState[key] = serializeActions(actionOrState[key])
	return actionOrState

func _on_SaveButton_pressed():
	var customCodeText = $VBoxContainer/CustomCodeTab/TextEdit.text
	
	var data = {
		"sexActivityProperties": fixPropertiesKeys(sexActivityProperties.duplicate(true)),
		"states": fixActionKeys(states.duplicate(true)),
		"domActions": fixActionKeys(domActions.duplicate(true)),
		"subActions": fixActionKeys(subActions.duplicate(true)),
		"customVariables": customVariables,
		"customCodeText": customCodeText,
	}
	
	var resultText = JSON.print(data)#, "\t"
	exportedCodeTextEdit.text = resultText
	exportedCodeDialog.show_modal()


func _on_LoadButton_pressed():
	$LoadCodeDialog.visible = true

func loadOr(data, key, nullValue = null):
	if(!data.has(key)):
		return nullValue
	return data[key]

func convertDataToActions(dataArray):
	var result = []
	for oldAction in dataArray:
		var newAction = createAction(oldAction["id"])
		newAction.loadData(oldAction["data"])
		result.append(newAction)
	return result

func _on_LoadEverythingButton_pressed():
	selectedState = ""
	selectedDomAction = ""
	selectedSubAction = ""
	currentlyEditing = ""
	
	var dataStr = $LoadCodeDialog/VBoxContainer/TextEdit.text
	var data = JSON.parse(dataStr).result
	var customCodeText = loadOr(data, "customCodeText", "")
	$VBoxContainer/CustomCodeTab/TextEdit.text = customCodeText
	
	customVariables = loadOr(data, "customVariables", {})
	sexActivityProperties = loadOr(data, "sexActivityProperties", {})
	sexActivityProperties["startActions"] = convertDataToActions(sexActivityProperties["startActions"])
	sexActivityProperties["startConditions"] = convertDataToActions(sexActivityProperties["startConditions"])

	states = loadOr(data, "states", {})
	
	for stateID in states:
		var idealState = createNewState()
		var state = states[stateID]
		for key in idealState:
			if(!state.has(key)):
				state[key] = idealState[key]
	
	for stateID in states:
		var state = states[stateID]
		state["turnActions"] = convertDataToActions(state["turnActions"])

	domActions = loadOr(data, "domActions", {})
	
	for actionID in domActions:
		var idealAction = createNewAction()
		var action = domActions[actionID]
		for key in idealAction:
			if(!action.has(key)):
				action[key] = idealAction[key]
	
	for actionID in domActions:
		var action = domActions[actionID]
		action["conditions"] = convertDataToActions(action["conditions"])
		action["actions"] = convertDataToActions(action["actions"])

	subActions = loadOr(data, "subActions", {})
	#
	for actionID in subActions:
		var idealAction = createNewAction()
		var action = subActions[actionID]
		for key in idealAction:
			if(!action.has(key)):
				action[key] = idealAction[key]
	
	for actionID in subActions:
		var action = subActions[actionID]
		action["conditions"] = convertDataToActions(action["conditions"])
		action["actions"] = convertDataToActions(action["actions"])

	var activityPropertiesData = getSexActivityProperties()
	for propertyID in activityPropertiesData:
		#var theData = activityPropertiesData[propertyID]
		#var theScene = createArgScene(theData["type"])
		#activityPropertiesList.add_child(theScene)
		#theScene.dataID = propertyID
		#theScene.setOptions(theData)
		#if(theData.has("text")):
		#	theScene.setText(theData["text"])
		activityPropertiesObjects[propertyID].setData(sexActivityProperties[propertyID])
		#theScene.connect("onChange", self, "onActivityPropertyChange")
		#activityPropertiesObjects[propertyID] = theScene

	updateLeftPanel()
	updateRightPanel()
	updateVariableList()
	$LoadCodeDialog.hide()


func _on_StartConditionsList_onAddButton(what):
	var newAction = createAction(what)
	#var actionIndex = currentState["turnActions"].size()
	sexActivityProperties["startConditions"].append(newAction)
	
	# Start editing the new action here
	var theArgs = newAction.getArgs()
	if(theArgs != null && theArgs != {}):
		startEditingAction(newAction)
	
	updateRightPanel()

func _on_StartConditionsList_onEditPressed(id):
	startEditingAction(sexActivityProperties["startConditions"][id])

func _on_CloseButton_pressed():
	emit_signal("onClosePressed")


func _on_RemoveStateButton_pressed():
	if(!$VBoxContainer/HBoxContainer/StatesActionsList/StatesList.is_anything_selected()):
		return
	
	var stateIDToRemove = states.keys()[$VBoxContainer/HBoxContainer/StatesActionsList/StatesList.get_selected_items()[0]]
	states.erase(stateIDToRemove)
	if(selectedState == stateIDToRemove):
		selectedState = ""
	removeUselessActions()
	updateLeftPanel()
	updateRightPanel()

func removeUselessActions():
	for actionID in domActions:
		var foundState = false
		#var action = theActions[actionID]
		
		for stateID in states:
			var state = states[stateID]
			
			if(actionID in state["domActions"]):
				foundState = true
				break
	
		if(!foundState):
			print("REMOVED ACTION "+actionID+" BECAUSE ITS NOT USED ANYWHERE")
			domActions.erase(actionID)
		
	for actionID in subActions:
		var foundState = false
		#var action = theActions[actionID]
		
		for stateID in states:
			var state = states[stateID]
			
			if(actionID in state["subActions"]):
				foundState = true
				break
	
		if(!foundState):
			print("REMOVED ACTION "+actionID+" BECAUSE ITS NOT USED ANYWHERE")
			subActions.erase(actionID)


func _on_removeDomButton_pressed():
	var currentState = getCurrentState()
	if(!$VBoxContainer/HBoxContainer/StatesActionsList/DomActionsList.is_anything_selected() || currentState == null):
		return
	
	var index = $VBoxContainer/HBoxContainer/StatesActionsList/DomActionsList.get_selected_items()[0]
	currentState["domActions"].remove(index)
	removeUselessActions()
	updateLeftPanel()
	updateRightPanel()


func _on_RemoveSubButton_pressed():
	var currentState = getCurrentState()
	if(!$VBoxContainer/HBoxContainer/StatesActionsList/SubActionsList.is_anything_selected() || currentState == null):
		return
	
	var index = $VBoxContainer/HBoxContainer/StatesActionsList/SubActionsList.get_selected_items()[0]
	currentState["subActions"].remove(index)
	removeUselessActions()
	updateLeftPanel()
	updateRightPanel()

func hasDomSubAction(actions):
	for action in actions:
		if(action.shouldAddDomSubReactions()):
			return true
	return false


func _on_AddAnimWithConditionButton_pressed():
	var currentState = getCurrentState()
	if(currentState == null):
		return
	
	currentState["animsWithCondition"].append({
		"condition": "false",
		"animData": {
			selectedStage = StageScene.SexAllFours,
			selecedAnim = "tease",
			selectedPC = "domID",
			selectedNPC = "subID",
		}
	})
	updateRightPanel()

func onDeletingAnimWithCondition(index):
	var currentState = getCurrentState()
	if(currentState == null):
		return
	
	currentState["animsWithCondition"].remove(index)
	updateRightPanel()
	
func onUpAnimWithCondition(index):
	var currentState = getCurrentState()
	if(currentState == null):
		return
	
	Util.moveValueUp(currentState["animsWithCondition"], index)
	updateRightPanel()
