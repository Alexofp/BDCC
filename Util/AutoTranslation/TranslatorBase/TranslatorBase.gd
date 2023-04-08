extends Node
class_name TranslatorBase

var id = "error"
var cooldownUntil = -1

func setup():
	pass

func translate(_targetLanguage, _inputText):
	return "Error. I'm just a dummy translator."
	
func canTranslate():
	if(cooldownUntil < 0):
		return true
	
	var currentTime = Time.get_unix_time_from_system()
	if(currentTime >= cooldownUntil):
		return true
	return false

func startCooldownMinutes(minutes):
	print(id+" translator went on cooldown for "+str(minutes)+" minutes")
	cooldownUntil = Time.get_unix_time_from_system() + 60*minutes
