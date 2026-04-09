extends Reference
class_name SexToyEffectEntry

var type:int = SexToyEffect.SIMPLE
var groups:Array = [SexToyGroup.Main]

var curve:Curve
var curveTime:float = 3.0

var sequence:Array = [1.0, 0.5, 0.7, 0.5, 1.0, 0.5] # [strength, time, strength, time, strength, time]

func getSimple() -> Vector2: #[strength time]
	if(sequence.empty()):
		return Vector2(1.0, 2.0)
	if(sequence.size() == 1):
		return Vector2(sequence[0], 2.0)
	return Vector2(sequence[0], sequence[1])

func setSimple(_intensity:float, _time:float):
	sequence = [_intensity, _time]
