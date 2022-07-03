extends Button

var savedKey = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	if(OPTIONS.shouldShowShortcuts()):
		$KeyLabel.visible = true
	else:
		$KeyLabel.visible = false

func setShortcutPhysicalScancode(code):
	var newShortcut = ShortCut.new()
	var inputKey = InputEventKey.new()
	inputKey.physical_scancode = code
	newShortcut.shortcut = inputKey
	shortcut = newShortcut

	$KeyLabel.text = OS.get_scancode_string(code)
	savedKey = code

#func _unhandled_input(event):
#	if(disabled):
#		return
#	if(event is InputEventKey):
#		if(event.pressed && event.physical_scancode == savedKey):
#			grab_click_focus()
#			grab_focus()
#			emit_signal("pressed")
