extends HBoxContainer

var group:int = -1

onready var override_check_box = $"%OverrideCheckBox"
onready var value_h_slider = $"%ValueHSlider"

func setGroup(_g:int):
	group = _g
	override_check_box.text = SexToyGroup.getNameShort(group)

func _on_OverrideCheckBox_pressed():
	updateOverride()

func _on_ValueHSlider_value_changed(_value:float):
	updateOverride()

func updateOverride():
	var theGroup:SexToyGroupInstance = SexToyManager.getGroup(group)
	if(!theGroup):
		return
	theGroup.setOverride(override_check_box.pressed, value_h_slider.value)

func _exit_tree():
	var theGroup:SexToyGroupInstance = SexToyManager.getGroup(group)
	if(!theGroup):
		return
	theGroup.setOverride(false, 0.0)
