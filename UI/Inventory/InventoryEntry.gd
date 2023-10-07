extends Control

signal onInteractButtonPressed(item)
signal onItemSelected(item)
onready var itemNameLabel = $HBoxContainer/Control/Info/Label

var item: ItemBase
var isSelected = false
var isFightMode = false

func _ready():
	setSelected(false)

func setItem(theItem:ItemBase, isFight):
	isFightMode = isFight
	item = theItem
	updateInfo()

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
		itemNameLabel.text = "(worn) "+item.getInventoryName()
	else:
		itemNameLabel.text = item.getInventoryName()
	
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
	emit_signal("onItemSelected", item)

func setSelected(isNewSelected):
	if(isNewSelected != isSelected):
		if(isNewSelected):
			$ColorRect.color.a = 0.0
		else:
			$ColorRect.color.a = 1.0
	isSelected = isNewSelected


func _on_SelectButton_mouse_entered():
	GlobalTooltip.showTooltip(item.getStackName(), item.getVisibleDescription(), false, true)


func _on_SelectButton_mouse_exited():
	GlobalTooltip.hideTooltip()

func showUseButton(isShow):
	$HBoxContainer/HBoxContainer.visible = isShow
