extends VBoxContainer

export var addSeparators = true
signal onVariableChange(id, value)

var collapseRegionScene = preload("res://Game/Datapacks/UI/PackVarsCollapsableRegion.tscn")

var widgets = []
var collapsers = []

func setVariables(_data:Dictionary):
	Util.delete_children(self)
	widgets = []
	collapsers = []
	
	for dataID in _data:
		var dataLine = _data[dataID]
		
		var type = dataLine["type"]
		
		var newWidget
		
		if(type == "string"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/StringVarUI.tscn").instance()
		elif(type == "bigString"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/BigStringVarUI.tscn").instance()
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
		elif(type == "fetishes"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/FetishMapVarUI.tscn").instance()
		elif(type == "fetishSingle"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/FetishSingleVarUI.tscn").instance()
		elif(type == "likesDislikes"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/LikesDislikesMapVarUI.tscn").instance()
		elif(type == "likesDislikesSingle"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/LikesDislikesSingleVarUI.tscn").instance()
		elif(type == "stats"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/StatsVarUI.tscn").instance()
		elif(type == "statSingle"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/StatSingleVarUI.tscn").instance()
		elif(type == "image"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/ImageVarUI.tscn").instance()
		elif(type == "skinTypeWeights"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/SkinTypeWeightsVarUI.tscn").instance()
		elif(type == "lootTable"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/DropTableVarUI.tscn").instance()
		elif(type == "location"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/LocationVarUI.tscn").instance()
		elif(type == "advancedSelector"):
			newWidget = preload("res://Game/Datapacks/UI/PackVarUIs/AdvancedSelectorVarUI.tscn").instance()
		else:
			Log.printerr("Unknown var type found: "+str(type))

		if(newWidget != null):
			if(dataLine.has("collapsable") && dataLine["collapsable"]):
				var newCollapse = collapseRegionScene.instance()
				add_child(newCollapse)
				newCollapse.setText(dataLine["name"] if dataLine.has("name") else dataID)
				newCollapse.addToRegion(newWidget)
				collapsers.append(newCollapse)
			elif(dataLine.has("addtoprev") && dataLine["addtoprev"]):
				collapsers.back().addToRegion(newWidget)
			else:
				add_child(newWidget)
			widgets.append(newWidget)
			newWidget.id = dataID
			newWidget.connect("onValueChange", self, "onWidgetValueChange")
			newWidget.setData(dataLine)
			
			if(addSeparators):
				if(dataLine.has("noseparator") && dataLine["noseparator"]):
					continue
				if(dataLine.has("addtoprev") && dataLine["addtoprev"]):
					collapsers.back().addToRegion(HSeparator.new())
				else:
					add_child(HSeparator.new())

func onWidgetValueChange(id, value):
	emit_signal("onVariableChange", id, value)

func checkWidgetsFinished():
	for widget in widgets:
		widget.onEditorClose()
	return true
