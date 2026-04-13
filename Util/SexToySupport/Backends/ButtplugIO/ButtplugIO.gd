extends SexToyBackend

# Heavily based on https://github.com/erodozer/Godot.Buttplug

# https://buttplug.io/docs/spec/messages
# https://buttplug.io/docs/spec/device_discovery
# https://buttplug.io/docs/spec/device_information
# https://buttplug.io/docs/spec/output

const STATUS_DISCONNECTED := 0
const STATUS_CONNECTING := 1
const STATUS_CONNECTED := 2
const STATUS_TO_TEXT:Array = ["Disconnected", "Connecting...", "Connected"]

const DEBUG_BUTTPLUGIO := false

const DEFAULT_WEBSOCKET_URL := "127.0.0.1:12345"

var websocketURL:String = DEFAULT_WEBSOCKET_URL
var _client = WebSocketClient.new()
var connectionStatus:int = STATUS_DISCONNECTED
var messageID:int = 1

var scanTimer:float = 0.0
var lastErrors:Array

#signal device_found(device)
#signal device_removed(device)

func getInfo() -> Array:
	return [
		"Status: "+str(STATUS_TO_TEXT[connectionStatus]),
	] + lastErrors

func _init():
	id = "ButtplugIO"

func getName() -> String:
	return "ButtplugIO"

func getDesc() -> String:
	return """Buttplug.IO

Read the full instruction [url=https://github.com/Alexofp/BDCC/wiki/Sex-toy-integration-(Buttplug.IO,-XToys.app)]on the BDCC wiki[/url]

Quick how-to:
1. Download Intiface Central App from [url=https://intiface.com/#intiface-central]https://intiface.com/#intiface-central[/url]
2. Launch it. Connect your toys to it. Press the big 'Launch Server' button that looks like a play icon
3. Enable Buttplug.IO backend here
4. Your toys should show up

Not every toy type is supported.
"""

func getSettings() -> Dictionary:
	return {
		"websocketURL": {
			name = "Websocket URL",
			type = "string",
			value = websocketURL,
		},
	}

func applySetting(_varid:String, _value):
	if(_varid == "websocketURL"):
		websocketURL = _value
		if(websocketURL.empty()):
			websocketURL = DEFAULT_WEBSOCKET_URL
			return true
	
	return false

func _ready():
	set_process(false)
	# Connect base signals to get notified of connection open, close, and errors.
	_client.connect("connection_closed", self, "onSocketClosed")
	_client.connect("connection_error", self, "onSocketFailedToConnect")
	_client.connect("connection_established", self, "onSocketConnected")
	# This signal is emitted when not using the Multiplayer API every time
	# a full packet is received.
	# Alternatively, you could check get_peer(1).get_available_packets() in a loop.
	_client.connect("data_received", self, "onButtplugIOData")
	
	#connectToServer()

func onEnabled():
	connectToServer()

func onDisabled():
	setToys([])
	disconnectFromServer()
	set_process(false)

func connectToServer() -> bool:
	lastErrors = []
	if(connectionStatus != STATUS_DISCONNECTED):
		#_client.disconnect_from_host()
		return true # Already connected or connecting
	set_process(true)
	connectionStatus = STATUS_CONNECTING
	if(DEBUG_BUTTPLUGIO):
		logDebug("Connecting to server at %s" % websocketURL)
	var err = _client.connect_to_url("ws://"+websocketURL)
	if err != OK:
		logError("Unable to connect")
		set_process(false)
		return false
	# buttplug uses text frames
	_client.get_peer(1).set_write_mode(WebSocketPeer.WRITE_MODE_TEXT)
	return true

func disconnectFromServer():
	if(connectionStatus == STATUS_DISCONNECTED):
		return
	_client.disconnect_from_host()
	connectionStatus = STATUS_DISCONNECTED

func onButtplugIOData():
	var msg = _client.get_peer(1).get_packet().get_string_from_utf8()
	var theJson := JSON.parse(msg)
	if(theJson.error != OK):
		onError(theJson.error_string)
		return
	var _content = theJson.result
	#print_debug(msg)
	if(DEBUG_BUTTPLUGIO):
		logDebug("GOT   "+str(_content))
	if(!(_content is Array)):
		logError("Got weird response. Content="+str(_content))
		return
	
	for data in _content:
		if(!(data is Dictionary)):
			continue
		processButtplugIOMessage(data)
	
#	for data in content:
#		if "Error" in data:
#			onError(msg)
#		elif "DeviceAdded" in data:
#			_add_device(data.DeviceAdded)
#		elif "DeviceRemoved" in data:
#			_remove_device(data.DeviceRemoved)
#		elif "DeviceList" in data:
#			for device in data.DeviceList.Devices:
#				_add_device(device)
#		elif "ServerInfo" in data:
#			connected = true
#			_send("RequestDeviceList", {})
#			_scan()
#		else:
#			pass

func processButtplugIOMessage(_message:Dictionary):
	if(_message.has("ServerInfo")):
		connectionStatus = STATUS_CONNECTED
		scanForDevices()
		sendToButtplugIO("RequestDeviceList")
		
		return
	
	if(_message.has("DeviceList")):
		var theNewToys:Array = []
		var theDevicesList:Dictionary = _message["DeviceList"]
		var theDevices:Dictionary = theDevicesList.get("Devices", {})
		
		for deviceStrIndx in theDevices:
			var theDevice:Dictionary = theDevices[deviceStrIndx]
			
			var _deviceName:String = theDevice.get("DeviceName", "Unknown device")
			var _timingGap:float = theDevice.get("DeviceMessageTimingGap", 0.0)
			
			var theFeatures:Dictionary = theDevice.get("DeviceFeatures", {})
			var _group:int = 0
			for featureStrIndx in theFeatures:
				var theFeature:Dictionary = theFeatures[featureStrIndx]
				
				var _featureDesc:String = theFeature.get("FeatureDescription", "Unknown")
				
				# This is not anything that we can control
				if(!theFeature.has("Output")):
					continue
				
				var theOutput:Dictionary = theFeature.get("Output", {})
				
				# It's a vibrating toy
				for theVibrateType in ["Oscillate", "Rotate", "Vibrate", "Constrict", "Spray"]:
					if(!theOutput.has(theVibrateType)):
						continue
					
					var theFeatureName:String = theVibrateType
					if(theFeatureName == "Vibrate"):
						theFeatureName = "Vibrator"
					elif(theFeatureName == "Rotate"):
						theFeatureName = "Rotator"
					
					var _minMaxValues:Array = theOutput[theVibrateType].get("Value", [0, 1])
					
					var newToy := SexToyVibrator.new()
					newToy.setBackend(id, _deviceName, _featureDesc, "vib"+featureStrIndx)
					newToy.name = _deviceName
					if(_featureDesc.empty()):
						newToy.name += " ("+theFeatureName+" "+str(int(featureStrIndx)+1)+")"
					else:
						newToy.name += " ("+_featureDesc+")"
					newToy.group = _group
					
					var toyData:Dictionary = {
						#minValue = float(_minMaxValues[0]),
						sendType = theVibrateType,
						minValue = 0.0,
						maxValue = float(_minMaxValues[1]),
						device = str(deviceStrIndx),
						feature = str(featureStrIndx),
					}
					
					#newToy.minValue = float(_minMaxValues[0])
					#newToy.maxValue = float(_minMaxValues[1])
					newToy.backendData = toyData
					
					#provideToy(newToy)
					theNewToys.append(newToy)
					_group += 1
					if(_group > 1):
						_group = 0
					break
						
		setToys(theNewToys)
				
	
func onSocketConnected(_protocol):
	if(DEBUG_BUTTPLUGIO):
		logDebug("Connected to server!")
	
	sendToButtplugIO("RequestServerInfo", {
		"ClientName": "BDCC",
		#"MessageVersion": 1,
		"ProtocolVersionMajor": 4,
		"ProtocolVersionMinor": 0,
	})
	
func onSocketFailedToConnect():
	connectionStatus = STATUS_DISCONNECTED
	if(DEBUG_BUTTPLUGIO):
		logError("Failed to connect")
	_client.disconnect_from_host()


func onSocketClosed(_clean:bool):
	connectionStatus = STATUS_DISCONNECTED
	_client.disconnect_from_host()
	if(DEBUG_BUTTPLUGIO):
		logDebug("Socket closed. Clean="+str(_clean))

func sendToButtplugIO(command:String, body:Dictionary = {}):
	body["Id"] = messageID
	messageID += 1
	var msg = JSON.print([{
		command: body
	}])
	if(DEBUG_BUTTPLUGIO):
		logDebug("SENDING   "+str(msg))
	var buffer = msg.to_utf8()
	_client.get_peer(1).put_packet(buffer)

func startScan():
	sendToButtplugIO("StartScanning", {})
	
func stopScan():
	sendToButtplugIO("StopScanning", {})

func scanForDevices():
	startScan()
	scanTimer = 30.0
	#yield(get_tree().create_timer(30.0), "timeout")
	#stopScan()

func _process(_delta:float):
	_client.poll() # Must be called every frame for a WebSocket
	
	if(scanTimer > 0.0):
		scanTimer -= _delta
		if(scanTimer <= 0.0):
			stopScan()

func onError(msg):
	logError(str(msg))

func logDebug(_text:String):
	if(!DEBUG_BUTTPLUGIO):
		return
	Log.print("[Buttplug.IO] "+str(_text))

func logError(_text:String):
	Log.printerr("[Buttplug.IO] "+str(_text))
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

func vibrate(_toy, _strength:float):
	var toyData:Dictionary = _toy.backendData
	
	var sendType:String = toyData.get("sendType", "Vibrate")
	var minValue:float = float(toyData.get("minValue", 0.0))
	var maxValue:float = float(toyData.get("maxValue", 1.0))
	var device:int = int(toyData.get("device", "0"))
	var feature:int = int(toyData.get("feature", "0"))
	
	var finalValue:int = int(round(Util.remapValue(_strength, 0.0, 1.0, minValue, maxValue)))
	
	sendToButtplugIO("OutputCmd", {
			"DeviceIndex": device,
			"FeatureIndex": feature,
			"Command": {
				sendType: {
					"Value": finalValue,
				}
			}
		})

func scanForToys():
	if(connectionStatus >= STATUS_CONNECTED):
		scanForDevices()
		sendToButtplugIO("RequestDeviceList")

func saveData() -> Dictionary:
	var theData := .saveData()
	theData["websocketURL"] = websocketURL
	return theData

func loadData(_data:Dictionary):
	.loadData(_data)
	
	websocketURL = SAVE.loadVar(_data, "websocketURL", DEFAULT_WEBSOCKET_URL)
