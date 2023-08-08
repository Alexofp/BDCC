extends VBoxContainer

var data = {}
var id = 0
signal onDeletePressed(id)
signal onUpPressed(id)

func _ready():
	data = {
		"condition": "",
		"animData": $StageSceneAnimPicker.data,
	}
	setData(data)

func setData(_data):
	data = _data
	updateFromData()

func updateFromData():
	$VBoxContainer/LineEdit.text = data["condition"]
	$StageSceneAnimPicker.setData(data["animData"])

func _on_DeleteButton_pressed():
	emit_signal("onDeletePressed", id)

func _on_LineEdit_text_changed(new_text):
	data["condition"] = new_text

func _on_UpButton_pressed():
	emit_signal("onUpPressed", id)
