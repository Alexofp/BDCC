extends Reference
class_name DatapackSceneTrigger

const TRIGGER_REACT = 0
const TRIGGER_RUN = 1

var triggerType = DatapackSceneTriggerType.EnterAnyRoom
var triggerSettings:Dictionary = {}
var executeType = TRIGGER_REACT

var priority:float = 1.0

var code = preload("res://Game/Datapacks/UI/CrotchCode/SlotCalls.gd").new()

var buttonName:String = "Button name"
var buttonDesc:String = "This button will do something"

func getName():
	return DatapackSceneTriggerType.getName(triggerType)

func saveData():
	return {
		"triggerType": triggerType,
		"triggerSettings": triggerSettings,
		"executeType": executeType,
		"priority": priority,
		"buttonName": buttonName,
		"buttonDesc": buttonDesc,
		"code": code.saveData(),
	}

func loadData(_data):
	triggerType = loadVar(_data, "triggerType", DatapackSceneTriggerType.None)
	triggerSettings = loadVar(_data, "triggerSettings", {})
	executeType = loadVar(_data, "executeType", TRIGGER_REACT)
	priority = loadVar(_data, "priority", 1.0)
	buttonName = loadVar(_data, "buttonName", "Button name")
	buttonDesc = loadVar(_data, "buttonDesc", "This button will do something")
	code.loadData(loadVar(_data, "code", {}))

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue

func getCode():
	return code
