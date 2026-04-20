extends PanelContainer

onready var label_effect_name = $"%LabelEffectName"
onready var effect_type_option_button = $"%EffectTypeOptionButton"

onready var sequence_effect = $"%SequenceEffect"
onready var sequence_line_edit = $"%SequenceLineEdit"

onready var curve_effect = $"%CurveEffect"
onready var curve_editor = $"%CurveEditor"
onready var curve_duration_spin_box = $"%CurveDurationSpinBox"
onready var toy_group_checkboxes = $"%ToyGroupCheckboxes"

onready var simple_effect = $"%SimpleEffect"
onready var intensity_label = $"%IntensityLabel"
onready var intensity_slider = $"%IntensitySlider"
onready var time_label = $"%TimeLabel"
onready var time_slider = $"%TimeSlider"


var entry:SexToyEffectEntry

var groupCheckboxes:Array

signal onDeleteButton(effect)

func _ready():
	Util.delete_children(toy_group_checkboxes)
	for theGroup in SexToyGroup.ALL:
		var theGroupName:String = SexToyGroup.getName(theGroup)
		var newCheckbox := CheckBox.new()
		newCheckbox.text = theGroupName
		toy_group_checkboxes.add_child(newCheckbox)
		groupCheckboxes.append(newCheckbox)
		newCheckbox.connect("pressed", self, "onToyGroupToggle", [newCheckbox, theGroup])
		#toy_group_option_button.add_item(theGroupName)
		
	effect_type_option_button.add_item("Vibrate (Simple)")
	effect_type_option_button.add_item("Vibrate (Sequence)")
	effect_type_option_button.add_item("Vibrate (Curve)")

func setEntry(_indx:int, _entry:SexToyEffectEntry):
	label_effect_name.text = "Effect #"+str(_indx)
	entry = _entry
	updateUI()

func _on_DeleteEffectButton_pressed():
	emit_signal("onDeleteButton", entry)

func updateUI():
	if(!entry):
		return
	
	#toy_group_option_button.select(entry.group)
	#print(entry.groups)
	for _i in groupCheckboxes.size():
		groupCheckboxes[_i].set_pressed_no_signal(entry.groups.has(_i))
	effect_type_option_button.select(entry.type)
	
	sequence_effect.visible = (entry.type == SexToyEffect.SEQUENCE)
	curve_effect.visible = (entry.type == SexToyEffect.CURVE)
	simple_effect.visible = (entry.type == SexToyEffect.SIMPLE)
	
	if(entry.type == SexToyEffect.SEQUENCE):
		sequence_line_edit.text = var2str(entry.sequence).trim_prefix("[").trim_suffix("]")
	
	if(entry.type == SexToyEffect.CURVE):
		curve_editor.set_curve(entry.curve)
		curve_duration_spin_box.value = entry.curveTime
	
	if(entry.type == SexToyEffect.SIMPLE):
		var theValue:Vector2 = entry.getSimple()
		intensity_slider.value = theValue.x
		time_slider.value = theValue.y
		updateSimpleEffectText()

func updateSimpleEffectText():
	if(entry.type != SexToyEffect.SIMPLE):
		return
	var theValue:Vector2 = entry.getSimple()
	var intensityText:String = str(Util.roundF(theValue.x*100.0))+"%"
	var timeText:String = str(Util.roundF(theValue.y, 1))
	
	intensity_label.text = "Intensity "+intensityText
	time_label.text = "For "+timeText+" seconds"

func _on_EffectTypeOptionButton_item_selected(_index:int):
	entry.type = _index
	
	if(entry.type == SexToyEffect.CURVE):
		if(entry.curve == null):
			entry.curve = preload("res://Util/SexToySupport/Util/DefaultCurve.tres").duplicate(true)
	
	updateUI()

func onToyGroupToggle(_checkBox:CheckBox, _group:int):
	if(_checkBox.pressed):
		entry.groups.append(_group)
	else:
		entry.groups.erase(_group)

func _on_IntensitySlider_value_changed(value:float):
	if(entry.type != SexToyEffect.SIMPLE):
		return
	var theValue:Vector2 = entry.getSimple()
	entry.setSimple(value, theValue.y)
	updateSimpleEffectText()

func _on_TimeSlider_value_changed(value:float):
	if(entry.type != SexToyEffect.SIMPLE):
		return
	var theValue:Vector2 = entry.getSimple()
	entry.setSimple(theValue.x, value)
	updateSimpleEffectText()

func _on_SequenceLineEdit_text_changed(_new_text:String):
	var didFail:bool = false
	var theArStr:String = "["+sequence_line_edit.text+"]"
	var theJsonRes := JSON.parse(theArStr)
	if(!theJsonRes || theJsonRes.error != OK):
		didFail = true
	else:
		var theVal = theJsonRes.result
		if(!(theVal is Array)):
			didFail = true
		elif(theVal.size() % 2 != 0):
			didFail = true
		else:
			for theNum in theVal:
				if(!(theNum is float)):
					didFail = true
					break
		
		if(!didFail):
			entry.sequence = theVal
		
	if(didFail):
		sequence_line_edit["custom_colors/font_color"] = Color.red
	else:
		sequence_line_edit["custom_colors/font_color"] = Color.white

func _on_TestEffectButton_pressed():
	entry.trigger(100, false)

func _on_CurveDurationSpinBox_value_changed(value:float):
	entry.curveTime = value
