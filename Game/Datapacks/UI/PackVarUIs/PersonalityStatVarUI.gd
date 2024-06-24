extends "res://Game/Datapacks/UI/PackVarUIs/PackVarUIBase.gd"

var personalityStat = PersonalityStat.Brat
onready var h_slider = $HSlider

func setSliderValue(_value):
	h_slider.value = _value
	updateStatInfo()

func updateStatInfo():
	var curVal = h_slider.value
	#var theStatInfo = PersonalityStat.getVisibleDesc(personalityStat, curVal)
	$Label4.text = str(Util.roundF(curVal*100, 1))+"%"

func setData(_dataLine:Dictionary):
	#if(_dataLine.has("name")):
	#	$Label.text = _dataLine["name"]
	if(_dataLine.has("personalityStat")):
		personalityStat = _dataLine["personalityStat"]
		$Label.text = PersonalityStat.getVisibleName(personalityStat)
		$Label3.text = PersonalityStat.getVisibleDesc(personalityStat, -1.0)
		$Label2.text = PersonalityStat.getVisibleDesc(personalityStat, 1.0)
	if(_dataLine.has("value")):
		setSliderValue(_dataLine["value"])

func _on_HSlider_value_changed(_value):
	updateStatInfo()
	
func _on_HSlider_drag_ended(value_changed):
	if(value_changed):
		triggerChange(h_slider.value)
