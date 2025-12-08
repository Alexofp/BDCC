extends PanelContainer

onready var label:Label = $HBoxContainer/Label

var storedEntry = null

signal onSelected(modEntry)

func setModEntry(modEntry):
	label.text = modEntry["name"]
	label.add_color_override("font_color",modEntry.get("color",Color("#ffffff")))
	if modEntry.get("isSeparator"):
		label.text = "-- "+label.text+" --"
		storedEntry = modEntry
		return
	if(modEntry["disabled"]):
		label.text += " (disabled)"
	if(modEntry.has("broken") && modEntry["broken"]):
		label.text = "(BROKEN) "+label.text
		label["custom_colors/font_color"] = Color.red
		
	storedEntry = modEntry


func _on_TextureButton_pressed():
	emit_signal("onSelected", storedEntry)

func makeActive():
	$Panel.visible = true

func makeInactive():
	$Panel.visible = false
