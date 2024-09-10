extends WindowDialog

signal onCancelPressed(window)
signal onAnimSelected(window, animID, animData)
onready var anim_picker_widget = $AnimPickerWidget

func getPicker():
	return anim_picker_widget

func setAnimAndData(animID, animData):
	anim_picker_widget.setSelectedAnim(animID, animData)

func _on_AnimPickerWindow_popup_hide():
	emit_signal("onCancelPressed", self)

func _on_AnimPickerWidget_onCancelPressed():
	emit_signal("onCancelPressed", self)

func _on_AnimPickerWidget_onAnimSelected(animID, animData):
	emit_signal("onAnimSelected", self, animID, animData)
