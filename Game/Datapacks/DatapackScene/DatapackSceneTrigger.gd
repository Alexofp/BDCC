extends Reference
class_name DatapackSceneTrigger

const TRIGGER_REACT = 0
const TRIGGER_RUN = 1

var triggerType = DatapackSceneTriggerType.EnterAnyRoom
var triggerSettings:Dictionary = {}
var executeType = TRIGGER_REACT

var priority:float = 1.0

var code = preload("res://Game/Datapacks/UI/CrotchCode/SlotCalls.gd").new()

func getName():
	return DatapackSceneTriggerType.getName(triggerType)

func getSetting(settingID, defaultValue = null):
	if(triggerSettings.has(settingID)):
		return triggerSettings[settingID]
	var editVars = DatapackSceneTriggerType.getEditVars(triggerType)
	if(editVars.has(settingID)):
		return editVars[settingID]["value"]
	return defaultValue

func saveData():
	return {
		"triggerType": triggerType,
		"triggerSettings": triggerSettings,
		"executeType": executeType,
		"priority": priority,
		"code": code.saveData(),
	}

func loadData(_data):
	triggerType = loadVar(_data, "triggerType", DatapackSceneTriggerType.None)
	triggerSettings = loadVar(_data, "triggerSettings", {})
	executeType = loadVar(_data, "executeType", TRIGGER_REACT)
	priority = loadVar(_data, "priority", 1.0)
	code.loadData(loadVar(_data, "code", {}))

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue

func getCode():
	return code
