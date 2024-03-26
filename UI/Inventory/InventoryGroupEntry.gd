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
var isBuy = false
var isSell = false
var isLoot = false
var isStash = false
var isTake = false
var isGive = false
var isEquipTake = false

func _ready():
	var minSizeInv = OPTIONS.getInventoryIconSize()
	$VBoxContainer/HBoxContainer/Control/Info/TextureRect.rect_min_size.x = minSizeInv
	$VBoxContainer/HBoxContainer/Control/Info/TextureRect.rect_min_size.y = minSizeInv
	setSelected(false)
	Util.delete_children(entryList)
	entryMargin.visible = false

func setItem(theItem:ItemBase, theMode):
	isFightMode = (theMode == "fight")
	isBuy = (theMode == "buy")
	isSell = (theMode == "sell")
	isLoot = (theMode == "loot")
	isStash = (theMode == "stash")
	isTake = (theMode == "take")
	isGive = (theMode == "give")
	isEquipTake = (theMode == "equiptake")
	item = theItem
	updateInfo()
	
	if(isSell):
		$VBoxContainer/HBoxContainer/HBoxContainer/InteractButton.text = "Sell all"

	if(isStash):
		$VBoxContainer/HBoxContainer/HBoxContainer/InteractButton.text = "Stash all"
	if(isTake):
		$VBoxContainer/HBoxContainer/HBoxContainer/InteractButton.text = "Take all"
	if(isGive):
		$VBoxContainer/HBoxContainer/HBoxContainer/InteractButton.text = "Give all"
	if(isEquipTake):
		$VBoxContainer/HBoxContainer/HBoxContainer/InteractButton.text = "Take all"

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
		itemNameLabel.text = "(worn) "+item.getVisibleName()
	else:
		itemNameLabel.text = item.getVisibleName()
	
	var imagePath = item.getInventoryImage()
	if(imagePath != null):
		var theImage = load(imagePath)
		if(theImage != null):
			itemTextureRect.texture = theImage
			itemTextureRect.self_modulate = item.getInventoryImageColor()
	
	if(isSell):
		showUseButton(true)
	if(isStash || isTake || isGive || isEquipTake):
		showUseButton(true)

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
		var accurateAmount = 0
		for theitem in items:
			if(theitem.item != null):
				accurateAmount += theitem.item.getAmount()
		
		itemCollapsedLabel.text = str(accurateAmount)+"x"
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
