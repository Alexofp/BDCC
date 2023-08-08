extends "res://Util/SexActivityCreator/ActionArgScenes/BaseActionArg.gd"

func _init():
	id = "bigstring"

func setData(_data):
	$VBoxContainer/TextEdit.text = _data

func getData():
	return $VBoxContainer/TextEdit.text

func setText(_newText):
	$VBoxContainer/Label.text = _newText

func setOptions(_options):
	if(_options.has("value")):
		setData(_options["value"])

func _on_TextEdit_text_changed():
	emitChanged()
