extends HBoxContainer
onready var string_var_ui = $StringVarUI
onready var spin_box = $Control/SpinBox
onready var text_edit = $Control/TextEdit
onready var check_box = $Control/CheckBox
onready var selector_type = $SelectorType

signal onVarEdit(varName, entry)
signal onDeletePressed(varName)
signal onVarRename(oldName, newName)

var varName = "asd"
var entry = {
	type = DatapackSceneVarType.BOOL,
	default = false,
}

func _ready():
	for varType in DatapackSceneVarType.getAll():
		selector_type.add_item(DatapackSceneVarType.getName(varType))

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
	var _i = 0
	for theType in DatapackSceneVarType.getAll():
		if(theType == entry["type"]):
			selector_type.select(_i)
		_i += 1
	updateDefaultValue()

func updateDefaultValue():
	var theType = entry["type"]
	spin_box.visible = false
	text_edit.visible = false
	check_box.visible = false
	
	if(theType == DatapackSceneVarType.BOOL):
		check_box.visible = true
		check_box.set_pressed_no_signal(entry["default"])
	if(theType == DatapackSceneVarType.NUMBER):
		spin_box.visible = true
		spin_box.value = entry["default"]
	if(theType == DatapackSceneVarType.STRING):
		text_edit.visible = true
		text_edit.text = str(entry["default"])

func _on_StringVarUI_onValueChange(_id, newValue):
	var oldName = varName
	varName = newValue
	
	emit_signal("onVarRename", oldName, varName)

func _on_DeleteButton_pressed():
	emit_signal("onDeletePressed", varName)

func _on_SpinBox_value_changed(value):
	if(entry["type"] == DatapackSceneVarType.NUMBER):
		entry["default"] = value
		emit_signal("onVarEdit", varName, entry.duplicate())

func _on_TextEdit_text_changed():
	if(entry["type"] == DatapackSceneVarType.STRING):
		entry["default"] = text_edit.text
		emit_signal("onVarEdit", varName, entry.duplicate())

func _on_CheckBox_toggled(button_pressed):
	if(entry["type"] == DatapackSceneVarType.BOOL):
		entry["default"] = button_pressed
		emit_signal("onVarEdit", varName, entry.duplicate())

func _on_SelectorType_item_selected(index):
	var allTypes = DatapackSceneVarType.getAll()
	if(index < 0 || index >= allTypes.size()):
		return
	entry["type"] = allTypes[index]
	entry["default"] = DatapackSceneVarType.getDefaultValue(entry["type"])
	updateDefaultValue()
	
	emit_signal("onVarEdit", varName, entry.duplicate())
