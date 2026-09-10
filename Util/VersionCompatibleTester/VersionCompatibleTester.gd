extends Control

onready var our_line_edit = $VBoxContainer/OurLineEdit
onready var input_line_edit = $VBoxContainer/InputLineEdit
onready var label = $VBoxContainer/Label

func _ready():
	our_line_edit.text = GlobalRegistry.getGameVersionStringNoSuffix()
	
	updateTest()

func updateTest():
	var _ourText:String = our_line_edit.text
	var _inputText:String = input_line_edit.text
	
	if(Util.isVersionCompatible(_ourText, _inputText)):
		label.text = "COMPATIBLE!"
	else:
		label.text = " NOT COMPATIBLE"

func _on_OurLineEdit_text_changed(_new_text):
	updateTest()

func _on_InputLineEdit_text_changed(_new_text):
	updateTest()
