extends SexToyBase
class_name SexToyVibrator

var strengthMult:float = 1.0

func _init():
	type = SexToyType.Vibrator

func vibrate(_intensity:float):
	if(!SexToyManager.backends.has(backendID)):
		return
	var theBackend = SexToyManager.backends[backendID]
	theBackend.vibrate(self, _intensity * strengthMult)
