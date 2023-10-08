extends Control

signal onInteractButtonPressed(item)
#signal onItemSelected(item)
onready var itemNameLabel = $VBoxContainer/HBoxContainer/Control/Info/HBoxContainer/Label
onready var itemCollapsedLabel = $VBoxContainer/HBoxContainer/Control/Info/HBoxContainer/Label2
var inventoryEntry = preload("res://UI/Inventory/InventoryEntry.tscn")
onready var entryList = $VBoxContainer/MarginContainer/VBoxContainer
onready var entryMargin = $VBoxContainer/MarginContainer
onready var itemTextureRect = $VBoxContainer/HBoxContainer/Control/Info/TextureRect

var item: ItemBase
var isSelected = false
var isFightMode = false
var items = []
var isCollapsed = true

func _ready():
	setSelected(false)
	Util.delete_children(entryList)
	entryMargin.visible = false

func setItem(theItem:ItemBase, isFight):
	isFightMode = isFight
	item = theItem
	updateInfo()

func addEntry(newEntry):
	items.append(newEntry)
	
	entryList.add_child(newEntry)
	updateCollapsed()

func getItem():
	return item

func canDoAction(action):
	if(isFightMode && action.has("onlyWhenCalm") && action["onlyWhenCalm"]):
		return false
		
	return true

func updateInfo():
	if(item == null):
		return
	
	if(item.isWornByWearer()):
		itemNameLabel.text = "(worn) "+item.getStackName()
	else:
		itemNameLabel.text = item.getStackName()
	
	var imagePath = item.getInventoryImage()
	if(imagePath != null):
		var theImage = load(imagePath)
		if(theImage != null):
			itemTextureRect.texture = theImage
	
	if(isFightMode):
		var possibleActions = item.getPossibleActions()
		if(possibleActions.size() == 1 && canDoAction(possibleActions[0])):
			showUseButton(true)
		else:
			showUseButton(false)
	else:
		showUseButton(false)

func _on_InteractButton_pressed():
	emit_signal("onInteractButtonPressed", item)

func _on_SelectButton_pressed():
	entryMargin.visible = !entryMargin.visible
	isCollapsed = !entryMargin.visible
	updateCollapsed()
	#emit_signal("onItemSelected", item)

func updateCollapsed():
	if(isCollapsed):
		setSelected(false)
		itemCollapsedLabel.text = str(items.size())+"x"
	else:
		setSelected(true)
		itemCollapsedLabel.text = "V "

func setSelected(isNewSelected):
	if(isNewSelected != isSelected):
		if(isNewSelected):
			$ColorRect.color.a = 0.0
		else:
			$ColorRect.color.a = 1.0
	isSelected = isNewSelected


func _on_SelectButton_mouse_entered():
	pass
	#GlobalTooltip.showTooltip(item.getStackName(), item.getVisibleDescription(), false, true)


func _on_SelectButton_mouse_exited():
	pass
	#GlobalTooltip.hideTooltip()

func showUseButton(isShow):
	$VBoxContainer/HBoxContainer/HBoxContainer.visible = isShow
