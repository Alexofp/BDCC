extends Reference
class_name SexToyBase

# It's more of a 'feature' of a toy. Each vibration motor will get its own SexToyBase basically

var id:int = 0
var name:String = "Some toy feature"
var type:int = SexToyType.Unknown

var backendID:String = "" #ButtplugIO
var backendDevice:String # "some toy name"
var backendDeviceToyID:String # could be index like 0. Must always be a string

# Vibrator settings
var group:int = SexToyGroup.Main # Which group is this vibrator assigned to

var backendData:Dictionary # Data that the backend has decided to store for this device

func setBackend(_backendID:String, _backendDevice:String, _backendDeviceToyID:String):
	backendID = _backendID
	backendDevice = _backendDevice
	backendDeviceToyID = _backendDeviceToyID

func isSameAs(_otherToy) -> bool:
	if(type != _otherToy.type):
		return false
	if(backendID != _otherToy.backendID):
		return false
	if(backendDevice != _otherToy.backendDevice):
		return false
	if(backendDeviceToyID != _otherToy.backendDeviceToyID):
		return false
	if(backendData != _otherToy.backendData):
		return false
	
	return true
