extends Reference
class_name SexToyPatternLayered

var value:float = 0.0
var layers:Dictionary
var intensity:float = 1.0

var override:bool = false
var overrideValue:float = 0.0

var paused:bool = false

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
		
		#newValue += theLayer.getValue()
		newValue = max(newValue, theLayer.getValue())
		
		if(theLayer.shouldBeRemoved()):
			toRem.append(layerIndx)
	
	for theIndx in toRem:
		layers.erase(theIndx)
	
	newValue = clamp(newValue*intensity, 0.0, 1.0)
	if(override):
		newValue = overrideValue
	if(paused):
		newValue = 0.0
	if(abs(value - newValue) > 0.01 || (newValue == 0.0 && newValue != value)):
		value = newValue
		if(value < 0.01):
			value = 0.0
		return true
	
	return false

func getValue() -> float:
	return value

func setIntensity(_v:float):
	intensity = _v

func getIntensity() -> float:
	return intensity

func setLayerIntensity(_layer:int, _intensity:float):
	if(!layers.has(_layer)):
		return
	layers[_layer].setIntensity(_intensity)

func hasLayer(_layer:int) -> bool:
	return layers.has(_layer)

func stopLayer(_layer:int):
	if(layers.has(_layer)):
		layers.erase(_layer)

func setOverride(_ov:bool, _val:float):
	override = _ov
	overrideValue = _val

func setPaused(_ov:bool):
	paused = _ov
