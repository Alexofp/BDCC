extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

onready var advanced_selector_var_ui = $AdvancedSelectorVarUI
onready var selector_var_ui = $SelectorVarUI

func setData(_dataLine:Dictionary):
	advanced_selector_var_ui.setData(_dataLine)
	selector_var_ui.setData(_dataLine)
	if(_dataLine.has("values")):
		var theValues:Array = _dataLine["values"]
		if(theValues.size() >= 20):
			advanced_selector_var_ui.visible = true
			selector_var_ui.visible = false
		else:
			advanced_selector_var_ui.visible = false
			selector_var_ui.visible = true

func onEditorClose():
	advanced_selector_var_ui.onEditorClose()
	selector_var_ui.onEditorClose()

func _on_AdvancedSelectorVarUI_onValueChange(_id, newValue):
	triggerChange(newValue)
	selector_var_ui.setSelectedValue(newValue)

func _on_SelectorVarUI_onValueChange(_id, newValue):
	triggerChange(newValue)
	advanced_selector_var_ui.setSelectedValue(newValue)
