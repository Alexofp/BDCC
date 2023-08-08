extends "res://Util/SexActivityCreator/ActionArgScenes/BaseActionArg.gd"

var values = []

func _init():
	id = "dropdown"

func setData(_data):
	var index = 0
	for value in values:
		if(value is Array):
			if(value[0] == _data):
				$VBoxContainer/OptionButton.selected = index
				return
		else:
			if(value == _data):
				$VBoxContainer/OptionButton.selected = index
				return
		
		index += 1

func getData():
	if($VBoxContainer/OptionButton.selected < 0):
		if(values.size() == 0):
			return null
		else:
			if(values[0] is Array):
				return values[0][0]
			return values[0]
	
	if(values[$VBoxContainer/OptionButton.selected] is Array):
		return values[$VBoxContainer/OptionButton.selected][0]
	else:
		return values[$VBoxContainer/OptionButton.selected]

func setText(_newText):
	$VBoxContainer/Label.text = _newText

func setOptions(_options):
	if(_options.has("values")):
		values = _options["values"]
		updateList()
	if(_options.has("value")):
		setData(_options["value"])

func _on_TextEdit_text_changed(_new_text):
	emitChanged()

func updateList():
	$VBoxContainer/OptionButton.clear()
	for value in values:
		if(value is Array):
			$VBoxContainer/OptionButton.add_item(str(value[1]))
		else:
			$VBoxContainer/OptionButton.add_item(str(value))
