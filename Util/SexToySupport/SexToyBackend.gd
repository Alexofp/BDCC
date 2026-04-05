extends Node
class_name SexToyBackend

# Provides toys and ways of interacting with them

var id:String = "FILL ME"
var enabled:bool = false

signal devicesChanged

func getSettings() -> Dictionary:
	return {
		"test": {
			
		},
	}

func getSettingValue(_settingID:String):
	return null

func setSettingValue(_settingID:String, _value):
	pass

func notifyDevicesChanged():
	emit_signal("devicesChanged")


func setEnabled(_e:bool):
	enabled = _e

# Called every frame while the manager UI is visible
func getInfo() -> Array:
	return ["test test", "line 2"]

# Is this backend ready to do stuff
func isReady() -> bool:
	return true

# Gets called every second
func processRare(_dt:float):
	pass

func provideToy(_toy) -> bool:
	return SexToyManager.provideToy(self, _toy)

func vibrate(_toy, _strength:float):
	pass

func saveData() -> Dictionary:
	return {
		enabled = enabled,
	}

func loadData(_data:Dictionary):
	enabled = SAVE.loadVar(_data, "enabled", false)
