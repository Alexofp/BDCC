extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var thePrefix = ""

var inventorySlot = InventorySlot.Body
var selectedValue = ""
var values = []
var shouldRequip = true

func setSelectedValue(_value):
	selectedValue = _value
	shouldRequip = true
	if(selectedValue is Dictionary):
		if(selectedValue.has("autoEquip")):
			shouldRequip = selectedValue["autoEquip"]
		selectedValue = selectedValue["id"]
	$AutoCheckBox.set_pressed_no_signal(shouldRequip)
	#updateValues()
	#$SpinBox.value = _value
	
	var _i = 0
	for value in values:
		if(value == selectedValue):
			$OptionButton.select(_i)
		
		_i += 1

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		thePrefix = _dataLine["name"]
		$Label.text = thePrefix
	if(_dataLine.has("slot")):
		inventorySlot = _dataLine["slot"]
	updateValues()
	if(_dataLine.has("value")):
		setSelectedValue(_dataLine["value"])

func updateValues():
	$OptionButton.clear()
	values.clear()
	var _i = 1
	$OptionButton.add_item("- Nothing -")
	values.append("")
	$OptionButton.select(0)
	
	var allItems = GlobalRegistry.getItemRefs()
	for itemID in allItems:
		var theItem:ItemBase = allItems[itemID]
		
		var invSlot = theItem.getClothingSlot()
		
		if(invSlot != null && invSlot == inventorySlot):
			values.append(itemID)
			$OptionButton.add_item(itemID)
			
			if(itemID == selectedValue):
				$OptionButton.select(_i)
			
			_i += 1
		
func _on_OptionButton_item_selected(index):
	if(index < 0 || index >= values.size()):
		return
	
	selectedValue = values[index]
	triggerChange({id=selectedValue,autoEquip=shouldRequip})

func _on_AutoCheckBox_toggled(button_pressed):
	shouldRequip = button_pressed
	triggerChange({id=selectedValue,autoEquip=shouldRequip})
