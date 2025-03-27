extends Node
class_name TranslatorBase

var id = "error"
var cooldownUntil = -1
var antispamSeconds = 0
var antispamUntil = -1

func setup():
	pass

func translate(_targetLanguage, _inputText):
	return "Error. I'm just a dummy translator."
	
func canTranslate():
	var currentTime = Time.get_unix_time_from_system()
	if(currentTime < antispamUntil):
		return false
	
	if(currentTime < cooldownUntil):
		return false
	
	return true

func startCooldownMinutes(minutes):
	print(id+" translator went on cooldown for "+str(minutes)+" minutes")
	cooldownUntil = Time.get_unix_time_from_system() + 60*minutes

func afterTranslate():
	if(antispamSeconds > 0):
		antispamUntil = Time.get_unix_time_from_system() + antispamSeconds
		
func getName():
	return "ERROR"
