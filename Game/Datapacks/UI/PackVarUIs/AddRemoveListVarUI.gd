extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var values = []
var addedValues = []
var valueIDtoText = {}
var allowDuplicates = false
onready var add_item_list = $HBoxContainer/AddItemList

var isListVals = false

func _ready():
	if(OS.has_touchscreen_ui_hint()):
		isListVals = true
		add_item_list.visible = true
		$HBoxContainer/OptionButton.visible = false
	else:
		isListVals = false
		add_item_list.visible = false
		$HBoxContainer/OptionButton.visible = true

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		$Label.text = _dataLine["name"]
	if(_dataLine.has("values")):
		values = _dataLine["values"]
	if(_dataLine.has("value")):
		addedValues = _dataLine["value"].duplicate()
	if(_dataLine.has("allowDuplicates")):
		allowDuplicates = _dataLine["allowDuplicates"]
	updateValues()
	updateAddedValues()

func updateValues():
	$HBoxContainer/OptionButton.clear()
	add_item_list.clear()
	valueIDtoText.clear()
	
	for value in values:
		if(value is Array):
			valueIDtoText[value[0]] = value[1]
			add_item_list.add_item(value[1])
			$HBoxContainer/OptionButton.add_item(value[1])
		else:
			add_item_list.add_item(str(value))
			$HBoxContainer/OptionButton.add_item(str(value))

func updateAddedValues():
	$ItemList.clear()
	
	for value in addedValues:
		if(valueIDtoText.has(value)):
			$ItemList.add_item(valueIDtoText[value])
		else:
			$ItemList.add_item(value)
		
func _on_AddButton_pressed():
	var selectedItemIndex = 0
	
	if(isListVals):
		if(add_item_list.get_selected_items().size() <= 0):
			return
		selectedItemIndex = add_item_list.get_selected_items()[0]
	else:
		selectedItemIndex= $HBoxContainer/OptionButton.selected

	if(selectedItemIndex < 0 || selectedItemIndex >= values.size()):
		return
	
	var toAdd = values[selectedItemIndex]
	if(toAdd is Array):
		toAdd = toAdd[0]
	if(!allowDuplicates):
		if(addedValues.has(toAdd)):
			return
	addedValues.append(toAdd)
	updateAddedValues()
	triggerChange(addedValues.duplicate())

func _on_RemoveButton_pressed():
	if($ItemList.get_selected_items().size() <= 0):
		return
	var selectedDelItemIndex = $ItemList.get_selected_items()[0]
	if(selectedDelItemIndex < 0 || selectedDelItemIndex >= addedValues.size()):
		return
	
	addedValues.remove(selectedDelItemIndex)
	updateAddedValues()
	triggerChange(addedValues.duplicate())

func _on_ClearButton_pressed():
	addedValues = []
	updateAddedValues()
	triggerChange(addedValues.duplicate())

func _on_UpButton_pressed():
	if($ItemList.get_selected_items().size() <= 0):
		return
	var selectedDelItemIndex = $ItemList.get_selected_items()[0]
	if(selectedDelItemIndex < 0 || selectedDelItemIndex >= addedValues.size()):
		return
	
	Util.moveValueUp(addedValues, selectedDelItemIndex)
	updateAddedValues()
	triggerChange(addedValues.duplicate())


func _on_DownButton_pressed():
	if($ItemList.get_selected_items().size() <= 0):
		return
	var selectedDelItemIndex = $ItemList.get_selected_items()[0]
	if(selectedDelItemIndex < 0 || selectedDelItemIndex >= addedValues.size()):
		return
	
	Util.moveValueDown(addedValues, selectedDelItemIndex)
	updateAddedValues()
	triggerChange(addedValues.duplicate())
