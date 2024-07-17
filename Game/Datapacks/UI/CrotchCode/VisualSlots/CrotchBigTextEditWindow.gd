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

var spellCheckerWindowScene = preload("res://Util/SpellChecker/SpellCheckerWindow.tscn")

func _on_SpellCheckerButton_pressed():
	var theWindow = spellCheckerWindowScene.instance()
	add_child(theWindow)
	
	theWindow.popup_centered()
	theWindow.setText($MarginContainer/VBoxContainer/TextEdit.text)
	theWindow.connect("onCancel", self, "onSpellCheckerCancel")
	theWindow.connect("onTextSubmit", self, "onSpellCheckerSubmit")

func onSpellCheckerCancel(window):
	window.queue_free()

func onSpellCheckerSubmit(window, text):
	window.queue_free()
	$MarginContainer/VBoxContainer/TextEdit.text = text
