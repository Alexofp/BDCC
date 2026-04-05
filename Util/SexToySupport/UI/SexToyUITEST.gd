extends Control

const TestCurve:Curve =  preload("res://Util/SexToySupport/Util/TestCurve.tres")

func _ready():
	$CurveEditorCustom._curve = TestCurve

func _on_VibButton_pressed():
#	SexToyManager.getGroup(SexToyGroup.Main).vibratePattern([
#		0.3, 0.3,
#		0.4, 0.3,
#		0.5, 0.3,
#		0.6, 0.3,
#		0.7, 0.3,
#		0.8, 0.3,
#		0.9, 0.3,
#		1.0, 0.3,
#	])
	SexToyManager.getGroup(SexToyGroup.Main).vibrateCurve(TestCurve, 5.0)
	
	pass

func _on_StopButton_pressed():
	#SexToyManager.triggerVibrateAllToys(0.0)
	SexToyManager.getGroup(SexToyGroup.Main).vibrateSimple(0.0, 1.0)
