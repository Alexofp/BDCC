extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var isEditing = false
var thePrefix = ""
var instantSet = false
var alwaysEdit:bool = false

var values = []
var selectedValue = null

func _ready():
	setIsEditing(false)

func setIsEditing(newEdit):
	isEditing = newEdit
	
	if(newEdit || alwaysEdit):
		$OptionButton.visible = true
		$Button.text = "Save"
		if(!alwaysEdit):
			$Label.visible = false
			$Label2.visible = false
			$Button.visible = true
			#$Label.size_flags_horizontal = SIZE_EXPAND_FILL
		else:
			$Label.visible = false
			$Label2.visible = true
			$Button.visible = false
			#$Label.size_flags_horizontal = SIZE_FILL
	else:
		$OptionButton.visible = false
		$Label.visible = true
		$Label2.visible = false
		$Button.text = "Edit"

func setSelectedValue(_value):
	selectedValue = _value
	updateValues()
	#$SpinBox.value = _value
	var valueText = str(selectedValue)
	for value in values:
		if(value is Array && value.size() > 1):
			if(selectedValue != null && value[0] == selectedValue):
				valueText = str(value[1])

	$Label.text = thePrefix+(" = " if thePrefix != "" else "") + str(valueText)

func setData(_dataLine:Dictionary):
	if(_dataLine.has("name")):
		thePrefix = _dataLine["name"]
		$Label2.text = thePrefix
	if(_dataLine.has("instantSet")):
		instantSet = _dataLine["instantSet"]
	if(_dataLine.has("values")):
		values = _dataLine["values"]
	if(_dataLine.has("alwaysEdit")):
		alwaysEdit = _dataLine["alwaysEdit"]
		setIsEditing(isEditing)
	if(_dataLine.has("expand")):
		if(_dataLine["expand"]):
			$OptionButton.size_flags_horizontal = SIZE_EXPAND_FILL
		else:
			$OptionButton.size_flags_horizontal = SIZE_FILL
	if(_dataLine.has("value")):
		setSelectedValue(_dataLine["value"])
	else:
		updateValues()

func updateValues():
	$OptionButton.clear()
	var _i = 0
	for value in values:
		if(value is Array && value.size() > 1):
			$OptionButton.add_item(value[1])
			if(selectedValue != null && value[0] == selectedValue):
				$OptionButton.select(_i)
		else:
			$OptionButton.add_item(str(value))
			if(selectedValue != null && value == selectedValue):
				$OptionButton.select(_i)
		_i += 1
		
func _on_Button_pressed():
	if(isEditing):
		var selectedIndex = $OptionButton.selected
		if(selectedIndex >= 0):
			var selVal = values[selectedIndex]
			if(selVal is Array):
				setSelectedValue(selVal[0])
			else:
				setSelectedValue(selVal)
		
		triggerChange(selectedValue)
		
		setIsEditing(false)
	else:
		setIsEditing(true)

func onEditorClose():
	if(isEditing):
		_on_Button_pressed()


func _on_OptionButton_item_selected(index):
	if(!instantSet && !alwaysEdit):
		return
	if(index < 0 || index >= values.size()):
		return
	
	var selVal = values[index]
	if(selVal is Array):
		selVal = selVal[0]
	
	selectedValue = selVal
	triggerChange(selVal)
