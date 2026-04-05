extends Node

var enabled:bool = false

var backends:Dictionary
var toys:Array

var groups:Dictionary

const BackendsFolder := "res://Util/SexToySupport/Backends/"

var rareTimer:float = 0.0

func _ready():
	for groupIndx in SexToyGroup.ALL:
		var newGroup := SexToyGroupInstance.new()
		newGroup.id = groupIndx
		groups[groupIndx] = newGroup
	
	#if(true):
	#	return
	loadBackendByFolderName("ButtplugIO")

func setEnabled(_e:bool):
	enabled = _e

func addBackend(_backend):
	add_child(_backend)
	backends[_backend.id] = _backend

func loadBackendByFolderName(_folder:String):
	var _theScenePath:String = BackendsFolder.plus_file(_folder).plus_file(_folder+".tscn")
	
	var theScene:PackedScene = load(_theScenePath)
	if(!theScene):
		return
	addBackend(theScene.instance())

func _process(_delta:float):
	rareTimer += _delta
	if(rareTimer > 1.0):
		rareTimer = 0.0
		
		for backendID in backends:
			backends[backendID].processRare(1.0)
	
	for groupIndx in groups:
		groups[groupIndx].process(_delta)

func provideToy(_backend, _toy) -> bool:
	for theToy in toys:
		if(theToy.isSameAs(_toy)):
			return false
	
	Log.print("NEW TOY ADDED: "+str(_toy.backendDeviceToyID))
	toys.append(_toy)
	return true

# More of a test method
func triggerVibrateAllToys(_intensity:float):
	for theToy in toys:
		if(theToy.type != SexToyType.Vibrator):
			continue
		theToy.vibrate(_intensity)

func getGroup(_groupID:int) -> SexToyGroupInstance:
	if(!groups.has(_groupID)):
		return null
	return groups[_groupID]

func getToysByGroupAndType(_group:int, _type:int, _onlyAvailable:bool = true) -> Array:
	var result:Array = []
	for theToy in toys:
		#TODO: Check if the toy is available
		if(theToy.type == _type && theToy.group == _group):
			result.append(theToy)
	return result

func saveData() -> Dictionary:
	return {
		enabled = enabled,
	}

func loadData(_data:Dictionary):
	enabled = SAVE.loadVar(_data, "enabled", false)
