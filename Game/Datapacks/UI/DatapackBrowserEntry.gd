extends PanelContainer

var id = ""
var index = -1
var storedEntry = null

signal onSelected(modEntry)

func setEntry(modEntry):
	$HBoxContainer/Label.text = modEntry["name"]+" [by "+modEntry["author"]+"]"
	storedEntry = modEntry

func _on_TextureButton_pressed():
	emit_signal("onSelected", storedEntry)

func makeActive():
	$Panel.visible = true

func makeInactive():
	$Panel.visible = false
