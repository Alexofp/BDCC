extends HBoxContainer

var id = ""
var data = null

signal onDownButton(id, data)
signal onUpButton(id, data)

func _on_DownButton_pressed():
	emit_signal("onDownButton", id, data)

func _on_UpButton_pressed():
	emit_signal("onUpButton", id, data)

func setText(theText):
	$Label.text = theText.replace("\n", " | ")
