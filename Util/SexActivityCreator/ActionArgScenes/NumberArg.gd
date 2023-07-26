extends "res://Util/SexActivityCreator/ActionArgScenes/BaseActionArg.gd"

func _init():
	id = "number"

func setData(_data):
	$VBoxContainer/SpinBox.value = _data

func getData():
	return $VBoxContainer/SpinBox.value

func setText(_newText):
	$VBoxContainer/Label.text = _newText

func setOptions(_options):
	if(_options.has("value")):
		setData(_options["value"])
	if(_options.has("float") && _options["float"]):
		$VBoxContainer/SpinBox.step = 0.01

func _on_SpinBox_value_changed(_value):
	emitChanged()
