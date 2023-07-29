extends "res://Util/SexActivityCreator/ActionArgScenes/BaseActionArg.gd"

var strings = []

func _init():
	id = "strings"

func setData(_data):
	strings = _data
	updateStringsList()

func getData():
	return strings

func setText(_newText):
	$Label.text = _newText

func setOptions(_options):
	if(_options.has("value")):
		setData(_options["value"])

func updateStringsList():
	$FetishList.clear()
	for theString in strings:
		$FetishList.add_item(theString)

func _on_AddFetishButton_pressed():
	var fetishValue = $VBoxContainer/HBoxContainer2/LineEdit.text
	
	strings.append(fetishValue)
	updateStringsList()
	
	$VBoxContainer/HBoxContainer2/LineEdit.text = ""
	emitChanged()


func _on_RemoveFetishButton_pressed():
	if(!$FetishList.is_anything_selected()):
		return
	
	var selectedVarIndex = $FetishList.get_selected_items()[0]
	#var selectedVar = strings[selectedVarIndex]
	strings.remove(selectedVarIndex)
	updateStringsList()
	emitChanged()

func _on_LineEdit_text_entered(_new_text):
	_on_AddFetishButton_pressed()
