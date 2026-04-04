extends SexToyBackend

# Heavily based on https://github.com/erodozer/Godot.Buttplug

# https://buttplug.io/docs/spec/messages
# https://buttplug.io/docs/spec/device_discovery
# https://buttplug.io/docs/spec/device_information
# https://buttplug.io/docs/spec/output

const STATUS_DISCONNECTED := 0
const STATUS_CONNECTING := 1
const STATUS_CONNECTED := 2
const STATUS_TO_TEXT:Array = ["Disconnected", "Connecting", "Connected"]

const DEBUG_BUTTPLUGIO := true

var websocketURL:String = "ws://127.0.0.1:12345"
var _client = WebSocketClient.new()
var connectionStatus:int = STATUS_DISCONNECTED
var messageID:int = 1

onready var test_timer = $"%TestTimer"

#signal device_found(device)
#signal device_removed(device)

func _init():
	id = "ButtplugIO"

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
	
	connectToServer()

func connectToServer() -> bool:
	if(connectionStatus != STATUS_DISCONNECTED):
		#_client.disconnect_from_host()
		return true # Already connected or connecting
	set_process(true)
	connectionStatus = STATUS_CONNECTING
	if(DEBUG_BUTTPLUGIO):
		logDebug("Connecting to server at %s" % websocketURL)
	var err = _client.connect_to_url(websocketURL)
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
		
		test_timer.start()
		return

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
	
#	for device in get_children():
#		emit_signal("device_removed", device)
#		device.queue_free()

#func _add_device(info):
#	var d = ButtplugDevice.new(info, self)
#	d.name = "%d" % d.device_index
#	add_child(d)
#	emit_signal("device_found", d)
#
#func _remove_device(info):
#	var idx = info.DeviceIndex
#	for device in get_children():
#		if device.device_index == idx:
#			emit_signal("device_removed", device)
#			device.queue_free()

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
	yield(get_tree().create_timer(30.0), "timeout")
	stopScan()

func _process(_delta:float):
	_client.poll() # Must be called every frame for a WebSocket

func onError(msg):
	logError(str(msg))

func logDebug(_text:String):
	if(!DEBUG_BUTTPLUGIO):
		return
	Log.print("[Buttplug.IO] "+str(_text))

func logError(_text:String):
	Log.printerr("[Buttplug.IO] "+str(_text))

func _on_TestTimer_timeout():
	logDebug("!!!TEST TIMER!!!")

	sendToButtplugIO("OutputCmd", {
			"DeviceIndex": 0,
			"FeatureIndex": 0,
			"Command": {
				"Vibrate": {
					"Value": 10000,
				}
			}
		})
