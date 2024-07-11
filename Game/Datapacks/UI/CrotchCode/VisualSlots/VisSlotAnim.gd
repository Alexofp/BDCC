extends VBoxContainer

onready var open_editor_button = $OpenEditorButton

var slotAnim
var editor

var animEditor = preload("res://Game/Datapacks/UI/CrotchCode/UI/AnimPickerWindow.tscn")

func _on_OpenEditorButton_pressed():
	var newWindow = animEditor.instance()
	
	add_child(newWindow)
	
	var finalCharAliases = {}
	for charID in editor.scene.chars:
		finalCharAliases[charID] = editor.scene.chars[charID]["realid"]
	
	newWindow.connect("onCancelPressed", self, "doHideEditor")
	newWindow.connect("onAnimSelected", self, "doSaveAnimData")
	newWindow.getPicker().allPossibleChars = ["pc"] + editor.scene.chars.keys()
	newWindow.getPicker().charAliases = finalCharAliases
	newWindow.getPicker().vars = editor.scene.vars.keys()
	newWindow.setAnimAndData(slotAnim.animID, slotAnim.animData)
	newWindow.popup_centered()

func doHideEditor(theEditor):
	theEditor.queue_free()
	
func doSaveAnimData(theEditor, animID, animData):
	theEditor.queue_free()
	
	slotAnim.animID = animID
	slotAnim.animData = animData
	updateBlock()

func setSlotAnim(theSlotVar):
	slotAnim = theSlotVar
	updateBlock()

func updateBlock():
	if(slotAnim == null):
		return
	
	open_editor_button.text = "ANIMATION: "+str(slotAnim.animID)

func makeExpand():
	size_flags_horizontal = SIZE_EXPAND_FILL
