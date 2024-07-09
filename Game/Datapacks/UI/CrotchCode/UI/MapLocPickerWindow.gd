extends WindowDialog
onready var map_loc_picker_widget = $MapLocPickerWidget

signal onCancelPressed(window)
signal onCellSelected(window, newCell)

func getPicker():
	return map_loc_picker_widget

func _on_MapLocPickerWidget_onCancelPressed():
	emit_signal("onCancelPressed", self)

func _on_MapLocPickerWidget_onCellSelected(newCell):
	emit_signal("onCellSelected", self, newCell)

func setSelectedCell(newCell):
	map_loc_picker_widget.setSelectedCell(newCell)

func _on_MapLocPickerWindow_popup_hide():
	emit_signal("onCancelPressed", self)
