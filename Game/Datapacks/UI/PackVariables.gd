extends VBoxContainer

export var addSeparators = true
signal onVariableChange(id, value)

var collapseRegionScene = preload("res://Game/Datapacks/UI/PackVarsCollapsableRegion.tscn")

var widgets = []

func setVariables(_data:Dictionary):
	Util.delete_children(self)
	widgets = []
	
	for dataID in _data:
		var dataLine = _data[dataID]
		
		var type = dataLine["type"]
		
		var newWidget
		
		if(type == "string"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/StringVarUI.tscn").instance()
		elif(type == "editor"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/EditorVarUI.tscn").instance()
		elif(type == "bodyparts"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/BodypartsVarUI.tscn").instance()
		elif(type == "bodypart"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/BodypartSingleVarUI.tscn").instance()
		elif(type == "skin"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/SkinVarUI.tscn").instance()
		elif(type == "number"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/NumberVarUI.tscn").instance()
		elif(type == "selector"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/SelectorVarUI.tscn").instance()
		elif(type == "equippedItems"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/EquippedItemsVarUI.tscn").instance()
		elif(type == "equippedItem"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/EquipItemVarUI.tscn").instance()
		elif(type == "addRemoveList"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/AddRemoveListVarUI.tscn").instance()
		elif(type == "color"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/ColorVarUI.tscn").instance()
		elif(type == "checkbox"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/CheckboxVarUI.tscn").instance()
		elif(type == "personality"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/PersonalityVarUI.tscn").instance()
		elif(type == "personalityStat"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/PersonalityStatVarUI.tscn").instance()
		else:
			Log.printerr("Unknown var type found: "+str(type))

		if(newWidget != null):
			if(dataLine.has("collapsable") && dataLine["collapsable"]):
				var newCollapse = collapseRegionScene.instance()
				add_child(newCollapse)
				newCollapse.setText(dataLine["name"] if dataLine.has("name") else dataID)
				newCollapse.addToRegion(newWidget)
			else:
				add_child(newWidget)
			widgets.append(newWidget)
			newWidget.id = dataID
			newWidget.connect("onValueChange", self, "onWidgetValueChange")
			newWidget.setData(dataLine)
			
			if(addSeparators):
				add_child(HSeparator.new())

func onWidgetValueChange(id, value):
	emit_signal("onVariableChange", id, value)

func checkWidgetsFinished():
	for widget in widgets:
		widget.onEditorClose()
	return true
