extends "res://Util/SexActivityCreator/ActionArgScenes/BaseActionArg.gd"

func _init():
	id = "bigstring"

func getData():
	return $VBoxContainer/TextEdit.text

func setText(_newText):
	$VBoxContainer/Label.text = _newText

func setOptions(_options):
	if(_options.has("value")):
		$VBoxContainer/TextEdit.text = _options["value"]
