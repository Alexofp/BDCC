extends Control

onready var itemListContainer = $MarginContainer/HBoxContainer/VBoxContainer2/ScrollContainer/VBoxContainer2/VBoxContainer
#var inventoryEntry = preload("res://UI/Inventory/InventoryEntry.tscn")
#var inventoryGroupEntry = preload("res://UI/Inventory/InventoryGroupEntry.tscn")
var genericEntryScene = preload("res://UI/Inventory/GenericInventoryEntry.tscn")
onready var itemNameLabel = $MarginContainer/HBoxContainer/VBoxContainer/Label
onready var itemDescLabel = $MarginContainer/HBoxContainer/VBoxContainer/RichTextLabel
onready var searchInput = $MarginContainer/HBoxContainer/VBoxContainer2/ScrollContainer/VBoxContainer2/SearchLineEdit
onready var v_box_container_2 = $MarginContainer/HBoxContainer/VBoxContainer2

var entries:Dictionary = {}
var selectedEntry:String = ""
var entriesScenes:Dictionary = {}

signal onInteractWith(itemID, actionID, _args)
signal onItemSelected(itemID)

#func _ready():
#	setEntries({
#		"entry1": {
#			name = "Entry 1",
#			desc = "Meow meow",
#			actions = [
#				["mew", "Meow"],
#				["mow", "MOW!"],
#			],
#		},
#		"entry2": {
#			name = "Entry 2",
#			desc = "Meow meow 2",
#			actions = [
#				["mew2", "Meow2"],
#				["mow2", "MOW2!"],
#			],
#		},
#	})

func setEntries(newEntries:Dictionary):
	entries = newEntries
	selectedEntry = ""
	updateEntries()

func setRightPanelStretchRation(_ratio:float):
	v_box_container_2.size_flags_stretch_ratio = _ratio

func updateEntries():
	Util.delete_children(itemListContainer)
	entriesScenes = {}
	
	var filterText:String = searchInput.text.to_lower()
	
	for entryID in entries:
		var entry:Dictionary = entries[entryID]
		var entryName:String = entry["name"] if entry.has("name") else "Unknown entry"
		entryName = entryName.to_lower()
		
		if(filterText != "" && !(filterText in entryName)):
			continue
		
		var newEntry = genericEntryScene.instance()
		itemListContainer.add_child(newEntry)
		newEntry.id = entryID
		newEntry.setEntry(entry)
		newEntry.setSelected(selectedEntry == entryID)
		var _ok = newEntry.connect("onActionPressed", self, "onEntryActionPressed")
		var _ok2 = newEntry.connect("onEntrySelected", self, "onEntrySelected")
		entriesScenes[entryID] = newEntry
		
func updateSelectedEntry():
	for entryID in entriesScenes:
		var entryScene = entriesScenes[entryID]
		entryScene.setSelected(selectedEntry == entryID)

func onEntryActionPressed(_id, _actionID, _args):
	emit_signal("onInteractWith", _id, _actionID, _args)

func onEntrySelected(_id):
	selectedEntry = _id
	updateSelectedEntry()
	
	var theEntry:Dictionary = entries[selectedEntry]
	
	itemNameLabel.text = theEntry["name"] if theEntry.has("name") else "Unknown entry"
	itemDescLabel.bbcode_text = theEntry["desc"] if theEntry.has("desc") else "No description provided"
	
	
	emit_signal("onItemSelected", _id)


func _on_SearchLineEdit_text_changed(_new_text):
	updateEntries()
