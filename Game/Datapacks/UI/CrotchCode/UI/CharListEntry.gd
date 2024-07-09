extends HBoxContainer

signal onCharEdit(charAlias, entry)
signal onDeletePressed(charAlias)
signal onAliasChange(oldAlias, newAlias)
onready var name_label = $NameLabel
onready var alias_var_ui = $AliasVarUI
onready var starts_check_box = $StartsCheckBox
onready var variant_var_ui = $VariantVarUI

var charAlias = "rahi"
var entry = {
	realid = "rahi",
	start = true,
	variant = "", #"naked"
}


func _on_DeleteButton_pressed():
	emit_signal("onDeletePressed", charAlias)
	
func setEntry(theCharName, theEntry):
	charAlias = theCharName
	entry = theEntry.duplicate()
	
	name_label.text = "Full id: "+entry["realid"]
	
	alias_var_ui.setData({
		name = "Alias",
		value = charAlias,
	})
	
	starts_check_box.set_pressed_no_signal(entry["start"])
	
	variant_var_ui.setData({
		name = "Variant",
		value = entry["variant"],
	})

func _on_AliasVarUI_onValueChange(_id, newValue):
	var oldAlias = charAlias
	charAlias = newValue

	emit_signal("onAliasChange", oldAlias, charAlias)

func _on_StartsCheckBox_toggled(button_pressed):
	entry["start"] = button_pressed
	
	emit_signal("onCharEdit", charAlias, entry.duplicate())

func _on_VariantVarUI_onValueChange(_id, newValue):
	entry["variant"] = newValue
	
	emit_signal("onCharEdit", charAlias, entry.duplicate())
