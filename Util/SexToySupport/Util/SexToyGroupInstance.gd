extends Reference
class_name SexToyGroupInstance

# https://github.com/JtotheThree/godot_curve_editor
# Would be nice to convert to godot 3

# Handles stuff like patterns
var id:int = SexToyGroup.Main
var vibration:SexToyPatternLayered = SexToyPatternLayered.new()

func vibratePattern(_pat:Array, _layer:int = 0, _looping:bool = false):
	vibration.playPatternArray(_pat, _layer, _looping)

func vibrateSimple(_intensity:float, _time:float, _layer:int = 0):
	vibratePattern([_intensity, _time], _layer)

func vibrateCurve(_curve:Curve, _time:float, _layer:int = 0, _looping:bool = false):
	vibration.playCurve(_curve, _time, _layer, _looping)

func process(_dt:float):
	if(vibration.process(_dt)):
		var vibLevel:float = vibration.getValue()
		var theToys:Array = SexToyManager.getToysByGroupAndType(id, SexToyType.Vibrator)
		for theToy in theToys:
			theToy.vibrate(vibLevel)

func setIntensity(_i:float):
	vibration.setIntensity(_i)

func getIntensity() -> float:
	return vibration.getIntensity()

func setOverride(_ov:bool, _val:float):
	vibration.setOverride(_ov, _val)

func setPaused(_ov:bool):
	vibration.setPaused(_ov)
