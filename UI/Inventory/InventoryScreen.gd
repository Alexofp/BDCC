extends Control

onready var itemListContainer = $MarginContainer/HBoxContainer/VBoxContainer2/ScrollContainer/VBoxContainer
var inventoryEntry = preload("res://UI/Inventory/InventoryEntry.tscn")
onready var itemNameLabel = $MarginContainer/HBoxContainer/VBoxContainer/Label
onready var itemDescLabel = $MarginContainer/HBoxContainer/VBoxContainer/RichTextLabel

var inventory: Inventory
var selectedItem: ItemBase
var itemEntries = []

signal onInteractWith(item)
signal onItemSelected(item)

var isFightMode = false

func setInventory(inv, isFight = false):
	if(inventory != inv || isFightMode != isFight):
		isFightMode = isFight
		inventory = inv
		updateInventory()

func updateInventory():
	Util.delete_children(itemListContainer)
	itemEntries = []
	
	if(inventory == null):
		return
	
	var theItems = inventory.getItemsAndEquippedItemsTogether()
	# Items that we can use are first while in combat
	if(isFightMode):
		var newOrder = []
		var lastItems = []
		for item in theItems:
			var actions = item.getPossibleActions()
			if(actions.size() > 0):
				newOrder.append(item)
			else:
				lastItems.append(item)
				
		newOrder.append_array(lastItems)
		theItems = newOrder
	
	for item in theItems:
		var entry = inventoryEntry.instance()
		itemListContainer.add_child(entry)
		itemEntries.append(entry)
		entry.setItem(item, isFightMode)
		
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
