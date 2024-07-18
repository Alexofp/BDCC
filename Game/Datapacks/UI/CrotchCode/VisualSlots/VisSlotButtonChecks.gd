extends VBoxContainer

onready var open_editor_button = $OpenEditorButton

var slotButtonChecks
var editor

var buttonChecksEditor = preload("res://Game/Datapacks/UI/CrotchCode/UI/ButtonChecksEditorWindow.tscn")

func _on_OpenEditorButton_pressed():
	var newWindow = buttonChecksEditor.instance()
	
	add_child(newWindow)
	
	newWindow.setChecks(slotButtonChecks.checks)
	newWindow.connect("onCancel", self, "doHideEditor")
	newWindow.connect("onConfirm", self, "doSaveButtonChecks")

	newWindow.popup_centered()

func doHideEditor(theEditor):
	theEditor.queue_free()
	
func doSaveButtonChecks(theEditor, checks):
	theEditor.queue_free()
	
	slotButtonChecks.checks = checks
	updateBlock()

func setSlotButtonChecks(theSlotVar):
	slotButtonChecks = theSlotVar
	updateBlock()

func updateBlock():
	if(slotButtonChecks == null):
		return
	
	open_editor_button.text = "CHECKS ("+str(slotButtonChecks.checks.size())+")"

func makeExpand():
	size_flags_horizontal = SIZE_EXPAND_FILL
