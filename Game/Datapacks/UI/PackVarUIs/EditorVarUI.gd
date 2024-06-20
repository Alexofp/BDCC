extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"
onready var item_list = $VBoxContainer2/HBoxContainer/ItemList

var thingIds = []
var savedThings:Dictionary
var editorKind:String = ""
onready var new_thing_id_line_edit = $AddNewDialog/VBoxContainer/NewThingIDLineEdit

func setThings(thingsDict:Dictionary):
	savedThings = thingsDict
	updateThings()
	
func updateThings():
	item_list.clear()
	thingIds.clear()
	
	for thingID in savedThings:
		var theThing = savedThings[thingID]
		
		thingIds.append(thingID)
		item_list.add_item(theThing.getEditorName())
	
	if(thingIds.size() > 0 && item_list.get_selected_items().size() <= 0):
		item_list.select(0)

func setData(_dataLine:Dictionary):
	if(_dataLine.has("value")):
		setThings(_dataLine["value"])
	if(_dataLine.has("name")):
		$VBoxContainer2/Label.text = _dataLine["name"]
	if(_dataLine.has("editorKind")):
		editorKind = _dataLine["editorKind"]

func getSelectedID():
	var selectedInds = item_list.get_selected_items()
	if(selectedInds.size() <= 0):
		return null
	return thingIds[selectedInds[0]]


func _on_ConfirmDeleteDialog_confirmed():
	if(thingToDeleteID == null):
		return
	
	var _ok = savedThings.erase(thingToDeleteID)
	updateThings()
	thingToDeleteID = null


var thingToDeleteID
func _on_DeleteButton_pressed():
	thingToDeleteID = getSelectedID()
	if(thingToDeleteID == null):
		return
	$ConfirmDeleteDialog.visible = true


func _on_NewButton_pressed():
	$AddNewDialog.visible = true
	if(editorKind == "character"):
		$AddNewDialog/VBoxContainer/Label.text = "Enter an id for a new character. It must be unique"
	if(editorKind == "scene"):
		$AddNewDialog/VBoxContainer/Label.text = "Enter an id for a new scene. It must be unique"
	if(editorKind == "skin"):
		$AddNewDialog/VBoxContainer/Label.text = "Enter an id for a new skin. It must be unique"
	
	new_thing_id_line_edit.text = ""
	
func _on_AddNewDialog_confirmed():
	var theNewId = new_thing_id_line_edit.text

	if(theNewId == ""):
		return
	
	if(editorKind == "character"):
		var newDatapackCharacter:DatapackCharacter = DatapackCharacter.new()
		newDatapackCharacter.id = theNewId
		
		savedThings[theNewId] = newDatapackCharacter
		updateThings()
		#showAlert("Adding new character, "+theNewId)
		#print("ADDING NEW CHARACTER, "+theNewId)
		var charEditor = load("res://Game/Datapacks/UI/Editors/DatapackCharacterEditor.tscn").instance()
		pushMenu(charEditor)
		charEditor.setCharacter(newDatapackCharacter)

func _on_EditButton_pressed():
	var selectedIDToEdit = getSelectedID()
	if(selectedIDToEdit == null):
		return
	
	#print("EDITING "+str(selectedIDToEdit))
	if(editorKind == "character"):
		var charEditor = load("res://Game/Datapacks/UI/Editors/DatapackCharacterEditor.tscn").instance()
		pushMenu(charEditor)
		charEditor.setCharacter(savedThings[selectedIDToEdit])
		
