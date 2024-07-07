extends HBoxContainer
onready var string_var_ui = $StringVarUI
onready var selector_var_ui = $SelectorVarUI

signal onVarEdit(varName, entry)
signal onDeletePressed(varName)

var varName = "asd"
var entry = {
	type = DatapackSceneVarType.BOOL,
	default = false,
}

func _ready():
	pass

func setEntry(theVarName, theEntry):
	varName = theVarName
	entry = theEntry.duplicate()
	
	var typeValues = []
	for varType in DatapackSceneVarType.getAll():
		typeValues.append([varType, DatapackSceneVarType.getName(varType)])
	string_var_ui.setData({
		name = "Name",
		value = varName,
	})
	selector_var_ui.setData({
		name = "Type",
		values = typeValues,
		value = entry["type"],
	})

func _on_StringVarUI_onValueChange(_id, newValue):
	varName = newValue
	
	emit_signal("onVarEdit", varName, entry.duplicate())

func _on_DeleteButton_pressed():
	emit_signal("onDeletePressed", varName)

func _on_SelectorVarUI_onValueChange(_id, newValue):
	entry["type"] = newValue
	entry["default"] = DatapackSceneVarType.getDefaultValue(newValue)
	
	emit_signal("onVarEdit", varName, entry.duplicate())
