extends SexToyBackend

# Based on https://github.com/Alexofp/BDCC/pull/83

const DEBUG_XTOYSAPP := true

const DEFAULT_WEBHOOK := "CHANGE_ME"

var webhookID:String = DEFAULT_WEBHOOK

var lastErrors:Array

var requestQueue:Dictionary = {}
const REQUEST_TIME_DELAY = 0.1 # 10 requests a second max
var requestTimer:float = 0.0

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

Read the full instruction [url=https://github.com/Alexofp/BDCC/wiki/Sex-toy-integration-(Buttplug.IO,-XToys.app)]on the BDCC wiki[/url]

Quick how-to:
1. Enable this backend. 4 toy features will appear, one for each group.
2. Download [url=https://xtoys.app/]xtoys.app[/url] onto your smartphone, register and connect your toys to it.
3. Load (and start) this script: [url=https://xtoys.app/scripts/-OpcaiGlTFy0Tw-AA23D]https://xtoys.app/scripts/-OpcaiGlTFy0Tw-AA23D[/url] or search for the one called "BDCC" (by Rahi)
4. The script will give you a "Webhook ID". Copy it here, into the Webhook ID field (below the Enabled).
5. Inside the xtoys app, connect the output variables of the script (groups) to your toys.
6. Test the groups here to make sure everything is working.
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
	for theGroup in SexToyGroup.ALL:
		var newToy := SexToyVibrator.new()
		newToy.setBackend(id, "some", "", str(theGroup + 1))
		var toyData:Dictionary = {}
		newToy.backendData = toyData
		newToy.group = theGroup
		newToy.name = "XToys ("+SexToyGroup.getName(theGroup)+" group)"
		theToys.append(newToy)
	
	setToys(theToys)
	set_process(true)

func onDisabled():
	setToys([])
	#disconnectFromServer()
	set_process(false)


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
func doXToysRequest(_requestID:String, _data:Dictionary):
	if(!requestQueue.has(_requestID)):
		requestQueue[_requestID] = _data
	else:
		requestQueue[_requestID].merge(_data, true)

func _process(_delta:float):
	if(requestTimer > 0.0):
		requestTimer -= _delta
	
	if(requestTimer <= 0.0 && !requestQueue.empty()):
		var theRequestID:String = requestQueue.keys().front()
		var _data:Dictionary = requestQueue[theRequestID]
		
		var newHttpRequest := HTTPRequest.new()
		add_child(newHttpRequest)
		newHttpRequest.connect("request_completed", self, "deleteRequestAfterDone", [newHttpRequest])
		newHttpRequest.request(
			"https://webhook.xtoys.app/"+webhookID, ["Content-Type: application/json"], true, HTTPClient.METHOD_POST,
			JSON.print(_data)
		)
		if(DEBUG_XTOYSAPP):
			logDebug("Sent: "+str(_data))
		requestTimer = REQUEST_TIME_DELAY
		requestQueue.erase(theRequestID)

func vibrate(_toy, _strength:float):
	var theGroup:int = _toy.group
	var theGroupVarName:String = "v"+str(theGroup+1)
	
	doXToysRequest("set", {
		"action": "set",
		theGroupVarName: _strength,
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

func deleteRequestAfterDone(_result, _response_code, _headers, _body, _request:HTTPRequest):
	_request.queue_free()
