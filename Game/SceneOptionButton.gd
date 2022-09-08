extends Button

class_name SceneOptionButton

var showingDescription 	= false
var description			= ""

signal pressedActually

func _ready():
	if (OPTIONS.shouldShowShortcuts()):
		$KeyLabel.visible = true
	else:
		$KeyLabel.visible = false

func setShortcutPhysicalScancode(code):
	var input_event_key = InputEventKey.new()
	input_event_key.physical_scancode = code
	
	shortcut = ShortCut.new()
	shortcut.shortcut = input_event_key
	
	$KeyLabel.text = OS.get_scancode_string(code)
	
	# Make a bit shorter version of this function
	# And you forget erase unused savedKey vairible!
	# KISS - Keep It Simple, Silly!.. Aaaaaaand clean code... too...

func _on_SceneOptionButton_pressed():
	if(OS.has_touchscreen_ui_hint() && OPTIONS.shouldRequireDoubleTapOnMobile()):
		if(!showingDescription):
			showingDescription = true
			emit_signal("mouse_entered")
		else:
			showingDescription = false
			emit_signal("pressedActually")
	else:
		emit_signal("pressedActually")

func _on_SceneOptionButton_focus_exited():
	showingDescription = false

func _on_SceneOptionButton_mouse_exited():
	showingDescription = false

#func _unhandled_input(event):
#	if(disabled):
#		return
#	if(event is InputEventKey):
#		if(event.pressed && event.physical_scancode == savedKey):
#			grab_click_focus()
#			grab_focus()
#			emit_signal("pressed")

