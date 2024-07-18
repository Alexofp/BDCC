extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"
onready var label = $Label
onready var button = $Button
var advPickerScene = preload("res://Game/Datapacks/UI/CrotchCode/UI/AdvancedPickingWindow.tscn")

var values = []
var selectedValue

func setSelectedValue(theVal):
	selectedValue = theVal
	
	for value in values:
		if(value is Array && value[0] == selectedValue):
			button.text = value[1]
			return
	
	button.text = str(selectedValue)

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		label.text = _dataLine["name"]
	if(_dataLine.has("values")):
		values = _dataLine["values"]
	if(_dataLine.has("value")):
		setSelectedValue(_dataLine["value"])

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
