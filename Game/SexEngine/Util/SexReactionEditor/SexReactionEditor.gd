extends Control

const F_REACTIONS = "reactions"
var data:Dictionary = {
	
	reactions = {},
}
const SavePath = "res://Game/SexEngine/Util/SexReactionEditor/DefaultReactions.txt"
onready var new_reaction_list:OptionButton = $"%NewReactionList"
onready var reaction_list = $"%ReactionList"
onready var main_tab = $"%MainTab"
onready var reaction_tab = $"%ReactionTab"
onready var output_tab = $"%OutputTab"

onready var role_selector = $"%RoleSelector"

onready var chance_spinbox = $"%ChanceSpinbox"
onready var say_together_checkbox = $"%SayTogetherCheckbox"
onready var chances_line_edit = $"%ChancesLineEdit"

onready var reaction_entries_list = $"%ReactionEntriesList"
onready var condition_text_edit = $"%ConditionTextEdit"
onready var lines_text_edit = $"%LinesTextEdit"

onready var output_text_edit = $"%OutputTextEdit"

onready var prompt_text_edit = $"%PromptTextEdit"


func saveToFile():
	var file := File.new()
	file.open(SavePath, File.WRITE)
	file.store_string(var2str(data))
	file.close()

func loadFromFile():
	var file := File.new()
	if(file.open(SavePath, File.READ) != OK):
		Log.printerr("Something bad happened")
		return
	var content:String = file.get_as_text()
	data = str2var(content)
	file.close()
	
	# Call update funcs here
	sortReactionList()
	updateReactionList()
	
func _on_SaveButton_pressed():
	saveToFile()

func _on_LoadButton_pressed():
	loadFromFile()

func _ready():
	new_reaction_list.clear()
	for reactionID in SexReaction.getAllStrings():
		new_reaction_list.add_item(reactionID)
	new_reaction_list.select(0)
	
	hideAllTabs()
	main_tab.visible = true
	
	role_selector.add_item("Main role")
	role_selector.add_item("Target role")
	role_selector.add_item("Extra role")
	role_selector.add_item("Extra 2 role")

func _on_AddReactionButton_pressed():
	var theIndx:int = new_reaction_list.selected
	if(theIndx < 0 || theIndx >= SexReaction.getAllStrings().size()):
		return
	var theKey:String = SexReaction.getAllStrings()[theIndx]
	if(data[F_REACTIONS].has(theKey)):
		return
	data[F_REACTIONS][theKey] = {
		chance = 100,
		together = false,
		chances = "",
		
		lines = {},
	}
	sortReactionList()
	updateReactionList()

func sortReactionList():
	var currentReactions:Dictionary = data[F_REACTIONS]
	
	var newReactions:Dictionary = {}
	for reactionID in SexReaction.getAllStrings():
		if(!currentReactions.has(reactionID)):
			continue
		newReactions[reactionID] = currentReactions[reactionID]
		currentReactions.erase(reactionID)
	
	for reactionID in currentReactions:
		newReactions[reactionID] = currentReactions[reactionID]
	
	data[F_REACTIONS] = newReactions
	

func updateReactionList():
	reaction_list.clear()
	for reactionID in data[F_REACTIONS]:
		reaction_list.add_item(reactionID)


func _on_RemoveButton_pressed():
	if(reaction_list.get_selected_items().size() <= 0):
		return
	var theSelectedIndx:int = reaction_list.get_selected_items()[0]
	data[F_REACTIONS].erase(data[F_REACTIONS].keys()[theSelectedIndx])
	
	updateReactionList()


var editReactionID:String = ""
var editReaction:Dictionary

func _on_EditButton_pressed():
	if(reaction_list.get_selected_items().size() <= 0):
		return
	var theSelectedIndx:int = reaction_list.get_selected_items()[0]
	var theKey:String = data[F_REACTIONS].keys()[theSelectedIndx]
	editReactionID = theKey
	editReaction = data[F_REACTIONS][editReactionID]
	
	hideAllTabs()
	reaction_tab.visible = true
	updateReactionTab()
	updateReactionEntryList()

func getReactionVal(_key:String, _default):
	if(!editReaction.has(_key)):
		return _default
	return editReaction[_key]

func updateReactionTab():
	chance_spinbox.value = getReactionVal("chance", 100.0)
	say_together_checkbox.set_pressed_no_signal(getReactionVal("together", false))
	chances_line_edit.text = getReactionVal("chances", "")
	
func hideAllTabs():
	main_tab.visible = false
	reaction_tab.visible = false
	output_tab.visible = false


func _on_OkButton_pressed():
	hideAllTabs()
	main_tab.visible = true
	editReactionID = ""

func _on_ChanceSpinbox_value_changed(_value:float):
	editReaction["chance"] = _value

func _on_SayTogetherCheckbox_toggled(button_pressed:bool):
	editReaction["together"] = button_pressed

func _on_ChancesLineEdit_text_changed(new_text:String):
	editReaction["chances"] = new_text


func updateReactionEntryList():
	reaction_entries_list.clear()
	
	var selectedRole:int = role_selector.selected
	var entries:Array = []
	if(editReaction["lines"].has(selectedRole)):
		entries = editReaction["lines"][selectedRole]
		
	var _i:int = 0
	for entry in entries:
		reaction_entries_list.add_item(str(_i))
		_i += 1

func _on_RoleSelector_item_selected(_index:int):
	updateReactionEntryList()


func _on_AddReactionEntryButton_pressed():
	var selectedRole:int = role_selector.selected
	if(!editReaction["lines"].has(selectedRole)):
		editReaction["lines"][selectedRole] = []
	editReaction["lines"][selectedRole].append({
		condition = "",
		lines = "",
	})
	updateReactionEntryList()

func _on_RemoveEntryButton_pressed():
	if(reaction_entries_list.get_selected_items().size() <= 0):
		return
	var selectedLineEntryIndx:int = reaction_entries_list.get_selected_items()[0]
	var selectedRole:int = role_selector.selected
	
	editReaction["lines"][selectedRole].remove(selectedLineEntryIndx)
	updateReactionEntryList()
	editLinesEntry = {}
	updateLinesEntry()

var editLinesEntry:Dictionary
func _on_ReactionEntriesList_item_selected(_index:int):
	var selectedRole:int = role_selector.selected
	
	if(_index < 0 || _index >= editReaction["lines"][selectedRole].size()):
		return
	editLinesEntry = editReaction["lines"][selectedRole][_index]
	updateLinesEntry()

func updateLinesEntry():
	condition_text_edit.text = editLinesEntry["condition"] if editLinesEntry.has("condition") else ""
	lines_text_edit.text = editLinesEntry["lines"] if editLinesEntry.has("lines") else ""

func _on_ConditionTextEdit_text_changed():
	if(!editLinesEntry.has("condition")):
		return
	editLinesEntry["condition"] = condition_text_edit.text

func _on_LinesTextEdit_text_changed():
	if(!editLinesEntry.has("lines")):
		return
	editLinesEntry["lines"] = lines_text_edit.text


func _on_CloseOutputButton_pressed():
	hideAllTabs()
	main_tab.visible = true

func _on_GenerateCodeButton_pressed():
	hideAllTabs()
	output_tab.visible = true
	
	var text:String = "extends SexReactionHandler\n\n"
	text += "func _init():\n"
	text += "\thandles = {\n"
	for reactionID in data[F_REACTIONS]:
		var reactionEntry:Dictionary = data[F_REACTIONS][reactionID]
		text += "\t\t"
		text += "SexReaction."
		text += reactionID
		text += ": {"
		
		text += "REACT_CHANCE: "+str(Util.roundF(reactionEntry["chance"], 2))
		if(reactionEntry["together"]):
			text += ", REACT_TOGETHER: true"
		if(reactionEntry["chances"] != ""):
			text += ", REACT_CHANCES: ["+reactionEntry["chances"]+"]"
		
		text += "},"
		text += "\n"
		
	text += "\t}\n"
	
	text += "\n"
	text += "func getLines(_reaction:int, _role:int, _args:Array):\n"
	text += "\tmatch(_reaction):\n"
	for reactionID in SexReaction.getAllStrings():
		if(!data[F_REACTIONS].has(reactionID)):
			continue
		var reactionEntry:Dictionary = data[F_REACTIONS][reactionID]
		text += "\t\t"
		text += "SexReaction."
		text += reactionID
		text += ":\n"
		
		
		for _i in range(4):
			if(!reactionEntry["lines"].has(_i) || reactionEntry["lines"][_i].empty()):
				continue
			var theTabs:String = "\t\t\t\t"
			var roleName:String = ROLES_NAMES[_i]
			text += "\t\t\t"
			text += "if(_role == "+roleName+"):\n"
			
			var conditionTree:Dictionary = calcConditionTree(reactionEntry["lines"][_i])
			var finalLines:Array = conditionTreeToArrayOfLines(conditionTree)
			for line in finalLines:
				text += theTabs + line + "\n"
			
#			for theLinesEntry in reactionEntry["lines"][_i]:
#				var theCondition:String = theLinesEntry["condition"]
#				var conditionSplit:Array = theCondition.split("\n", false)
#				var theLines:String = theLinesEntry["lines"]
#				var linesSplit:Array = theLines.split("\n", false)
#
#				if(conditionSplit.empty()):
#					text += theTabs + "addLines([\n"
#					for theLine in linesSplit:
#						text += theTabs + "\t\""+theLine+"\",\n"
#					text += theTabs + "])\n"
#				else:
#					text += theTabs + "if("+Util.join(conditionSplit, " && ")+"):\n"
#					text += theTabs + "\taddLines([\n"
#					for theLine in linesSplit:
#						text += theTabs + "\t\t\""+theLine+"\",\n"
#					text += theTabs + "\t])\n"
		
		text += "\n"
	
	output_text_edit.text = text

func calcConditionTree(entries:Array) -> Dictionary:
	var result:Dictionary = {
		lines = [],
		more = {},
	}
	
	for theLinesEntry in entries:
		var theCondition:String = theLinesEntry["condition"]
		var conditionSplit:Array = theCondition.split("\n", false)
		var theLines:String = theLinesEntry["lines"]
		var linesSplit:Array = theLines.split("\n", false)
		
		if(linesSplit.empty()):
			continue
		var dictToAddLinesTo:Dictionary = result
		for conditionText in conditionSplit:
			if(!dictToAddLinesTo["more"].has(conditionText)):
				dictToAddLinesTo["more"][conditionText] = {
					lines = [],
					more = {},
				}
			dictToAddLinesTo = dictToAddLinesTo["more"][conditionText]
		
		dictToAddLinesTo["lines"].append_array(linesSplit)
	
	return result

func conditionTreeToArrayOfLines(_tree:Dictionary, _condition:Array = []) -> Array:
	var result:Array = []
	
	if(!_condition.empty()):
		#Util.join(_condition, " && ")
		result.append("\t".repeat(_condition.size()-1)+"if("+_condition.back()+"):")
	if(!_tree["lines"].empty()):
		var theTabs:String = "\t".repeat(_condition.size())
		result.append(theTabs+"addLines([")
		for line in _tree["lines"]:
			result.append(theTabs+"\t\""+line+"\",")
		result.append(theTabs+"])")
	
	for _extraCond in _tree["more"]:
		var newConditions:Array = _condition.duplicate()
		newConditions.append(_extraCond)
		
		result.append_array(conditionTreeToArrayOfLines(_tree["more"][_extraCond], newConditions))
	
	return result

const ROLES_NAMES = ["ROLE_MAIN", "ROLE_TARGET", "ROLE_EXTRA", "ROLE_EXTRA_2"]


func _on_CleanLinesButton_pressed():
	if(true):
		var theText:String = lines_text_edit.text
		
		var splitText:Array = theText.split("\n")
		var newLines:Array = []
		for theLine in splitText:
			var newLine:String = theLine
			newLine = newLine.strip_edges()
			newLine = newLine.trim_suffix(",")
			newLine = newLine.trim_suffix("\"")
			newLine = newLine.trim_prefix("\"")
			newLine = newLine.trim_prefix("“")
			newLine = newLine.trim_suffix("”")
			newLine = newLine.replace("...", "..")
			newLine = newLine.replace("…", "..")
			newLine = newLine.replace("—", ", ")
			if(newLine == ""):
				continue
			newLines.append(newLine)
		
		lines_text_edit.text = Util.join(newLines, "\n")
		_on_LinesTextEdit_text_changed()
	if(true):
		var theText:String = condition_text_edit.text
		
		var splitText:Array = theText.split("\n")
		var newLines:Array = []
		for theLine in splitText:
			var newLine:String = theLine
			newLine = newLine.strip_edges()
			if(newLine.begins_with("if(")):
				newLine = newLine.trim_prefix("if(")
				newLine = newLine.trim_suffix("):")
			newLines.append(newLine)
		
		condition_text_edit.text = Util.join(newLines, "\n")
		_on_ConditionTextEdit_text_changed()

func updatePrompt():
	if(editReaction.empty() || editReactionID == "" || reaction_entries_list.get_selected_items().empty()):
		prompt_text_edit.text = ""
		return
	var thePrompt:String = "I'm making a lewd text-based game that has a sex engine. I need 20 dialogue lines that an npc might say as a reaction during one of the sex activities. Keep them short and snappy.\n"
	thePrompt += "Reaction id: "+editReactionID+"\n"
	var selectedRole:int = role_selector.selected
	if(selectedRole == 0):
		thePrompt += "Role: Main role. (This npc is the one who is doing the action)"
	if(selectedRole == 1):
		thePrompt += "Role: Target role. (This npc is the one who is being acted upon, receiving the action)"
	if(selectedRole == 2 || selectedRole == 3):
		thePrompt += "Role: Extra role. (This npc is the one who is doing the action but they are not the main npc)"
	thePrompt += "\n\n"
	if(condition_text_edit.text != ""):
		thePrompt += "Npc current status (functions that are true):\n"+condition_text_edit.text
		thePrompt += "\n\n"
	if(lines_text_edit.text != ""):
		thePrompt += "Example lines (avoid giving me these):\n"+lines_text_edit.text
	
	prompt_text_edit.text = thePrompt


func _on_GeneratePromptButton_pressed():
	updatePrompt()
