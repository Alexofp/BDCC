extends Control

onready var pack_variables = $VBoxContainer/Control/TabContainer/Info/ScrollContainer/VBoxContainer/PackVariables
onready var new_flag_line_edit = $VBoxContainer/Control/TabContainer/Flags/HBoxContainer3/NewFlagLineEdit
onready var flag_list = $VBoxContainer/Control/TabContainer/Flags/ScrollContainer2/FlagList
onready var datapack_quest_code_wrapper = $VBoxContainer/Control/TabContainer/Stages/HBoxContainer/VBoxContainer/DatapackQuestCodeWrapper
onready var possible_code_blocks_list = $VBoxContainer/Control/TabContainer/Stages/HBoxContainer/VBoxContainer2/ScrollContainer/PossibleCodeBlocksList

var varListEntryScene = preload("res://Game/Datapacks/UI/CrotchCode/UI/VarListEntry.tscn")

var datapack:Datapack
var quest:DatapackQuest

func _ready():
	possible_code_blocks_list.setEditor(self)
	datapack_quest_code_wrapper.setEditor(self)

func setQuest(theQuest):
	quest = theQuest
	
	datapack_quest_code_wrapper.setSlotCalls(quest.code)
	
	updateQuest()
	updateFlagList()
	
	possible_code_blocks_list.populate()

func updateQuest():
	pack_variables.setVariables(quest.getEditVars())
	
func getMenu():
	var toCheck = self
	while(toCheck != null):
		toCheck = toCheck.get_parent()
		if(toCheck.has_method("isDatapackMenu")):
			return toCheck
	return null

func showAlert(theText:String):
	var theMenu = getMenu()
	if(theMenu == null):
		printerr("Was unable to show an alert, no menu var is set. Alert text is: "+str(theText))
	else:
		theMenu.showAlert(theText)

func _on_SaveButton_pressed():
	pack_variables.checkWidgetsFinished()
	getMenu().popMenu()


func _on_PackVariables_onVariableChange(id, value):
	if(quest.applyEditVar(id, value)):
		pass

func onMenuPopped():
	updateQuest()

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


func getPossiblePrintStrings():
	return ["Meow", "MEEEEOW", "MEOW", "RAHI???!"]

func getAllFlagNames():
	return datapack.flags.keys()

func onUserChangeMade():
	datapack_quest_code_wrapper.makeSnapshot()
