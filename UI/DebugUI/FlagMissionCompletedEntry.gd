extends HBoxContainer

onready var check_box:CheckBox = $"%CheckBox"

var missionID:String = ""

signal onCheckboxChanged(missionID, completed)

func setMission(_missionID:String, _completed:bool):
	missionID = _missionID
	check_box.set_pressed_no_signal(_completed)

func _on_CheckBox_pressed():
	emit_signal("onCheckboxChanged", missionID, check_box.pressed)
