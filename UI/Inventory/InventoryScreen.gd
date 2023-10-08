extends Control

onready var itemListContainer = $MarginContainer/HBoxContainer/VBoxContainer2/ScrollContainer/VBoxContainer2/VBoxContainer
var inventoryEntry = preload("res://UI/Inventory/InventoryEntry.tscn")
var inventoryGroupEntry = preload("res://UI/Inventory/InventoryGroupEntry.tscn")
onready var itemNameLabel = $MarginContainer/HBoxContainer/VBoxContainer/Label
onready var itemDescLabel = $MarginContainer/HBoxContainer/VBoxContainer/RichTextLabel
onready var searchInput = $MarginContainer/HBoxContainer/VBoxContainer2/ScrollContainer/VBoxContainer2/SearchLineEdit

var inventory: Inventory
var selectedItem: ItemBase
var itemEntries = []
var filterEnteries = []

signal onInteractWith(item)
signal onItemSelected(item)

var isFightMode = false

func _ready():
	searchInput.grab_focus()

func setInventory(inv, isFight = false):
	if(inventory != inv || isFightMode != isFight):
		isFightMode = isFight
		inventory = inv
		updateInventory()

func filterInventory():
	var textToFilter = searchInput.text.to_lower()
	if(textToFilter == ""):
		for entry in filterEnteries:
			entry.visible = true
		return
	
	for entry in filterEnteries:
		var nameToCheck = entry.getItem().getVisibleName().to_lower()
		
		if(textToFilter in nameToCheck):
			entry.visible = true
		else:
			entry.visible = false

func updateInventory():
	Util.delete_children(itemListContainer)
	itemEntries = []
	filterEnteries = []
	
	if(inventory == null):
		return
	
	var theItemsGrouped = inventory.getItemsAndEquippedItemsTogetherGrouped()
	
	# Items that we can use are first while in combat
	if(isFightMode):
		var newOrder = {}
		var lastItems = {}
		for itemKey in theItemsGrouped:
			var item = theItemsGrouped[itemKey][0]
			var actions = item.getPossibleActions()
			if(actions.size() == 1):
				newOrder[itemKey] = theItemsGrouped[itemKey]
			else:
				lastItems[itemKey] = theItemsGrouped[itemKey]

		for itemKey in lastItems:
			newOrder[itemKey] = lastItems[itemKey]
		theItemsGrouped = newOrder
	
	for groupID in theItemsGrouped:
		var theItems = theItemsGrouped[groupID]
		
		if(theItems.size() == 1):
			var item = theItems[0]
			var entry = inventoryEntry.instance()
			itemListContainer.add_child(entry)
			itemEntries.append(entry)
			filterEnteries.append(entry)
			entry.setItem(item, isFightMode)
			
			entry.connect("onInteractButtonPressed", self, "onEntryInteractButtonPressed")
			entry.connect("onItemSelected", self, "onEntrySelected")
		else:
			var newGroupEntry = inventoryGroupEntry.instance()
			itemListContainer.add_child(newGroupEntry)
			newGroupEntry.setItem(theItems[0], isFightMode)
			filterEnteries.append(newGroupEntry)
			# add entry to some group entries maybe here
			for item in theItems:
				var entry = inventoryEntry.instance()
				newGroupEntry.addEntry(entry)
				entry.setItem(item, isFightMode)
				itemEntries.append(entry)
				
				entry.connect("onInteractButtonPressed", self, "onEntryInteractButtonPressed")
				entry.connect("onItemSelected", self, "onEntrySelected")
			
	updateSelectedHighlight()

func updateSelectedHighlight():
	for entry in itemEntries:
		if(entry.getItem() == selectedItem):
			entry.setSelected(true)
		else:
			entry.setSelected(false)

func updateSelectedInfo():
	if(selectedItem == null):
		return
	itemNameLabel.text = selectedItem.getStackName()
	itemDescLabel.bbcode_text = selectedItem.getVisibleDescription()

func onEntryInteractButtonPressed(theItem):
	emit_signal("onInteractWith", theItem)

func onEntrySelected(theItem):
	selectedItem = theItem
	updateSelectedInfo()
	updateSelectedHighlight()
	emit_signal("onItemSelected", selectedItem)


func _on_SearchLineEdit_text_changed(_new_text):
	filterInventory()
