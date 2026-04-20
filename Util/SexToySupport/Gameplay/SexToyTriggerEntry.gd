extends Reference
class_name SexToyTriggerEntry

var type:int = SexToyTrigger.Lust
var effects:Array = [] #Array[SexToyEffectEntry]
var startFrom:float = 0.2
var didPlayPassive:bool = false

var scaleWithValue:bool = false
var scaleMaxAt:float = 0.2

func trigger(_args:Array = []):
	if(type == SexToyTrigger.OnPainGain && getArg(_args, 0, 0) <= 0):
		return
	if(type == SexToyTrigger.OnLustGain && getArg(_args, 0, 0) <= 0):
		return
	if(type == SexToyTrigger.OnArousalGain && getArg(_args, 0, 0.0) <= 0.0):
		return
	
	var _intensity:float = 1.0
	if(scaleWithValue):
		if(type == SexToyTrigger.OnPainGain || type == SexToyTrigger.OnLustGain):
			var _am:float = float(getArg(_args, 0, 0))*0.01
			if(_am < scaleMaxAt):
				_intensity = Util.remapValue(_am, 0.0, scaleMaxAt, 0.0, 1.0)
		if(type == SexToyTrigger.OnArousalGain):
			var _am:float = float(getArg(_args, 0, 0))
			if(_am < scaleMaxAt):
				_intensity = Util.remapValue(_am, 0.0, scaleMaxAt, 0.0, 1.0)
	
	#var _isPassive := SexToyTrigger.isPassive(type)
	for effectEntry in effects:
		effectEntry.trigger(type, false, _intensity)

func triggerTest():
	for effectEntry in effects:
		effectEntry.trigger(100, false)

func triggerPassive(_value:float):
	var finalIntensity:float = 0.0
	#if(_value >= startFrom):
	#	finalIntensity = Util.remapValue(_value, startFrom, 1.0, 0.0, 1.0)
	if(_value < startFrom):
		finalIntensity = 0.0
	else:
		finalIntensity = _value
	
	if(!didPlayPassive && finalIntensity > 0.0):
		didPlayPassive = true
		var _isPassive := SexToyTrigger.isPassive(type)
		for effectEntry in effects:
			effectEntry.trigger(type, _isPassive)
	
	for theGroupID in SexToyGroup.ALL:
		var theGroupInstance:SexToyGroupInstance = SexToyManager.groups[theGroupID]
		theGroupInstance.vibration.setLayerIntensity(type, finalIntensity)
		if(_value < startFrom || _value <= 0.0):
			theGroupInstance.vibration.stopLayer(type)
			didPlayPassive = false

func getArg(_args:Array, _i:int, _default = null):
	if(_i >= _args.size()):
		return _default
	return _args[_i]

func shouldBeRemoved() -> bool:
	return effects.empty()

func checkShouldBeRemoved():
	if(shouldBeRemoved()):
		SexToyManager.gameplay.triggers.erase(type)

func isPassive() -> bool:
	return SexToyTrigger.isPassive(type)

func saveData() -> Dictionary:
	var theData:Dictionary = {
		type = type,
	}
	if(SexToyTrigger.isPassive(type)):
		theData["sf"] = startFrom
	if(scaleWithValue):
		theData["sm"] = scaleMaxAt
	
	var effectsData:Array = []
	for theEffectEntry in effects:
		effectsData.append(theEffectEntry.saveData())
	theData["effects"] = effectsData
	
	return theData

func loadData(_data:Dictionary):
	type = SAVE.loadVar(_data, "type", 0)
	if(SexToyTrigger.isPassive(type)):
		startFrom = SAVE.loadVar(_data, "sf", 0.2)
	
	effects.clear()
	var effectsData:Array = SAVE.loadVar(_data, "effects", [])
	for theEffectEntry in effectsData:
		var newEffectEntry := SexToyEffectEntry.new()
		newEffectEntry.loadData(theEffectEntry)
		effects.append(newEffectEntry)
	
	if(_data.has("sm")):
		scaleWithValue = true
		scaleMaxAt = SAVE.loadVar(_data, "sm", 0.2)
	else:
		scaleWithValue = false
		scaleMaxAt = 0.2
