extends SexToyBase
class_name SexToyVibrator

var strengthMult:float = 1.0

var cachedVibrate:float = 0.0

func _init():
	type = SexToyType.Vibrator

func vibrate(_intensity:float):
	if(!SexToyManager.backends.has(backendID)):
		return
	
	# Simple cache to save against poking the backend too much
	if(abs(cachedVibrate - _intensity) < 0.01):
		return
	cachedVibrate = _intensity
	
	var theBackend = SexToyManager.backends[backendID]
	theBackend.vibrate(self, _intensity * strengthMult)

func getSettings() -> Dictionary:
	var theSettings := .getSettings()
	theSettings.merge({
		"strengthMult": {
			name = "Strength multiplier",
			type = "number",
			value = strengthMult,
			step = 0.01,
		},
	}, true)
	return theSettings

func applySetting(_varid:String, _value):
	if(_varid == "strengthMult"):
		strengthMult = _value
		return true
	
	return .applySetting(_varid, _value)

func saveData() -> Dictionary:
	var theData := .saveData()
	theData["strengthMult"] = strengthMult
	return theData
	
func loadData(_data:Dictionary):
	.loadData(_data)
	strengthMult = SAVE.loadVar(_data, "strengthMult", 1.0)
	
