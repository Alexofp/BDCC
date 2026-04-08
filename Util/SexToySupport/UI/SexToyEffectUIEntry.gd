extends PanelContainer

onready var label_effect_name = $"%LabelEffectName"
onready var toy_group_option_button = $"%ToyGroupOptionButton"
onready var effect_type_option_button = $"%EffectTypeOptionButton"

onready var sequence_effect = $"%SequenceEffect"
onready var sequence_line_edit = $"%SequenceLineEdit"

onready var curve_effect = $"%CurveEffect"
onready var curve_editor = $"%CurveEditor"
onready var curve_duration_spin_box = $"%CurveDurationSpinBox"

var entry:SexToyEffectEntry

signal onDeleteButton(effect)

func _ready():
	for theGroup in SexToyGroup.ALL:
		var theGroupName:String = SexToyGroup.getName(theGroup)
		toy_group_option_button.add_item(theGroupName)
		
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
	
	toy_group_option_button.select(entry.group)
	effect_type_option_button.select(entry.type)
	
	sequence_effect.visible = (entry.type == SexToyEffect.SEQUENCE)
	curve_effect.visible = (entry.type == SexToyEffect.CURVE)
	if(entry.type == SexToyEffect.SEQUENCE):
		sequence_line_edit.text = var2str(entry.sequence).trim_prefix("[").trim_suffix("]")
	
	if(entry.type == SexToyEffect.CURVE):
		curve_editor.set_curve(entry.curve)
		curve_duration_spin_box.value = entry.curveTime
