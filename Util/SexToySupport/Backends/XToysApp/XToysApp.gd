extends SexToyBackend

# Based on https://github.com/Alexofp/BDCC/pull/83

const DEBUG_XTOYSAPP := true

const DEFAULT_WEBHOOK := "CHANGE_ME"

var webhookID:String = DEFAULT_WEBHOOK

var lastErrors:Array
onready var http_request = $"%HTTPRequest"

#signal device_found(device)
#signal device_removed(device)

func getInfo() -> Array:
	return [
		"Meow"
	] + lastErrors

func _init():
	id = "XToysApp"

func getName() -> String:
	return "XToysApp"

func getDesc() -> String:
	return """XToys.App

Quick how-to:

"""

func getSettings() -> Dictionary:
	return {
		"webhookID": {
			name = "Webhook ID",
			type = "string",
			value = webhookID,
		},
	}

func applySetting(_varid:String, _value):
	if(_varid == "webhookID"):
		webhookID = _value
		if(webhookID.empty()):
			webhookID = DEFAULT_WEBHOOK
			return true
	
	return false

func _ready():
	set_process(false)
	pass

func onEnabled():
	var theToys:Array = []
	var newToy := SexToyVibrator.new()
	newToy.setBackend(id, "some", "", "1")
	var toyData:Dictionary = {}
	newToy.backendData = toyData
	theToys.append(newToy)
	
	setToys(theToys)
	set_process(true)

func onDisabled():
	setToys([])
	#disconnectFromServer()
	set_process(false)


func _process(_delta:float):
	pass

func logDebug(_text:String):
	if(!DEBUG_XTOYSAPP):
		return
	Log.print("["+id+"] "+str(_text))

func logError(_text:String):
	Log.printerr("["+id+"] "+str(_text))
	lastErrors.append(_text)

#	sendToButtplugIO("OutputCmd", {
#			"DeviceIndex": 0,
#			"FeatureIndex": 0,
#			"Command": {
#				"Vibrate": {
#					"Value": 10000,
#				}
#			}
#		})

var bufferedRequest:Dictionary
var isRequesting:bool = false
func doXToysRequest(_data:Dictionary):
	if(!isRequesting):
		isRequesting = true
		http_request.request(
			"https://webhook.xtoys.app/"+webhookID, ["Content-Type: application/json"], true, HTTPClient.METHOD_POST,
			JSON.print(_data)
		)
		logDebug("Sent: "+str(_data))
		bufferedRequest.clear()
	else:
		for someField in _data:
			bufferedRequest[someField] = _data[someField]

func vibrate(_toy, _strength:float):
	doXToysRequest({
		action = "set",
		v1 = _strength,
	})

func scanForToys():
	pass

func saveData() -> Dictionary:
	var theData := .saveData()
	theData["webhookID"] = webhookID
	return theData

func loadData(_data:Dictionary):
	.loadData(_data)
	
	webhookID = SAVE.loadVar(_data, "webhookID", DEFAULT_WEBHOOK)

func _on_HTTPRequest_request_completed(_result, _response_code, _headers, _body):
	isRequesting = false
	if(!bufferedRequest.empty()):
		doXToysRequest(bufferedRequest)
