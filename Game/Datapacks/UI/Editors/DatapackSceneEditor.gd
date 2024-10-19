extends Control

onready var pack_variables = $VBoxContainer/MarginContainer/TabContainer/Info/ScrollContainer/PackVariables
onready var states_list = $VBoxContainer/MarginContainer/TabContainer/States/HBoxContainer/StatesList/StatesList
onready var new_state_line_edit = $VBoxContainer/MarginContainer/TabContainer/States/HBoxContainer/StatesList/HBoxContainer/NewStateLineEdit
onready var possible_code_blocks_list = $VBoxContainer/MarginContainer/TabContainer/States/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer2/ScrollContainer/PossibleCodeBlocksList
onready var datapack_scene_code_wrapper = $VBoxContainer/MarginContainer/TabContainer/States/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/DatapackSceneCodeWrapper
onready var output_label = $VBoxContainer/MarginContainer/TabContainer/States/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer2/OutputTextLabel
onready var pick_save_button = $VBoxContainer/MarginContainer/HBoxContainer/PickSaveButton
onready var state_label = $VBoxContainer/MarginContainer/TabContainer/States/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/StateLabel
onready var states = $VBoxContainer/MarginContainer/TabContainer/States

onready var new_var_line_edit = $VBoxContainer/MarginContainer/TabContainer/Variables/HBoxContainer/NewVarLineEdit
onready var var_list = $VBoxContainer/MarginContainer/TabContainer/Variables/ScrollContainer/VarList
onready var new_flag_line_edit = $VBoxContainer/MarginContainer/TabContainer/Variables/HBoxContainer3/NewFlagLineEdit
onready var flag_list = $VBoxContainer/MarginContainer/TabContainer/Variables/ScrollContainer2/FlagList

onready var possible_char_list = $VBoxContainer/MarginContainer/TabContainer/Characters/HBoxContainer/VBoxContainer/PossibleCharList
onready var char_list = $VBoxContainer/MarginContainer/TabContainer/Characters/ScrollContainer/CharList
onready var filter_possible_char_list_edit = $VBoxContainer/MarginContainer/TabContainer/Characters/HBoxContainer/VBoxContainer/FilterPossibleCharListEdit

onready var scene_images_list = $VBoxContainer/MarginContainer/TabContainer/Images/ScrollContainer/PanelContainer/SceneImagesList
onready var scene_image_id_edit = $VBoxContainer/MarginContainer/TabContainer/Images/HBoxContainer/SceneImageIDEdit


var varListEntryScene = preload("res://Game/Datapacks/UI/CrotchCode/UI/VarListEntry.tscn")
var charListEntryScene = preload("res://Game/Datapacks/UI/CrotchCode/UI/CharListEntry.tscn")

var gameWrapperScene = preload("res://Game/Datapacks/UI/CrotchCode/GameRunnerWrapper.tscn")
var savePickerScene = preload("res://Game/Datapacks/UI/CrotchCode/DatapackSavePicker.tscn")

var imageListEntryScene = preload("res://Game/Datapacks/UI/CrotchCode/UI/ImageListEntry.tscn")

var datapack:Datapack
var scene:DatapackScene

var codeContex = CodeContex.new()
var triggerCodeContex = CodeContex.new()

var selectedStateID:String = ""
var statesListArray = []

var selectedSavePath = null

var allPossibleChars = []
var possibleChars = []

func _ready():
	codeContex.connect("onPrint", self, "doOutput")
	codeContex.connect("onError", self, "doOutputError")
	triggerCodeContex.connect("onPrint", self, "doTriggerOutput")
	triggerCodeContex.connect("onError", self, "doTriggerOutputError")
	datapack_scene_code_wrapper.setEditor(self)
	datapack_trigger_code_wrapper.setEditor(self)
	
	possible_code_blocks_list.setEditor(self)
	possible_trigger_code_blocks_list.setEditor(self)
	
	for otherdatapackID in GlobalRegistry.getDatapacks():
		var otherdatapack:Datapack = GlobalRegistry.getDatapack(otherdatapackID)
		for charID in otherdatapack.characters:
			var finalCharID = otherdatapack.getFinalCharacterID(charID)
			allPossibleChars.append(finalCharID)
	for charID in GlobalRegistry.getCharacterClasses():
		allPossibleChars.append(charID)
	updatePossibleCharList()
	
func updatePossibleCharList():
	possible_char_list.clear()
	possibleChars = []
	var filterText = filter_possible_char_list_edit.text.to_lower()
	var hasFilter = (filterText != "")
	for charID in allPossibleChars:
		if(hasFilter && !(filterText in charID.to_lower())):
			continue
		
		possibleChars.append(charID)
		possible_char_list.add_item(charID)
	
var outputLines = []
func doOutput(theText):
	while(outputLines.size() > 500):
		outputLines.pop_front()
	
	outputLines.append(theText)
	
	output_label.bbcode_text = Util.join(outputLines, "\n")
	output_label.scroll_to_line(output_label.get_line_count()-1)

func clearOutput():
	outputLines = []
	output_label.bbcode_text = ""

func doOutputError(_codeBlock, errorText):
	if(_codeBlock != null):
		doOutput("[color=red]Line "+str(_codeBlock.lineNum)+": "+errorText+"[/color]")
	else:
		doOutput("[color=red]"+errorText+"[/color]")
	
var triggerOutputLines = []
func doTriggerOutput(theText):
	while(triggerOutputLines.size() > 500):
		triggerOutputLines.pop_front()
	
	triggerOutputLines.append(theText)
	
	trigger_output_label.bbcode_text = Util.join(triggerOutputLines, "\n")
	trigger_output_label.scroll_to_line(trigger_output_label.get_line_count()-1)

func clearTriggerOutput():
	triggerOutputLines = []
	trigger_output_label.bbcode_text = ""

func doTriggerOutputError(_codeBlock, errorText):
	if(_codeBlock != null):
		doTriggerOutput("[color=red]Line "+str(_codeBlock.lineNum)+": "+errorText+"[/color]")
	else:
		doTriggerOutput("[color=red]"+errorText+"[/color]")
	
func onUserChangeMade():
	if(datapack_scene_code_wrapper.is_visible_in_tree()):
		datapack_scene_code_wrapper.makeSnapshot()
	if(datapack_trigger_code_wrapper.is_visible_in_tree()):
		datapack_trigger_code_wrapper.makeSnapshot()

func setScene(theScene):
	scene = theScene
	updateSceneInfo()
	updateStatesList()
	updateSelectedState()
	updateVarList()
	updateFlagList()
	updateCharList()
	updateTriggerList()
	updateSelectedTrigger()
	updateImagesSceneList()
	
	possible_code_blocks_list.populate()
	possible_trigger_code_blocks_list.populate()

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
	#updateSceneInfo()
	#updateSelectedState()
	pass


func _on_TestButton_pressed():
	#print(datapack_scene_code_wrapper.getSlotCalls().getBlocks())
	clearOutput()
	codeContex.clearVars()
	codeContex.varsDefinition = scene.vars
	codeContex.flagsDefinition = datapack.flags
	codeContex.execute(datapack_scene_code_wrapper.getSlotCalls())
	
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
	
	if(scene.states.has(newStateID)):
		showAlert("State with this ID already exist")
		return
	
	var newState = DatapackSceneState.new()
	newState.id = newStateID
	scene.states[newStateID] = newState
	updateStatesList()
	updateSelectedState()

func _on_StatesList_item_selected(index):
	if(index < 0 || index >= statesListArray.size()):
		return
	
	selectedStateID = statesListArray[index]
	updateSelectedState()
	datapack_scene_code_wrapper.resetScroll()

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
	selectedStateID = scene.states.keys()[index]
	
	updateStatesList()
	updateSelectedState()

func updateSelectedState():
	state_label.text = "Code for the '"+(selectedStateID if selectedStateID != "" else "Initial")+"' state"
	
	var theState = scene.states[selectedStateID]
	
	datapack_scene_code_wrapper.setSlotCalls(theState.code)

func _on_RunButton_pressed():
	var newGame = gameWrapperScene.instance()
	newGame.connect("onStopButtonPressed", self, "onGameWrapperStop")
	getMenu().pushMenu(newGame)
	newGame.run(datapack.id, scene.id, selectedSavePath)

func onGameWrapperStop():
	getMenu().popMenu()

func _on_PickSaveButton_pressed():
	var newPicker = savePickerScene.instance()
	newPicker.connect("onClosePressed", self, "onPickerClosePressed")
	newPicker.connect("onSavePicked", self, "onPickerSavePicked")
	getMenu().pushMenu(newPicker)

func onPickerClosePressed():
	getMenu().popMenu()

func onPickerSavePicked(_savePath):
	selectedSavePath = _savePath
	getMenu().popMenu()
	
	pick_save_button.text = "(Picked)"

func updateVarList():
	Util.delete_children(var_list)
	
	for varName in scene.vars:
		var varData = scene.vars[varName]
		
		var newVarEntry = varListEntryScene.instance()
		var_list.add_child(newVarEntry)
		
		newVarEntry.setEntry(varName, varData)
		newVarEntry.connect("onDeletePressed", self, "onDeleteVarPressed")
		newVarEntry.connect("onVarEdit", self, "onVarEdit")
		newVarEntry.connect("onVarRename", self, "onVarRename")

func onVarRename(oldName, newName):
	var varInfo = scene.vars[oldName]
	var _ok = scene.vars.erase(oldName)
	scene.vars[newName] = varInfo

func updateFlagList():
	Util.delete_children(flag_list)
	
	for varName in datapack.flags:
		var varData = datapack.flags[varName]
		
		var newVarEntry = varListEntryScene.instance()
		flag_list.add_child(newVarEntry)
		
		newVarEntry.setEntry(varName, varData)
		newVarEntry.connect("onDeletePressed", self, "onDeleteFlagPressed")
		newVarEntry.connect("onVarEdit", self, "onFlagEdit")
		newVarEntry.connect("onVarRename", self, "onFlagRename")

func onFlagRename(oldName, newName):
	var varInfo = datapack.flags[oldName]
	var _ok = datapack.flags.erase(oldName)
	datapack.flags[newName] = varInfo

func onDeleteFlagPressed(varName):
	if(!datapack.flags.has(varName)):
		return
	var _ok = datapack.flags.erase(varName)
	
	updateFlagList()

func onFlagEdit(varName, newVar):
	datapack.flags[varName] = newVar

func onDeleteVarPressed(varName):
	if(!scene.vars.has(varName)):
		return
	var _ok = scene.vars.erase(varName)
	
	updateVarList()

func onVarEdit(varName, newVar):
	scene.vars[varName] = newVar


func _on_States_visibility_changed():
	if(states.visible):
		updateStatesList()
		updateSelectedState()

func _on_AddVarButton_pressed():
	var newVarName = new_var_line_edit.text
	newVarName = Util.stripAllBadCharactersFromVarName(newVarName)
	if(newVarName == ""):
		showAlert("Variable name can not be empty")
		return
	if(scene.vars.has(newVarName)):
		showAlert("Variable with this name already exists")
		return
	
	scene.vars[newVarName] = {
		type = DatapackSceneVarType.BOOL,
		default = false,
	}
	updateVarList()

func getAllVarNames():
	return scene.vars.keys()
func getAllFlagNames():
	return datapack.flags.keys()
func getAllInvolvedCharIDs():
	return ["pc"]+scene.chars.keys()
func getAllStateIDs():
	return scene.states.keys()
func getAllSceneIDs():
	var result = []
	for sceneID in datapack.scenes.keys():
		result.append(datapack.id+":"+sceneID)
	return result
func getAllImageIDs():
	return scene.images.keys()
func getAllDatapackIDs():
	return GlobalRegistry.getDatapacks().keys()

func _on_AddFlagButton_pressed():
	var newVarName = new_flag_line_edit.text
	newVarName = Util.stripAllBadCharactersFromVarName(newVarName)
	if(newVarName == ""):
		showAlert("Flag name can not be empty")
		return
	if(datapack.flags.has(newVarName)):
		showAlert("Flag with this name already exists")
		return
	
	datapack.flags[newVarName] = {
		type = DatapackSceneVarType.BOOL,
		default = false,
	}
	updateFlagList()


func _on_AddCharButton_pressed():
	if(possible_char_list.get_selected_items().size() <= 0):
		return
	var charIndex = possible_char_list.get_selected_items()[0]
	if(charIndex < 0 || charIndex >= possibleChars.size()):
		return
	
	var charID:String = possibleChars[charIndex]
	var alias:String = charID
	
	if(":" in charID):
		alias = Util.splitOnFirst(alias, ":")[1]
	
	var newChar = {
		realid = charID,
		start = true,
		variant = "",
	}
	scene.chars[alias] = newChar
	updateCharList()

func updateCharList():
	Util.delete_children(char_list)
	
	for alias in scene.chars:
		var charEntry = scene.chars[alias]
		
		var newCharEntry = charListEntryScene.instance()
		char_list.add_child(newCharEntry)
		
		newCharEntry.setEntry(alias, charEntry)
		newCharEntry.connect("onDeletePressed", self, "onDeleteCharPressed")
		newCharEntry.connect("onCharEdit", self, "onCharEdit")
		newCharEntry.connect("onAliasChange", self, "onCharAliasChange")

func onDeleteCharPressed(alias):
	if(!scene.chars.has(alias)):
		return
	var _ok = scene.chars.erase(alias)
	
	updateCharList()

func onCharEdit(alias, entry):
	scene.chars[alias] = entry

func onCharAliasChange(oldAlias, newAlias):
	var theEntry = scene.chars[oldAlias]
	var _ok = scene.chars.erase(oldAlias)
	scene.chars[newAlias] = theEntry
	updateCharList()

func _on_FilterPossibleCharListEdit_text_changed(_new_text):
	updatePossibleCharList()

func _on_SaveAllButton_pressed():
	if(!datapack.saveToDisk()):
		showAlert("Save failed. Sorry")
	else:
		doOutput("Saved")


onready var trigger_settings_full_list = $VBoxContainer/MarginContainer/TabContainer/Triggers/HBoxContainer/HSplitContainer/ScrollContainer/TriggerSettingsFullList


onready var trigger_item_list = $VBoxContainer/MarginContainer/TabContainer/Triggers/HBoxContainer/VBoxContainer/TriggerItemList
var selectedTrigger:DatapackSceneTrigger

func updateTriggerList():
	trigger_item_list.clear()
	
	var _i = 0
	for trigger in scene.triggers:
		var triggerName = trigger.getName()
		trigger_item_list.add_item(triggerName)
		if(selectedTrigger == trigger):
			trigger_item_list.select(_i)
		_i += 1

func _on_AddTriggerButton_pressed():
	var newTrigger = DatapackSceneTrigger.new()
	scene.triggers.append(newTrigger)
	updateTriggerList()

func _on_RemoveTriggerButton_pressed():
	if(trigger_item_list.get_selected_items().size() <= 0):
		return
	var selectedTriggerIndex = trigger_item_list.get_selected_items()[0]
	if(selectedTriggerIndex < 0 || selectedTriggerIndex >= scene.triggers.size()):
		return
	
	selectedTrigger = null
	scene.triggers.remove(selectedTriggerIndex)
	updateTriggerList()
	updateSelectedTrigger()

func _on_TriggerItemList_item_selected(index):
	if(index < 0 || index >= scene.triggers.size()):
		return
	selectedTrigger = scene.triggers[index]
	updateSelectedTrigger()

onready var trigger_type_selector = $VBoxContainer/MarginContainer/TabContainer/Triggers/HBoxContainer/HSplitContainer/ScrollContainer/TriggerSettingsFullList/HBoxContainer2/TriggerTypeSelector
onready var trigger_type_desc_label = $VBoxContainer/MarginContainer/TabContainer/Triggers/HBoxContainer/HSplitContainer/ScrollContainer/TriggerSettingsFullList/HBoxContainer2/TriggerTypeDescLabel
onready var trigger_settings = $VBoxContainer/MarginContainer/TabContainer/Triggers/HBoxContainer/HSplitContainer/ScrollContainer/TriggerSettingsFullList/PackVarsCollapsableRegion/VBoxContainer/VBoxContainer/TriggerSettings
onready var trigger_execute_type = $VBoxContainer/MarginContainer/TabContainer/Triggers/HBoxContainer/HSplitContainer/ScrollContainer/TriggerSettingsFullList/HBoxContainer/TriggerExecuteType
onready var trigger_execute_type_label = $VBoxContainer/MarginContainer/TabContainer/Triggers/HBoxContainer/HSplitContainer/ScrollContainer/TriggerSettingsFullList/HBoxContainer/TriggerExecuteTypeLabel
onready var trigger_priority = $VBoxContainer/MarginContainer/TabContainer/Triggers/HBoxContainer/HSplitContainer/ScrollContainer/TriggerSettingsFullList/TriggerPriority
onready var datapack_trigger_code_wrapper = $VBoxContainer/MarginContainer/TabContainer/Triggers/HBoxContainer/HSplitContainer/ScrollContainer/TriggerSettingsFullList/DatapackTriggerCodeWrapper
onready var trigger_output_label = $VBoxContainer/MarginContainer/TabContainer/Triggers/HBoxContainer/HSplitContainer/ScrollContainer/TriggerSettingsFullList/TriggerOutputLabel
onready var possible_trigger_code_blocks_list = $VBoxContainer/MarginContainer/TabContainer/Triggers/HBoxContainer/HSplitContainer/VBoxContainer2/ScrollContainer/PossibleTriggerCodeBlocksList
onready var pack_vars_collapsable_region = $VBoxContainer/MarginContainer/TabContainer/Triggers/HBoxContainer/HSplitContainer/ScrollContainer/TriggerSettingsFullList/PackVarsCollapsableRegion


func updateSelectedTrigger():
	if(selectedTrigger == null):
		trigger_settings_full_list.visible = false
		return
	trigger_settings_full_list.visible = true
	
	trigger_type_selector.setData({
		name = "Type",
		value = selectedTrigger.triggerType,
		values = DatapackSceneTriggerType.getAllWithNames(),
	})
	
	updateSelectedTriggerType()
	
	trigger_execute_type.setData({
		name = "Execute type",
		value = selectedTrigger.executeType,
		instantSet = true,
		values = [
			[DatapackSceneTrigger.TRIGGER_REACT, "React"],
			[DatapackSceneTrigger.TRIGGER_RUN, "Run"],
		]
	})
	updateSelectedExecuteType()
	
	trigger_priority.setData({
		name = "Trigger priority",
		value = selectedTrigger.priority,
	})
	
	datapack_trigger_code_wrapper.setSlotCalls(selectedTrigger.code)

func updateSelectedTriggerType():
	var theTriggerVars = DatapackSceneTriggerType.getEditVars(selectedTrigger.triggerType)
	for varID in selectedTrigger.triggerSettings:
		if(theTriggerVars.has(varID)):
			theTriggerVars[varID]["value"] = selectedTrigger.triggerSettings[varID]
		
	for varID in theTriggerVars:
		var varEntry = theTriggerVars[varID]
		if(varEntry.has("involvedDatapackNPCs") && varEntry["involvedDatapackNPCs"]):
			var datapackNpcs = []
			for npcID in scene.chars:
				var realID = scene.chars[npcID]["realid"]
				if(":" in realID):
					datapackNpcs.append(realID)
			
			varEntry["values"] = datapackNpcs
			if(varEntry["value"] == "" && datapackNpcs.size() > 0):
				varEntry["value"] = datapackNpcs[0]
				selectedTrigger.triggerSettings[varID] = datapackNpcs[0]
	
	trigger_type_desc_label.text = "("+DatapackSceneTriggerType.getDescription(selectedTrigger.triggerType)+")"
	
	trigger_settings.setVariables(theTriggerVars)
	if(theTriggerVars.empty()):
		pack_vars_collapsable_region.visible = false
	else:
		pack_vars_collapsable_region.visible = true

func updateSelectedExecuteType():
	if(selectedTrigger.executeType == DatapackSceneTrigger.TRIGGER_REACT):
		trigger_execute_type_label.text = " (Scene will run instantly if all conditions are satisfied)"
	else:
		trigger_execute_type_label.text = " (Scene execution is delayed, must add a button with a Run Event block inside)"

func _on_TriggerTypeSelector_onValueChange(_id, newValue):
	selectedTrigger.triggerType = newValue
	selectedTrigger.triggerSettings = {}
	#updateSelectedTrigger()
	updateTriggerList()
	updateSelectedTriggerType()

func _on_TriggerSettings_onVariableChange(id, value):
	selectedTrigger.triggerSettings[id] = value

func _on_TriggerExecuteType_onValueChange(_id, newValue):
	selectedTrigger.executeType = newValue
	updateSelectedExecuteType()

func _on_TriggerButtonName_onValueChange(_id, newValue):
	selectedTrigger.buttonName = newValue

func _on_TriggerButtonDesc_onValueChange(_id, newValue):
	selectedTrigger.buttonDesc = newValue

func _on_TriggerPriority_onValueChange(_id, newValue):
	selectedTrigger.priority = newValue

func _on_TriggerTestButton_pressed():
	clearTriggerOutput()
	triggerCodeContex.clearVars()
	#triggerCodeContex.varsDefinition = scene.vars
	triggerCodeContex.flagsDefinition = datapack.flags
	triggerCodeContex.execute(datapack_trigger_code_wrapper.getSlotCalls())

func updateImagesSceneList():
	Util.delete_children(scene_images_list)
	
	for imageID in scene.images:
		var imageEntry:DatapackSceneImage = scene.images[imageID]
		
		var newEntry = imageListEntryScene.instance()
		
		scene_images_list.add_child(newEntry)
		newEntry.setEntry(imageEntry)
		newEntry.connect("onIDChanged", self, "onImageEntryIDChanged")
		newEntry.connect("onDeletePressed", self, "onImageEntryDeletePressed")
		
func onImageEntryIDChanged(oldID, newID):
	var theEntry = scene.images[oldID]
	var _ok = scene.images.erase(oldID)
	scene.images[newID] = theEntry
	
	updateImagesSceneList()

func onImageEntryDeletePressed(theID):
	if(!scene.images.has(theID)):
		return
	var _ok = scene.images.erase(theID)
	updateImagesSceneList()

func _on_AddImageButton_pressed():
	var newID = scene_image_id_edit.text
	newID = Util.stripAllBadCharactersFromVarName(newID)
	if(newID == ""):
		showAlert("Image id can not be empty")
		return
	if(scene.images.has(newID)):
		showAlert("Image with this ID already exist")
		return
	
	var newEntry = DatapackSceneImage.new()
	newEntry.id = newID
	scene.images[newID] = newEntry
	updateImagesSceneList()


func _on_MoveStateDownButton_pressed():
	if(states_list.get_selected_items().size() <= 0):
		return
	Util.moveKeyDown(scene.states, selectedStateID)

	updateStatesList()
	#updateSelectedState()


func _on_MoveStateUpButton_pressed():
	if(states_list.get_selected_items().size() <= 0):
		return
	Util.moveKeyUp(scene.states, selectedStateID)

	updateStatesList()
	#updateSelectedState()

onready var new_name_window = $VBoxContainer/MarginContainer/TabContainer/States/HBoxContainer/StatesList/HBoxContainer2/RenameStateButton/NewNameWindow
onready var new_name_state_edit = $VBoxContainer/MarginContainer/TabContainer/States/HBoxContainer/StatesList/HBoxContainer2/RenameStateButton/NewNameWindow/VBoxContainer/NewNameStateEdit

func _on_RenameStateButton_pressed():
	if(selectedStateID == ""):
		showAlert("Unable to rename the initial state")
		return
	
	new_name_window.popup_centered()
	new_name_state_edit.text = selectedStateID

func _on_NewNameWindow_confirmed():
	var newName:String = Util.stripAllBadCharactersFromVarName(new_name_state_edit.text)
	
	if(newName == selectedStateID):
		return
	
	if(scene.states.has(newName)):
		showAlert("State with this name already exists. Unable to rename")
		return
	
	if(!scene.states.has(selectedStateID)):
		return
	var theState:DatapackSceneState = scene.states[selectedStateID]
	var _ok = scene.states.erase(selectedStateID)
	theState.id = newName
	scene.states[newName] = theState
	selectedStateID = newName
	updateStatesList()
	updateSelectedState()

func _on_Duplicate_pressed():
	if(states_list.get_selected_items().size() <= 0):
		return
	if(!scene.states.has(selectedStateID)):
		return
	
	var curI = 2
	var newName = selectedStateID+"_2"
	
	while(scene.states.has(newName)):
		curI += 1
		newName = selectedStateID+"_"+str(curI)
	
	var theState:DatapackSceneState = scene.states[selectedStateID]
	var newState:DatapackSceneState = DatapackSceneState.new()
	newState.loadData(theState.saveData().duplicate(true))
	newState.id = newName
	scene.states[newName] = newState
	updateStatesList()


func _on_TutorialButton_pressed():
	var _ok = OS.shell_open("https://github.com/Alexofp/BDCC/wiki/Datapack-scene-creator-tutorial")
