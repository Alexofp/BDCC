extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"
onready var auto_selector_var_ui = $HBoxContainer/AutoSelectorVarUI

var thePrefix = ""

var inventorySlot = InventorySlot.Body
var selectedValue = ""
var values = []
var shouldRequip = true
var data = {}
var packVars

func _ready():
	packVars = load("res://Game/Datapacks/UI/PackVariables.tscn").instance()
	add_child(packVars)
	packVars.addSeparators = false
	var _ok = packVars.connect("onVariableChange", self, "_on_PackVariables_onVariableChange")

func setSelectedValue(_value):
	selectedValue = _value
	shouldRequip = true
	if(selectedValue is Dictionary):
		if(selectedValue.has("autoEquip")):
			shouldRequip = selectedValue["autoEquip"]
		if(selectedValue.has("data")):
			data = selectedValue["data"]
		else:
			data = {}
		selectedValue = selectedValue["id"]
	$HBoxContainer/AutoCheckBox.set_pressed_no_signal(shouldRequip)
	#updateValues()
	#$SpinBox.value = _value
	
	#var _i = 0
	#for value in values:
	#	if(value == selectedValue):
	#		$HBoxContainer/OptionButton.select(_i)
	#	
	#	_i += 1
	updateValues()
	updateDataVars()

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		thePrefix = _dataLine["name"]
		$HBoxContainer/Label.text = thePrefix
	if(_dataLine.has("slot")):
		inventorySlot = _dataLine["slot"]
	updateValues()
	if(_dataLine.has("value")):
		setSelectedValue(_dataLine["value"])
	else:
		updateDataVars()

func updateValues():
	#$HBoxContainer/OptionButton.clear()
	values.clear()
	var _i = 1
	#$HBoxContainer/OptionButton.add_item("- Nothing -")
	var theItemIDs:Array = [
		["", "- Nothing -"]
	]
	values.append("")
	#$HBoxContainer/OptionButton.select(0)
	
	var allItems = GlobalRegistry.getItemRefs()
	for itemID in allItems:
		var theItem:ItemBase = allItems[itemID]
		
		var invSlot = theItem.getClothingSlot()
		
		if(invSlot != null && invSlot == inventorySlot):
			values.append(itemID)
			#$HBoxContainer/OptionButton.add_item(itemID)
			
			#if(itemID == selectedValue):
			#	$HBoxContainer/OptionButton.select(_i)
			theItemIDs.append([
				itemID, theItem.getVisibleName() + " (id=" + itemID+")",
			])
			
			_i += 1
	auto_selector_var_ui.setData({
		name = "",
		values = theItemIDs,
		value = selectedValue,
		expand=true,
		alwaysEdit=true,
	})

func updateDataVars():
	if(selectedValue == ""):
		packVars.setVariables({})
		return
		
	var theItem = GlobalRegistry.getItemRef(selectedValue)
	if(theItem == null):
		packVars.setVariables({})
		return
	
	var theVars = theItem.getDatapackEditVars()
	for varID in theVars:
		if(data.has(varID)):
			theVars[varID]["value"] = data[varID]
	packVars.setVariables(theVars)

func _on_OptionButton_item_selected(index):
	if(index < 0 || index >= values.size()):
		return
	
	selectedValue = values[index]
	data = {}
	updateDataVars()
	doTriggerChangeFinal()

func _on_AutoCheckBox_toggled(button_pressed):
	shouldRequip = button_pressed
	doTriggerChangeFinal()

func doTriggerChangeFinal():
	triggerChange({id=selectedValue,autoEquip=shouldRequip,data=data.duplicate()})

func _on_PackVariables_onVariableChange(_id, _value):
	data[_id] = _value
	doTriggerChangeFinal()


func _on_AutoSelectorVarUI_onValueChange(_id, newValue):
	selectedValue = newValue
	data = {}
	updateDataVars()
	doTriggerChangeFinal()
