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

func translateFinal(_targetLanguage:String, _inputText:String) -> Dictionary:
	var theRes = translate(_targetLanguage, _inputText)
	
	if(theRes is GDScriptFunctionState):
		theRes = yield(theRes, "completed")
	
	if(!(theRes is Dictionary)):
		onError()
		return {
			error = true,
			success = false,
			errorMessage = "No error message provided",
			resultText = "No text provided",
		}
	
	if(theRes.get("error", false)):
		onError()
	return theRes

func onError():
	startCooldownSeconds(60)

func canTranslate():
	var currentTime = Time.get_unix_time_from_system()
	if(currentTime < antispamUntil):
		return false
	
	if(currentTime < cooldownUntil):
		return false
	
	return true

func startCooldownMinutes(minutes:int):
	Log.print(id+" translator went on cooldown for "+str(minutes)+" minutes")
	cooldownUntil = Time.get_unix_time_from_system() + 60*minutes

func startCooldownSeconds(seconds:int):
	Log.print(id+" translator went on cooldown for "+str(seconds)+" seconds")
	cooldownUntil = Time.get_unix_time_from_system() + seconds

func afterTranslate():
	if(antispamSeconds > 0):
		antispamUntil = Time.get_unix_time_from_system() + antispamSeconds
		
func getName():
	return "ERROR"
