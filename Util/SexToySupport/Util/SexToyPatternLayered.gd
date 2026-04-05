extends Reference
class_name SexToyPatternLayered

var value:float = 0.0
var layers:Dictionary

func playPatternArray(_pattern:Array, _layer:int, _looping:bool = false):
	var newPattern := PatternLayerArray.new()
	newPattern.playPattern(_pattern, _looping)
	layers[_layer] = newPattern

func playCurve(_curve:Curve, _time:float, _layer:int, _looping:bool = false):
	var newPattern := PatternLayerCurve.new()
	newPattern.playCurve(_curve, _time, _looping)
	layers[_layer] = newPattern

func process(_dt:float) -> bool:
	var newValue:float = 0.0
	
	var toRem:Array = []
	for layerIndx in layers:
		var theLayer = layers[layerIndx]
		theLayer.process(_dt)
		
		newValue += theLayer.getValue()
		
		if(theLayer.shouldBeRemoved()):
			toRem.append(layerIndx)
	
	for theIndx in toRem:
		layers.erase(theIndx)
	
	newValue = clamp(newValue, 0.0, 1.0)
	if(abs(value - newValue) > 0.01):
		value = newValue
		return true
	
	return false

func getValue() -> float:
	return value
