extends Reference
class_name SexToyBase

# It's more of a 'feature' of a toy. Each vibration motor will get its own SexToyBase basically

var uniqueID:int = 0
var name:String = "Some toy feature"
var type:int = SexToyType.Unknown

var backendID:String = "" #ButtplugIO
var backendDevice:String # "some toy name"
var backendFeature:String # "some motor"
var backendDeviceToyID:String # could be index like 0. Must always be a string

var group:int = SexToyGroup.Main # Which group is this toy assigned to
var missing:bool = false

var backendData:Dictionary # Data that the backend has decided to store for this device. This one gets saved and loaded!
var backendDataNoSave:Dictionary # Same but this one doesn't get saved/loaded

func getName() -> String:
	return name

func getNameInList() -> String:
	if(!missing):
		return getName()
	return getName()+" (missing)"

func setBackend(_backendID:String, _backendDevice:String, _backendFeature:String, _backendDeviceToyID:String):
	backendID = _backendID
	backendDevice = _backendDevice
	backendFeature = _backendFeature
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
	if(backendFeature != _otherToy.backendFeature):
		return false
	#if(backendData != _otherToy.backendData):
	#	return false
	
	return true

func isMissing() -> bool:
	return missing

func getSettings() -> Dictionary:
	var theGroupsValues:Array = []
	for theGroup in SexToyGroup.ALL:
		theGroupsValues.append([theGroup, SexToyGroup.getName(theGroup)])
	
	return {
		"name": {
			name = "Name",
			type = "string",
			value = name,
		},
		"group": {
			name = "Group",
			type = "selector",
			value = group,
			values = theGroupsValues,
		},
	}

func applySetting(_varid:String, _value):
	if(_varid == "name"):
		name = _value
		return true
	if(_varid == "group"):
		group = _value
	
	return false

func getSettingsFinal() -> Dictionary:
	return getSettings()

func applySettingFinal(_varid:String, _value):
	return applySetting(_varid, _value)

func saveData() -> Dictionary:
	return {
		uniqueID = uniqueID,
		name = name,
		type = type,
		backendID = backendID,
		backendDevice = backendDevice,
		backendFeature = backendFeature,
		backendDeviceToyID = backendDeviceToyID,
		group = group,
		backendData = backendData,
	}
func loadData(_data:Dictionary):
	uniqueID = SAVE.loadVar(_data, "uniqueID", 0)
	name = SAVE.loadVar(_data, "name", "Some toy feature")
	type = SAVE.loadVar(_data, "type", SexToyType.Unknown)
	backendID = SAVE.loadVar(_data, "backendID", "")
	backendDevice = SAVE.loadVar(_data, "backendDevice", "")
	backendFeature = SAVE.loadVar(_data, "backendFeature", "")
	backendDeviceToyID = SAVE.loadVar(_data, "backendDeviceToyID", "")
	group = SAVE.loadVar(_data, "group", SexToyGroup.Main)
	backendData = SAVE.loadVar(_data, "backendData", {})
	pass
