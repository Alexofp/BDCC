extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var isEditing = false
var thePrefix = ""

func _ready():
	setIsEditing(false)

func setIsEditing(newEdit):
	isEditing = newEdit
	
	if(newEdit):
		$SpinBox.visible = true
		$Label.visible = false
		$Button.text = "Save"
	else:
		$SpinBox.visible = false
		$Label.visible = true
		$Button.text = "Edit"

func setVarNumber(_value):
	$SpinBox.value = _value
	$Label.text = thePrefix+(" = " if thePrefix != "" else "") + str(_value)

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		thePrefix = _dataLine["name"]
	if(_dataLine.has("step")):
		$SpinBox.step = _dataLine["step"]
	if(_dataLine.has("int") && _dataLine["int"]):
		$SpinBox.step = 1
		$SpinBox.rounded = true
	if(_dataLine.has("value")):
		setVarNumber(_dataLine["value"])

func _on_Button_pressed():
	if(isEditing):
		var newValue = $SpinBox.value
		setVarNumber(newValue)
		
		triggerChange(newValue)
		
		setIsEditing(false)
	else:
		setIsEditing(true)

func onEditorClose():
	if(isEditing):
		_on_Button_pressed()
