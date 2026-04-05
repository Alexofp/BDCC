extends Reference
class_name PatternLayerArray

var vibPattern:Array
var patternCopy:Array
var vibLevel:float = 0.0
var looping:bool = false

func playPattern(_pat:Array, _looping:bool = false):
	vibPattern = _pat.duplicate()
	patternCopy = _pat.duplicate()
	looping = _looping

func playSimple(_intensity:float, _time:float):
	playPattern([_intensity, _time])

func process(_dt:float):
	var newVibLevel:float = 0.0
	var proccessedDT:float = _dt
	while(!vibPattern.empty() && proccessedDT > 0.0):
		newVibLevel = vibPattern[0]
		
		var toRem:float = proccessedDT
		if(vibPattern[1] < toRem):
			toRem = vibPattern[1]
		
		vibPattern[1] -= toRem
		proccessedDT -= toRem
		if(vibPattern[1] <= 0.0):
			vibPattern.pop_front()
			vibPattern.pop_front()
	
	if(looping && vibPattern.empty()):
		vibPattern = patternCopy.duplicate()
	
	vibLevel = newVibLevel

func getValue() -> float:
	return vibLevel

func shouldBeRemoved() -> bool:
	if(looping):
		return false
	return vibPattern.empty()
