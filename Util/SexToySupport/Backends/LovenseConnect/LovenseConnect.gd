extends SexToyBackend

# This is bad

const STATUS_DISCONNECTED := 0
const STATUS_CONNECTING := 1
const STATUS_CONNECTED := 2
const STATUS_TO_TEXT:Array = ["Disconnected", "Connecting...", "Connected"]

const DEBUG_LOVENSE := false

const DEFAULT_LOCAL_HOST := "127.0.0.1:20010"

var localHost:String = DEFAULT_LOCAL_HOST
const useHttps:bool = false

var connectionStatus:int = STATUS_DISCONNECTED
var lastErrors:Array = []
var messageID:int = 1

var requestQueue:Dictionary = {}
var requestRepeat:Dictionary = {}
const REQUEST_TIME_DELAY = 0.1 # 10 requests a second max
var requestTimer:float = 0.0

func _init():
	id = "LovenseConnect"

func getName() -> String:
	return "Lovense Connect"

func getDesc() -> String:
	return """Lovense Connect

Read the full instruction [url=https://github.com/Alexofp/BDCC/wiki/Sex-toy-integration-(Buttplug.IO,-XToys.app)]on the BDCC wiki[/url]

Quick how-to:
1. Download Lovense Connect App from [url=https://www.lovense.com/sextoys/download]https://www.lovense.com/sextoys/download[/url]
2. Launch it. Connect your toys to it. Make sure to enable 'Game Mode'/'External control' in the app's settings.
3. Enable this backend
4. Your toys should show up

Not every toy type is supported. Separate motor control isn't supported (for toys with 2+ motors). Just use the Buttplug.IO backend if you can
"""

func getInfo() -> Array:
	return [
		"Status: " + str(STATUS_TO_TEXT[connectionStatus]),
		"Endpoint: " + getBaseUrl(),
	] + lastErrors

func getSettings() -> Dictionary:
	return {
		"localHost": {
			name = "Local Host",
			type = "string",
			value = localHost,
		},
	}

func applySetting(_varid:String, _value):
	if(_varid == "localHost"):
		localHost = str(_value).strip_edges()
		if localHost.empty():
			localHost = DEFAULT_LOCAL_HOST
		return true

	return false

func _ready():
	set_process(false)

func onEnabled():
	connectToServer()

func onDisabled():
	setToys([])
	disconnectFromServer()
	set_process(false)

func getBaseUrl() -> String:
	return ""+("https" if useHttps else "http")+"://"+localHost

func getCommandUrl() -> String:
	return getBaseUrl()+"/command"

func connectToServer() -> bool:
	lastErrors = []

	if DEBUG_LOVENSE:
		logDebug("Connecting to Lovense Connect app at "+getCommandUrl())

	connectionStatus = STATUS_CONNECTING
	return scanForDevices()

func disconnectFromServer():
	connectionStatus = STATUS_DISCONNECTED
	set_process(false)
	
func scanForToys():
	scanForDevices()

func scanForDevices() -> bool:
	return _send_local_command({"command": "GetToys"})

func startScan():
	scanForDevices()

func vibrate(_toy, _strength:float):
	var toyData:Dictionary = _toy.backendData

	var theToyId:String = str(toyData.get("toy", ""))
	if(theToyId.empty()):
		logError("Missing Lovense toy id in backendData")
		return
	
	var theMaxValue:int = toyData.get("maxValue", 20)
	var theType:String = toyData.get("type", "Vibrate")
	
	var strength_i:int = int(round(Util.remapValue(_strength, 0.0, 1.0, 0.0, float(theMaxValue))))
	if(strength_i < 0):
		strength_i = 0
	if(strength_i > theMaxValue):
		strength_i = theMaxValue
	#strength_i = clamp(strength_i, 0, 20)

	var payload:Dictionary = {
		"command": "Function",
		"toy": theToyId,
		"apiVer": 1,
		"timeSec": 0,
		"stopPrevious": 0,
	}


	payload["action"] = theType+":"+str(strength_i)

	#_send_local_command(payload)
	queueSendCommand(payload, theToyId, 3)


# Repeats the command a few times to make sure that it happens
func queueSendCommand(_data:Dictionary, _requestID:String, _repeatAmount:int = 1):
	if(!requestQueue.has(_requestID)):
		requestQueue[_requestID] = _data
	else:
		requestQueue[_requestID].merge(_data, true)
	requestRepeat[_requestID] = _repeatAmount

func _process(_delta:float):
	if(requestTimer > 0.0):
		requestTimer -= _delta
	
	if(requestTimer <= 0.0 && !requestQueue.empty()):
		var theRequestID:String = requestQueue.keys().front()
		var _data:Dictionary = requestQueue[theRequestID]
		var _am:int = requestRepeat.get(theRequestID, 0)
		
		_send_local_command(_data)

		requestTimer = REQUEST_TIME_DELAY
		requestQueue.erase(theRequestID)
		if(_am > 0):
			requestRepeat[theRequestID] -= 1
			requestQueue[theRequestID] = _data

func _send_local_command(payload:Dictionary) -> bool:
	var req := HTTPRequest.new()
	add_child(req)

	req.connect("request_completed", self, "_on_local_request_completed", [req, payload.get("command", "")])

	var headers := [
		"Content-Type: application/json",
		"X-platform: BDCC",
	]

	var body := JSON.print(payload)
	if DEBUG_LOVENSE:
		logDebug("SENDING   " + str(body))

	var validate_domain := useHttps
	var err := req.request(getCommandUrl(), headers, validate_domain, HTTPClient.METHOD_POST, body)
	if err != OK:
		req.queue_free()
		connectionStatus = STATUS_DISCONNECTED
		logError("HTTPRequest failed to request: "+str(err))
		return false

	return true

func _on_local_request_completed(result:int, response_code:int, _headers:Array, body:PoolByteArray, req:HTTPRequest, kind:String):
	if is_instance_valid(req):
		req.queue_free()

	if(result != HTTPRequest.RESULT_SUCCESS):
		connectionStatus = STATUS_DISCONNECTED
		logError("HTTP request failed: result="+str(result))
		return

	var text := body.get_string_from_utf8()

	var parsed := JSON.parse(text)
	if(parsed.error != OK):
		connectionStatus = STATUS_DISCONNECTED
		logError("Invalid JSON response: "+str(parsed.error_string))
		return

	var response = parsed.result
	if(DEBUG_LOVENSE):
		logDebug("GOT   " + str(response))
	
	if(!(response is Dictionary)):
		connectionStatus = STATUS_DISCONNECTED
		logError("Unexpected response type: " + str(typeof(response)))
		return

	if(response_code != 200):
		connectionStatus = STATUS_DISCONNECTED
		logError("Lovense HTTP response code "+str(response_code)+": "+str(response))
		return

	var api_code:int = int(response.get("code", 0))
	if(api_code != 200):
		logError("Lovense API error: " + str(response))
		return

	connectionStatus = STATUS_CONNECTED
	set_process(true)

	if(kind == "GetToys"):
		_handle_get_toys_response(response)
		return


func _handle_get_toys_response(response:Dictionary):
	var data:Dictionary = response.get("data", {})
	var toys_field = data.get("toys", "{}") # WHYYYYYYYY IS IT A STRING
	#if(toys_field is String):
	#	breakpoint

	var toys_dict:Dictionary = {}
	if toys_field is Dictionary:
		toys_dict = toys_field
	else:
		var parsed_toys := JSON.parse(str(toys_field))
		if parsed_toys.error != OK or not (parsed_toys.result is Dictionary):
			logError("Could not parse toys payload: " + str(toys_field))
			setToys([])
			return
		toys_dict = parsed_toys.result

	var theNewToys:Array = []

	for theToyKey in toys_dict.keys():
		var toy_info:Dictionary = toys_dict[theToyKey]

		# Skip disconnected toys
		if int(toy_info.get("status", 0)) != 1:
			continue
		
		var theReportedName:String = toy_info.get("name", "Lovense Toy")
		var theDBToyInfo:Dictionary = getToyInfo(theReportedName)
		var theNickname:String = toy_info.get("nickName", "")
		
		var theFinalName:String = theNickname if !theNickname.empty() else theDBToyInfo.get("name", "Lovense Toy")
		var _group:int = 0
		var _i:int = 0
#		for theFeature in theDBToyInfo["features"]: # Didn't really work sadly
#			var newToy := SexToyVibrator.new()
#			newToy.setBackend(id, str(theToyKey), theReportedName, str(_i))
#			newToy.name = theFinalName+" ("+theFeature["name"]+")"
#			newToy.group = _group
#			_group += 1
#			if(_group >= 2):
#				_group = 0
#
#			newToy.backendData = {
#				"toy": str(theToyKey),
#				"type": theFeature["type"],
#				"minValue": 0,
#				"maxValue": theFeature["maxValue"],
#			}
#
#			theNewToys.append(newToy)
#			_i += 1
		
#		var theShortFunctions:Array = toy_info.get("shortFunctionNames", [])
		var theFullFunctions:Array = toy_info.get("fullFunctionsNames", [])
		for theFullFunction in theFullFunctions:
			var theMaxValue:int = 20
			if(theFullFunction == "Vibrate"):
				pass
			elif(theFullFunction == "Rotate"):
				pass
			elif(theFullFunction == "Pump"):
				theMaxValue = 3
			elif(theFullFunction == "Thrusting"):
				pass
			elif(theFullFunction == "Fingering"):
				pass
			elif(theFullFunction == "Suction"):
				pass
			elif(theFullFunction == "Depth"):
				theMaxValue = 3
			else:
				continue
			
			var newToy := SexToyVibrator.new()
			newToy.setBackend(id, str(theToyKey), theReportedName, str(_i))
			newToy.name = theFinalName+" ("+theFullFunction+")"
			newToy.group = _group
			_group += 1
			if(_group >= 2):
				_group = 0

			newToy.backendData = {
				"toy": str(theToyKey),
				"type": theFullFunction,
				"minValue": 0,
				"maxValue": theMaxValue,
			}

			theNewToys.append(newToy)
			_i += 1


	setToys(theNewToys)

	if DEBUG_LOVENSE:
		logDebug("Loaded "+str(theNewToys.size())+" Lovense toys")


func onError(msg):
	logError(str(msg))


func logDebug(_text:String):
	if(!DEBUG_LOVENSE):
		return
	Log.print("[LovenseConnect] " + str(_text))


func logError(_text:String):
	Log.printerr("[LovenseConnect] " + str(_text))
	lastErrors.append(_text)

const FEATURE_TO_COMMAND:Dictionary = {
	vibrate = "Vibrate",
	constrict = "Pump",
	rotate = "Rotate",
	oscillate = "Oscillate",
}

# {name = "Actual name", features = [{type="vibrate1", name="Vibrator 1", maxValue=20}, ...]}
func getToyInfo(_name:String) -> Dictionary:
	var _curVibrate:int = 1
	
	var foundSomething:bool = false
	var theFoundConf:Dictionary = LovenseDB.DB["defaults"]
	for theConfiguration in LovenseDB.DB["configurations"]:
		if(theConfiguration.get("identifier").has(_name)):
			theFoundConf = theConfiguration
			foundSomething = true
			break
	
	var actualName:String = _name if !foundSomething else theFoundConf.get("name", _name)
	var resultFeatures:Array = []
	var theRawFeatures:Array = theFoundConf.get("features", [])
	for theRawFeature in theRawFeatures:
		if(!theRawFeature.has("output") || theRawFeature["output"].empty()):
			continue
		var theOutputStuff:Dictionary = theRawFeature["output"]
		var theOutputType:String = theOutputStuff.keys()[0] # Luckily all the entries only have 1 output key
		if(!FEATURE_TO_COMMAND.has(theOutputType)): # Unsupported, sorry
			continue
		
		var theCommandOutputType:String = FEATURE_TO_COMMAND[theOutputType]
		#if(theCommandOutputType == "Vibrate"): # Doesn't work :(
		#	theCommandOutputType += str(_curVibrate)
		#	_curVibrate += 1
		
		var theDesc:String = theRawFeature.get("description", theCommandOutputType)
		var theMinMaxValues:Array = theOutputStuff[theOutputType].get("value", [0, 20])
		var theMinValue:int = theMinMaxValues[0] if theMinMaxValues.size() > 0 else 0
		var theMaxValue:int = theMinMaxValues[1] if theMinMaxValues.size() > 1 else 20
		resultFeatures.append({
			name = theDesc,
			type = theCommandOutputType,
			minValue = theMinValue,
			maxValue = theMaxValue,
		})
	
	return {
		name = actualName,
		features = resultFeatures,
	}
	

func saveData() -> Dictionary:
	var theData := .saveData()
	theData["localHost"] = localHost
	return theData


func loadData(_data:Dictionary):
	.loadData(_data)

	localHost = SAVE.loadVar(_data, "localHost", DEFAULT_LOCAL_HOST)

	if localHost.empty():
		localHost = DEFAULT_LOCAL_HOST
