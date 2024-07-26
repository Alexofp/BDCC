extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"
onready var label = $Label
onready var button = $Button
onready var label_2 = $Label2

var advPickerScene = preload("res://Game/Datapacks/UI/CrotchCode/UI/AdvancedPickingWindow.tscn")


var isAltText = false
var values = []
var selectedValue
var savedName = "Selector"

func setSelectedValue(theVal):
	selectedValue = theVal
	
	for value in values:
		if(value is Array && value[0] == selectedValue):
			if(isAltText):
				label_2.text = savedName+" = "+str(value[1])
				label.text = ""
				button.text = "Edit"
				label_2.visible = true
				label.visible = false
			else:
				label.text = savedName
				label_2.text = ""
				button.text = value[1]
				label_2.visible = false
				label.visible = true
			return
	
	if(isAltText):
		label_2.text = savedName+" = "+str(selectedValue)
		label.text = ""
		button.text = "Edit"
		label_2.visible = true
		label.visible = false
	else:
		label.text = savedName
		label_2.text = ""
		button.text = str(selectedValue)
		label_2.visible = false
		label.visible = true

func setData(_dataLine:Dictionary):
	if(_dataLine.has("isAltText")):
		isAltText = _dataLine["isAltText"]
	if(_dataLine.has("name")):
		savedName = _dataLine["name"]
	if(_dataLine.has("values")):
		values = _dataLine["values"]
	if(_dataLine.has("value")):
		setSelectedValue(_dataLine["value"])
	if(_dataLine.has("noexpand") && _dataLine["noexpand"]):
		button.size_flags_horizontal = SIZE_FILL

func _on_Button_pressed():
	if(values.size() <= 0):
		return
	var newWindow = advPickerScene.instance()
	add_child(newWindow)
	newWindow.setData({
		value = selectedValue,
		values = values,
	})
	newWindow.connect("onCancel", self, "onAdvPickerCancel")
	newWindow.connect("onConfirm", self, "onAdvPickerConfirmPressed")
	newWindow.popup_centered()

func onAdvPickerCancel(window):
	window.queue_free()

func onAdvPickerConfirmPressed(window, value):
	window.queue_free()
	setSelectedValue(value)
	triggerChange(selectedValue)
