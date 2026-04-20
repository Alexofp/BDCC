extends Node
class_name SexToyBackend

# Provides toys and ways of interacting with them

var id:String = "FILL ME"
var enabled:bool = false # wants to be enabled
var enabledActually:bool = false

signal devicesChanged

func getName() -> String:
	return "FILL ME"

func getDesc() -> String:
	return "FILL MEEEE"

func setEnabled(_e:bool):
	enabled = _e
	updateEnabled()

# If we want to be enabled and we're also -actually- enabled
func isEnabledActually() -> bool:
	return enabledActually

func updateEnabled():
	var isMangerEnabled:bool = SexToyManager.isEnabled()
	
	if(isMangerEnabled && enabled && !enabledActually):
		enabledActually = true
		onEnabled()
	if((!isMangerEnabled || !enabled) && enabledActually):
		enabledActually = false
		onDisabled()

func onEnabled():
	# Start the toy finding process
	# scanForToys()
	pass

func onDisabled():
	setToys([])

func getSettings() -> Dictionary:
	return {
#		"name": {
#			name = "Name",
#			type = "string",
#			value = name,
#		},
#		"skinImage": {
#			name = "Skin",
#			type = "image",
#			value = skinImage.getImage(),
#		},
#		"skinTypeWeights": {
#			name = "Skin type weights (0 = never, 1.0 = normal, >1.0 = more often)",
#			type = "skinTypeWeights",
#			value = skinTypeWeights,
#		},
	}

func applySetting(_varid:String, _value):
#	if(varid == "name"):
#		name = value
#	if(varid == "skinImage"):
#		skinImage.setImage(value)
#		return true
#	if(varid == "skinTypeWeights"):
#		skinTypeWeights = value
	
	return false # If true, the whole panel refreshes

func getActions() -> Array:
	return [["rescan", "Rescan for toys"]]

func doAction(_id:String):
	if(!isEnabledActually()):
		return
	if(_id == "rescan"):
		scanForToys()

func getNameInList() -> String:
	if(enabledActually):
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
	enabled = SAVE.loadVar(_data, "enabled", false)
	pass
