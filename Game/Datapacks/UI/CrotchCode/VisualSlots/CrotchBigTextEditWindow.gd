extends WindowDialog

signal onCancel(window)
signal onSave(window, text)

func setText(theText):
	$MarginContainer/VBoxContainer/TextEdit.text = theText

func _on_CancelButton_pressed():
	hide()
	emit_signal("onCancel", self)


func _on_CrotchBigTextEditWindow_popup_hide():
	hide()
	emit_signal("onCancel", self)

func _on_SaveButton_pressed():
	hide()
	emit_signal("onSave", self, $MarginContainer/VBoxContainer/TextEdit.text)
