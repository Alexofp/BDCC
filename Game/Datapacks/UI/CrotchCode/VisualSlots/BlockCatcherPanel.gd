extends Control

var containedNode = null
signal onBlockDraggedOnto(data, index)
signal onRawValueChanged(newRaw)

var rawMode = 0
var rawValue = null
var rawPossibleValues = []
var extraMode = 0

var bigTextEditWindowScene = preload("res://Game/Datapacks/UI/CrotchCode/VisualSlots/CrotchBigTextEditWindow.tscn")
var currentBigWindow
onready var map_button = $MarginContainer/MapButton
onready var advanced_picker_button = $MarginContainer/AdvancedPickerButton
onready var flag_picker_button = $MarginContainer/FlagPickerButton

var dropIndex = -1

func can_drop_data(_position, _data):
	#setIsHighlighted(true)
	return true

func drop_data(_position, _data):
	emit_signal("onBlockDraggedOnto", _data, dropIndex)

func setIsHighlighted(isHigh):
	var borderS = 0
	if(isHigh):
		borderS = 4
	var theStyle:StyleBoxFlat = get_stylebox("panel")
	theStyle.border_width_left = borderS
	theStyle.border_width_right = borderS
	theStyle.border_width_top = borderS
	theStyle.border_width_bottom = borderS

func _ready():
	#var _ok = GlobalSignals.connect("onDragEnded", self, "onDragEnded")
	#var _ok2 = GlobalSignals.connect("onDragStarted", self, "onDragStarted")
	setRawMode(0)
	pass

func onDragEnded():
	setIsHighlighted(false)

func onDragStarted():
	setIsHighlighted(true)

func setContainedNode(theNode):
	if(containedNode != null):
		containedNode.queue_free()
		containedNode = null
	if(theNode != null):
		containedNode = theNode
		add_child(theNode)
	updateRawVis()

func setSideLabelsType(theType):
	$Label.text = CrotchBlocks.getLeftBracket(theType)
	$Label2.text = CrotchBlocks.getRightBracket(theType)

func setPlaceholder(thePlace):
	$MarginContainer/LineEdit.placeholder_text = thePlace
	$MarginContainer/SpinBox.hint_tooltip = thePlace
	$MarginContainer/OptionButton.hint_tooltip = thePlace

func setRawMode(theMode, newExtra=0):
	rawMode = theMode
	extraMode = newExtra
	updateRawVis()

func setRawPossibleValues(posVals:Array):
	rawPossibleValues = posVals.duplicate()
	#if(rawPossibleValues.size() > 0):
	#	rawValue = rawPossibleValues[0]
	#	emit_signal("onRawValueChanged", rawValue)
	updateRawVis()

func updateRawVis():
	$MarginContainer/SpinBox.visible = false
	$MarginContainer/LineEdit.visible = false
	$MarginContainer/OptionButton.visible = false
	$MarginContainer/BigTextEdit.visible = false
	map_button.visible = false
	flag_picker_button.visible = false
	advanced_picker_button.visible = false
	if(containedNode != null):
		$MarginContainer.visible = false
		return
	if(rawPossibleValues.size() > 0):
		if(extraMode == 3 || rawPossibleValues.size() > 20):
			$MarginContainer.visible = true
			advanced_picker_button.visible = true
			advanced_picker_button.text = str(rawValue)
			for value in rawPossibleValues:
				if(value is Array && value[0] == rawValue && value.size() > 1):
					advanced_picker_button.text = str(value[1])
		else:
			$MarginContainer.visible = true
			$MarginContainer/OptionButton.visible = true
			$MarginContainer/OptionButton.clear()
			var foundValue = false
			var _i = 0
			for value in rawPossibleValues:
				if(value is Array && value.size() > 1):
					$MarginContainer/OptionButton.add_item(str(value[1]))
				else:
					$MarginContainer/OptionButton.add_item(str(value))
				if((value is Array && value[0] == rawValue) || (!(value is Array) && value == rawValue)):
					$MarginContainer/OptionButton.select(_i)
					foundValue = true
				_i += 1
			if(!foundValue):
				$MarginContainer/OptionButton.add_item(str(rawValue))
				$MarginContainer/OptionButton.select(_i)
	elif(rawMode == CrotchVarType.ANY):
		$MarginContainer.visible = false
	elif(rawMode == CrotchVarType.NUMBER):
		$MarginContainer.visible = true
		$MarginContainer/SpinBox.visible = true
		if(rawValue != null):
			$MarginContainer/SpinBox.value = rawValue
		else:
			$MarginContainer/SpinBox.value = 0
	elif(rawMode == CrotchVarType.STRING):
		$MarginContainer.visible = true
		if(extraMode in [0, 3]):
			$MarginContainer/LineEdit.visible = true
			$MarginContainer/LineEdit.text = str(rawValue)
		elif(extraMode == 1):
			$MarginContainer/BigTextEdit.visible = true
			$MarginContainer/BigTextEdit/TextEdit.text = str(rawValue)
		elif(extraMode == 2):
			map_button.visible = true
			map_button.text = "ROOM="+str(rawValue)
		elif(extraMode == 4):
			flag_picker_button.visible = true
			flag_picker_button.text = ""+str(rawValue)

func getRawValue():
	return rawValue

func setRawValue(newVal):
	rawValue = newVal
	if(rawPossibleValues.size() > 0):
		var _i = 0
		for value in rawPossibleValues:
			if((value is Array && value[0] == newVal) || (!(value is Array) && value == newVal)):
				$MarginContainer/OptionButton.select(_i)
				if(value is Array):
					if(value.size() > 1):
						advanced_picker_button.text = str(value[1])
					else:
						advanced_picker_button.text = str(newVal)
			_i += 1
	if(rawMode == CrotchVarType.ANY):
		return
	if(rawMode == CrotchVarType.NUMBER):
		if(newVal == null):
			newVal = 0
			rawValue = 0
		$MarginContainer/SpinBox.value = newVal
	if(rawMode == CrotchVarType.STRING):
		if(newVal == null):
			newVal = ""
			rawValue = ""
		$MarginContainer/LineEdit.text = newVal
		$MarginContainer/BigTextEdit/TextEdit.text = newVal
		map_button.text = "ROOM="+str(newVal)
		advanced_picker_button.text = str(newVal)
		flag_picker_button.text = str(newVal)
	return null

func _on_SpinBox_value_changed(_value):
	if(rawMode == CrotchVarType.NUMBER):
		rawValue = _value
		emit_signal("onRawValueChanged", _value)

func _on_LineEdit_text_changed(new_text):
	if(rawMode == CrotchVarType.STRING):
		rawValue = new_text
		emit_signal("onRawValueChanged", new_text)

func _on_OptionButton_item_selected(index):
	if(index < 0 || index >= rawPossibleValues.size()):
		return
	if(rawPossibleValues.size() > 0):
		rawValue = rawPossibleValues[index]
		emit_signal("onRawValueChanged", rawPossibleValues[index])

func _on_TextEdit_text_changed():
	if(rawMode == CrotchVarType.STRING):
		rawValue = $MarginContainer/BigTextEdit/TextEdit.text
		emit_signal("onRawValueChanged", rawValue)


func _on_OpenFullButton_pressed():
	if(currentBigWindow != null):
		currentBigWindow.queue_free()
		currentBigWindow = null
	
	currentBigWindow = bigTextEditWindowScene.instance()
	add_child(currentBigWindow)
	
	currentBigWindow.setText($MarginContainer/BigTextEdit/TextEdit.text)
	currentBigWindow.connect("onCancel", self, "deleteBigWindow")
	currentBigWindow.connect("onSave", self, "replaceTextWithBigText")
	currentBigWindow.popup_centered()

func replaceTextWithBigText(_window, text):
	if(currentBigWindow != null):
		currentBigWindow.queue_free()
		currentBigWindow = null
	
	$MarginContainer/BigTextEdit/TextEdit.text = text
	rawValue = text
	emit_signal("onRawValueChanged", rawValue)

func deleteBigWindow(_window):
	if(currentBigWindow != null):
		currentBigWindow.queue_free()
		currentBigWindow = null

var mapLockerPickerWindowScene = preload("res://Game/Datapacks/UI/CrotchCode/UI/MapLocPickerWindow.tscn")
func _on_MapButton_pressed():
	var newWindow = mapLockerPickerWindowScene.instance()
	add_child(newWindow)
	newWindow.setSelectedCell(str(rawValue))
	newWindow.connect("onCancelPressed", self, "onMapButtonClosed")
	newWindow.connect("onCellSelected", self, "onMapButtonCellSelected")
	
	newWindow.popup_centered()

func onMapButtonClosed(window):
	window.queue_free()

func onMapButtonCellSelected(window, cell):
	window.queue_free()
	rawValue = cell
	map_button.text = "ROOM="+str(rawValue)
	emit_signal("onRawValueChanged", rawValue)

var advPickerScene = preload("res://Game/Datapacks/UI/CrotchCode/UI/AdvancedPickingWindow.tscn")
func _on_AdvancedPickerButton_pressed():
	var newWindow = advPickerScene.instance()
	add_child(newWindow)
	newWindow.setData({
		value = rawValue,
		values = rawPossibleValues,
	})
	newWindow.connect("onCancel", self, "onMapButtonClosed")
	newWindow.connect("onConfirm", self, "onAdvPickerConfirmPressed")
	newWindow.popup_centered()

func onAdvPickerConfirmPressed(window, value):
	window.queue_free()
	rawValue = value
	advanced_picker_button.text = str(rawValue)
	for value in rawPossibleValues:
		if(value is Array && value[0] == rawValue && value.size() > 1):
			advanced_picker_button.text = str(value[1])
	emit_signal("onRawValueChanged", rawValue)


var flagPickerScene = preload("res://Game/Datapacks/UI/CrotchCode/UI/FlagPickerWindow.tscn")
func _on_FlagPickerButton_pressed():
	var newWindow = flagPickerScene.instance()
	add_child(newWindow)
	newWindow.setFlag(str(rawValue))
	newWindow.connect("onCancelPressed", self, "onMapButtonClosed")
	newWindow.connect("onFlagSelected", self, "onFlagSelected")
	
	newWindow.popup_centered()

func onFlagSelected(window, newFlag):
	window.queue_free()
	rawValue = newFlag
	flag_picker_button.text = ""+str(rawValue)
	emit_signal("onRawValueChanged", rawValue)
