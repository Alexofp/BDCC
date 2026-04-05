extends Reference
class_name PatternLayerCurve

var curve:Curve
var progress:float = 0.0
var looping:bool = false
var time:float = 1.0

func playCurve(_curve:Curve, _time:float, _looping:bool = false):
	looping = _looping
	progress = 0.0
	time = _time
	curve = _curve

func process(_dt:float):
	progress += _dt/time
	
	if(!looping):
		if(progress > 1.0):
			progress = 1.0
	else:
		while(progress >= 1.0):
			progress -= 1.0

func getValue() -> float:
	return curve.interpolate_baked(clamp(progress, 0.0, 1.0))

func shouldBeRemoved() -> bool:
	if(!curve):
		return true
	if(looping):
		return false
	return progress >= 1.0
