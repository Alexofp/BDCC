extends Reference
class_name SexToyTriggerEntry

var type:int = SexToyTrigger.Lust
var effects:Array = [] #Array[SexToyEffectEntry]
var startFrom:float = 0.2
var didPlayPassive:bool = false

func trigger():
	var _isPassive := SexToyTrigger.isPassive(type)
	for effectEntry in effects:
		effectEntry.trigger(type, _isPassive)

func triggerTest():
	for effectEntry in effects:
		effectEntry.trigger(100, false)

func triggerPassive(_value:float):
	var finalIntensity:float = 0.0
	if(_value >= startFrom):
		finalIntensity = Util.remapValue(_value, 0.2, 1.0, 0.0, 1.0)
	
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
		theData["startFrom"] = startFrom
	
	var effectsData:Array = []
	for theEffectEntry in effects:
		effectsData.append(theEffectEntry.saveData())
	theData["effects"] = effectsData
	
	return theData

func loadData(_data:Dictionary):
	type = SAVE.loadVar(_data, "type", 0)
	if(SexToyTrigger.isPassive(type)):
		startFrom = SAVE.loadVar(_data, "startFrom", 0.2)
	
	effects.clear()
	var effectsData:Array = SAVE.loadVar(_data, "effects", [])
	for theEffectEntry in effectsData:
		var newEffectEntry := SexToyEffectEntry.new()
		newEffectEntry.loadData(theEffectEntry)
		effects.append(newEffectEntry)
