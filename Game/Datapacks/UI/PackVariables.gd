extends VBoxContainer

signal onVariableChange(id, value)

func setVariables(_data:Dictionary):
	Util.delete_children(self)
	
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
		else:
			Log.printerr("Unknown var type found: "+str(type))

		if(newWidget != null):
			add_child(newWidget)
			newWidget.id = dataID
			newWidget.connect("onValueChange", self, "onWidgetValueChange")
			newWidget.setData(dataLine)

func onWidgetValueChange(id, value):
	emit_signal("onVariableChange", id, value)
