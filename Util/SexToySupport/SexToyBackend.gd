extends Node
class_name SexToyBackend

# Provides toys and ways of interacting with them

var id:String = "FILL ME"
var enabled:bool = false

signal devicesChanged

func getName() -> String:
	return "FILL ME"

func getDesc() -> String:
	return "FILL MEEEE"

func setEnabled(_e:bool):
	enabled = _e
	if(enabled):
		scanForToys()
	else:
		setToys([])

func getSettings() -> Dictionary:
	return {
		"test": {
			
		},
	}

func getSettingValue(_settingID:String):
	return null

func setSettingValue(_settingID:String, _value):
	pass

func getNameInList() -> String:
	if(enabled):
		return getName()
	return getName()+" (disabled)"

func notifyDevicesChanged():
	emit_signal("devicesChanged")

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

# The ones that weren't added to the array are gonna be considered 'missing'
func setToys(_toys:Array):
	SexToyManager.setToys(self, _toys)

func vibrate(_toy, _strength:float):
	pass

func scanForToys():
	pass

func saveData() -> Dictionary:
	return {
		enabled = enabled,
	}

func loadData(_data:Dictionary):
	var newEnabled:bool = SAVE.loadVar(_data, "enabled", false)

	setEnabled(newEnabled)
