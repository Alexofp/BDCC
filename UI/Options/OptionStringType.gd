extends HBoxContainer

signal value_changed(categoryID, id, newvalue)

var id
var categoryID
var description

func setOptionName(newname):
	$Label.text = newname

func getOptionName():
	return $Label.text

func setOptionValue(_newvalue):
	$LineEdit.text = _newvalue

func setPlaceholderValue(placeHolderValue):
	$LineEdit.placeholder_text = placeHolderValue

func setDescription(newdesc):
	description = newdesc

func getDescription():
	return description

func _on_LineEdit_text_changed(new_text):
	emit_signal("value_changed", categoryID, id, new_text)
