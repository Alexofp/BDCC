extends PanelContainer

var storedEntry = null

signal onSelected(modEntry)

func setModEntry(modEntry):
	$HBoxContainer/Label.text = modEntry["name"]
	if(modEntry["disabled"]):
		$HBoxContainer/Label.text += " (disabled)"
	storedEntry = modEntry


func _on_TextureButton_pressed():
	emit_signal("onSelected", storedEntry)

func makeActive():
	$Panel.visible = true

func makeInactive():
	$Panel.visible = false
