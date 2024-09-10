extends WindowDialog

signal onCancel(window)
signal onSave(window, text)
onready var text_edit = $MarginContainer/VBoxContainer/TextEdit
onready var tag_fast_picker = $MarginContainer/VBoxContainer/HBoxContainer2/TagFastPicker
onready var color_picker_button = $MarginContainer/VBoxContainer/HBoxContainer2/PanelContainer/HBoxContainer/ColorPickerButton

const tags = [
	"Add tag..",
	"{pc.name}",
	"{pc.heShe}",
	"{pc.hisHer}",
	"{pc.himHer}",
	"{pc.isAre}",
	"{pc.has}",
	"{pc.himself}",
	"{pc.verb('take')}",
	"{pc.penis}",
	"{pc.breasts}",
	"{pc.thick}",
	"{pc.masc}",
	"{pc.analStretch}",
	"{pc.pussyStretch}",
	"{pc.throatStretch}",
]

func _ready():
	tag_fast_picker.clear()
	for theTag in tags:
		tag_fast_picker.add_item(theTag)

func setText(theText):
	text_edit.text = theText

func _on_CancelButton_pressed():
	hide()
	emit_signal("onCancel", self)


func _on_CrotchBigTextEditWindow_popup_hide():
	hide()
	emit_signal("onCancel", self)

func _on_SaveButton_pressed():
	hide()
	emit_signal("onSave", self, text_edit.text)

var spellCheckerWindowScene = preload("res://Util/SpellChecker/SpellCheckerWindow.tscn")

func _on_SpellCheckerButton_pressed():
	var theWindow = spellCheckerWindowScene.instance()
	add_child(theWindow)
	
	theWindow.popup_centered()
	theWindow.setText(text_edit.text)
	theWindow.connect("onCancel", self, "onSpellCheckerCancel")
	theWindow.connect("onTextSubmit", self, "onSpellCheckerSubmit")

func onSpellCheckerCancel(window):
	window.queue_free()

func onSpellCheckerSubmit(window, text):
	window.queue_free()
	text_edit.text = text

var fromcol = 0
var fromline = 0
var tocol = 0
var toline = 0
func addTagsAroundText(leftTag:String, rightTag:String):
	if(fromcol < 0):
		text_edit.insert_text_at_cursor(leftTag)
		var savedCol = text_edit.cursor_get_column()
		text_edit.insert_text_at_cursor(rightTag)
		text_edit.cursor_set_column(savedCol)
		text_edit.grab_focus()
		return
	#print(fromline, " ", fromcol, " ", toline, " ", tocol," ",text_edit.selecting_enabled)
	#text_edit.select(toline, tocol, toline, tocol)
	text_edit.cursor_set_column(0)
	text_edit.cursor_set_line(toline)
	text_edit.cursor_set_column(tocol)
	text_edit.insert_text_at_cursor(rightTag)
	
	text_edit.cursor_set_column(0)
	text_edit.cursor_set_line(fromline)
	text_edit.cursor_set_column(fromcol)
	text_edit.insert_text_at_cursor(leftTag)
	text_edit.grab_focus()

func _on_BoldButton_pressed():
	addTagsAroundText("[b]", "[/b]")

func _on_ItalicsButton_pressed():
	addTagsAroundText("[i]", "[/i]")


func _on_TextEdit_cursor_changed():
	if( text_edit.is_selection_active() && text_edit.get_selection_from_column() >= 0):
		fromcol = text_edit.get_selection_from_column()
		fromline = text_edit.get_selection_from_line()
		tocol = text_edit.get_selection_to_column()
		toline = text_edit.get_selection_to_line()
		#print(fromline, " ", fromcol, " ", toline, " ", tocol)
	else:
		fromcol = -1
		fromline = -1
		tocol = -1
		toline = -1


func _on_SayButton_pressed():
	text_edit.cursor_set_column(0)
	text_edit.insert_text_at_cursor("=npcAlias: ")
	text_edit.cursor_set_column(1)
	text_edit.select(text_edit.cursor_get_line(), 1, text_edit.cursor_get_line(), 9)
	text_edit.grab_focus()


func _on_VarButton_pressed():
	text_edit.insert_text_at_cursor("{{")
	var column = text_edit.cursor_get_column()
	text_edit.insert_text_at_cursor("var}}")
	text_edit.cursor_set_column(column)
	text_edit.select(text_edit.cursor_get_line(), column, text_edit.cursor_get_line(), column+3)
	text_edit.grab_focus()


func _on_IfVarButton_pressed():
	text_edit.insert_text_at_cursor("{{\"text 1\" if ")
	var column = text_edit.cursor_get_column()
	text_edit.insert_text_at_cursor("var else \"text 2\"}}")
	text_edit.cursor_set_column(column)
	text_edit.select(text_edit.cursor_get_line(), column, text_edit.cursor_get_line(), column+3)
	text_edit.grab_focus()


func _on_TagFastPicker_item_selected(index):
	tag_fast_picker.select(0)
	
	if(index <= 0 || index >= tags.size()):
		return
	
	var theText:String = tags[index]
	yield(get_tree(), "idle_frame")
	#var column = text_edit.cursor_get_column()
	text_edit.insert_text_at_cursor(theText)
	#text_edit.cursor_set_column(column + 1)
	#text_edit.select(text_edit.cursor_get_line(), column + 1, text_edit.cursor_get_line(), column+3)
	text_edit.grab_focus()


func _on_AddColorButton_pressed():
	var color:Color = color_picker_button.color
	addTagsAroundText("[color=#"+color.to_html(false)+"]", "[/color]")
