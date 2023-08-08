extends HBoxContainer

var id = ""
var data = null

signal onEditButton(id, data)
signal onDeleteButton(id, data)
signal onDownButton(id, data)
signal onUpButton(id, data)

func _on_EditButton_pressed():
	emit_signal("onEditButton", id, data)

func _on_DeleteButton_pressed():
	emit_signal("onDeleteButton", id, data)

func _on_DownButton_pressed():
	emit_signal("onDownButton", id, data)

func _on_UpButton_pressed():
	emit_signal("onUpButton", id, data)

func setText(theText):
	$Label.text = theText.replace("\n", " | ")
