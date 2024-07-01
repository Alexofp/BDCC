extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var data = {
	baseTableID = "base",
	creditsDropChance = 50,
	creditsMin = 1,
	creditsMax = 5,
	customLoot = [],
}
onready var base_drop_table = $BaseDropTable
onready var chance_to_drop_credits_ui = $ChanceToDropCreditsUI
onready var min_credits_ui = $MinCreditsUI
onready var max_credits_ui = $MaxCreditsUI

var dropTableEntryScene = preload("res://Game/Datapacks/UI/PackVarUIs/DropTableEntryUI.tscn")

var allValues = {}
var categories = []

func _ready():
	var itemRefs = GlobalRegistry.getItemRefs()
	for itemID in itemRefs:
		var item:ItemBase = itemRefs[itemID]
		var category = item.getItemCategory()
		
		if(!allValues.has(category)):
			allValues[category] = []
			$CustomLootKindSelector.add_item(category)
			categories.append(category)
		
		allValues[category].append(itemID)
	_on_CustomLootKindSelector_item_selected(0)

func _on_CustomLootKindSelector_item_selected(index):
	$HBoxContainer/CustomLootItemList.clear()
	if(index < 0 || index >= categories.size()):
		return
	var selectedCategory = categories[index]
	for itemID in allValues[selectedCategory]:
		$HBoxContainer/CustomLootItemList.add_item(itemID)

func updateDropTableData():
	base_drop_table.setData({
		name = "Base drop table",
		value = (data["baseTableID"] if data.has("baseTableID") else "base"),
		values = GlobalRegistry.getLootTables().keys(),
	})
	chance_to_drop_credits_ui.setData({
		name = "Chance to drop credits",
		value = (data["creditsDropChance"] if data.has("creditsDropChance") else 0),
	})
	min_credits_ui.setData({
		name = "Min credits",
		value = (data["creditsMin"] if data.has("creditsMin") else 0),
		int=true,
	})
	max_credits_ui.setData({
		name = "Max credits",
		value = (data["creditsMax"] if data.has("creditsMax") else 0),
		int=true,
	})
	
func updateCustomLoot():
	Util.delete_children($PanelContainer/CustomLootList)
	
	if(!data.has("customLoot")):
		return
	
	var _i = 0
	for lootLine in data["customLoot"]:
		if(!(lootLine is Dictionary) || !lootLine.has("item") || !lootLine.has("chance")):
			_i +=1
			continue
		
		var theText = ""
		var itemRef:ItemBase = GlobalRegistry.getItemRef(lootLine["item"])
		if(itemRef == null):
			_i += 1
			continue
		
		theText = "Chance: "+str(lootLine["chance"])+"%"+" item: "
		if(lootLine.has("min") && lootLine.has("max")):
			var minVal = lootLine["min"]
			var maxVal = lootLine["max"]
			if(minVal < 1):
				minVal = 1
			if(maxVal < 1):
				maxVal = 1
			if(minVal > maxVal):
				minVal = maxVal
			if(minVal == maxVal):
				theText += str(minVal)+"x "
			else:
				theText += str(minVal)+"-"+str(maxVal)+"x "
		theText += itemRef.getVisibleName()
		
		var newEntry = dropTableEntryScene.instance()
		$PanelContainer/CustomLootList.add_child(newEntry)
		newEntry.id = _i
		
		newEntry.setData({
			name = theText,
		})
		newEntry.connect("onDeletePressed", self, "onDeleteCustomLootEntry")
		_i += 1

func onDeleteCustomLootEntry(_index):
	if(_index < 0 || _index >= data["customLoot"].size()):
		return
	data["customLoot"].remove(_index)
	updateCustomLoot()
	triggerChange(data.duplicate())

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		$Label.text = _dataLine["name"]
	if(_dataLine.has("value")):
		data = (_dataLine["value"])
	updateDropTableData()
	updateCustomLoot()

func _on_BaseDropTable_onValueChange(_id, newValue):
	data["baseTableID"] = newValue
	triggerChange(data.duplicate())

func _on_ChanceToDropCreditsUI_onValueChange(_id, newValue):
	data["creditsDropChance"] = newValue
	triggerChange(data.duplicate())

func _on_MinCreditsUI_onValueChange(_id, newValue):
	data["creditsMin"] = newValue
	triggerChange(data.duplicate())

func _on_MaxCreditsUI_onValueChange(_id, newValue):
	data["creditsMax"] = newValue
	triggerChange(data.duplicate())

func _on_CustomLootItemList_item_selected(index):
	var selectedCategory = categories[$CustomLootKindSelector.selected]
	
	var selectedItemID = allValues[selectedCategory][index]
	
	var itemRef:ItemBase = GlobalRegistry.getItemRef(selectedItemID)
	if(itemRef == null):
		return
	
	var canCombine = itemRef.canCombine()
	$HBoxContainer2/Label2.visible = canCombine
	$HBoxContainer2/SpinBox2.visible = canCombine
	$HBoxContainer2/Label3.visible = canCombine
	$HBoxContainer2/SpinBox3.visible = canCombine

func _on_AddCustomLootButton_pressed():
	var selectedItemsInds = $HBoxContainer/CustomLootItemList.get_selected_items()
	if(selectedItemsInds.size() <= 0):
		return
	
	var selectedCategory = categories[$CustomLootKindSelector.selected]
	var selectedItemID = allValues[selectedCategory][selectedItemsInds[0]]
	
	var itemRef:ItemBase = GlobalRegistry.getItemRef(selectedItemID)
	if(itemRef == null):
		return
	if(itemRef.canCombine()):
		var minVal = $HBoxContainer2/SpinBox2.value
		var maxVal = $HBoxContainer2/SpinBox3.value
		if(minVal < 1):
			minVal = 1
		if(maxVal < 1):
			maxVal = 1
		if(minVal > maxVal):
			minVal = maxVal
		
		data["customLoot"].append({
			item = selectedItemID,
			chance = clamp($HBoxContainer2/SpinBox.value, 0.0, 100.0),
			min = minVal,
			max = maxVal,
		})
	else:
		data["customLoot"].append({
			item = selectedItemID,
			chance = clamp($HBoxContainer2/SpinBox.value, 0.0, 100.0),
		})
	updateCustomLoot()
	triggerChange(data.duplicate())
