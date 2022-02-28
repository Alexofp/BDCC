extends HBoxContainer

var saveFile = ""
onready var saveNameLabel = $SaveNameLabel
signal onLoadButtonPressed(saveFile)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setSaveFile(path):
	saveFile = path
	
	saveNameLabel.text = saveFile

func _on_LoadButton_pressed():
	emit_signal("onLoadButtonPressed", saveFile)
