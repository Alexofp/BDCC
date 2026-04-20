extends Node

var enabled:bool = false

var gameplay:SexToyGameplay

var backends:Dictionary
var toys:Array

var groups:Dictionary

const BackendsFolder := "res://Util/SexToySupport/Backends/"
const TOY_SETTINGS_FILE := "user://toySettings.json"

var rareTimer:float = 0.0

var lastUniqueID:int = 0

var saveTimer:float = 0.0

signal onToyListChange

const DEFAULT_GAMEPLAY_CONFIG := {"triggers":[{"effects":[{"ct":69,"curve":{"points":[[0,0],[0.094,0],[0.112,0.403],[0.126,0.394],[0.153,0.109],[0.193,0],[0.219,0.706],[0.24,0.782],[0.254,0],[0.448,0],[0.463,0.545],[0.488,0.564],[0.5,0.109],[0.529,0],[0.55,0.668],[0.573,0.81],[0.587,0],[0.749,0],[0.759,0.735],[0.777,0.82],[0.801,0.176],[0.817,0],[0.829,0.621],[0.855,0.735],[0.869,0],[1,0]]},"groups":[0],"type":2}],"sf":0.5,"type":0},{"effects":[{"groups":[1],"seq":[0.5,2.5],"type":0}],"type":17},{"effects":[{"ct":5,"curve":{"points":[[0,0],[0.116,1],[0.196,1],[0.311,0.46],[0.393,0.441],[0.471,0.716],[0.541,0.744],[0.64,0.337],[0.735,0.299],[0.808,0.649],[0.902,0.659],[1,0]]},"groups":[0,1],"type":2}],"type":15},{"effects":[{"groups":[0],"seq":[1,2.5],"type":0}],"type":16},{"effects":[{"ct":5,"curve":{"points":[[0,0],[0.013,1],[0.07,1],[0.097,0.441],[0.144,0.45],[0.179,1],[0.24,1],[0.274,0.147],[0.316,1],[0.343,1],[0.383,0.536],[0.435,0.735],[0.483,0.896],[0.532,0.318],[0.569,0.28],[0.594,0.839],[0.661,1],[0.698,0.233],[0.766,0.195],[0.804,0.81],[0.869,0.242],[1,0]]},"groups":[0,1],"type":2}],"type":7},{"effects":[{"groups":[0,1],"seq":[1,0.8],"type":0}],"type":9},{"effects":[{"groups":[0,1],"seq":[1,0.8],"type":0}],"type":10},{"effects":[{"ct":5,"curve":{"points":[[0,0],[0.134,1],[0.32,0],[0.425,0.375],[0.544,0],[0.649,0.63],[0.767,0],[0.874,0.364],[1,0]]},"groups":[0,1],"type":2}],"type":14},{"effects":[{"groups":[1],"seq":[0.5,1],"type":0}],"sm":0.2,"type":4},{"effects":[{"groups":[0,1],"seq":[0.7,2.5],"type":0}],"sf":0.01,"type":3}]}

func _ready(): # Move this into some special method that gets called after loading the data?
	
	for groupIndx in SexToyGroup.ALL:
		var newGroup := SexToyGroupInstance.new()
		newGroup.id = groupIndx
		groups[groupIndx] = newGroup
	
	#if(true):
	#	return
	loadBackendByFolderName("ButtplugIO")
	loadBackendByFolderName("LovenseConnect")
	loadBackendByFolderName("XToysApp")
	
	gameplay = SexToyGameplay.new()
	
	loadFromFile()
	#saveToFile()
	

func setEnabled(_e:bool):
	enabled = _e
	updateEnabled()
	set_process(enabled)
	
func updateEnabled():
	for backendID in backends:
		backends[backendID].updateEnabled()

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
	if(!enabled):
		set_process(enabled)
		return
	
	rareTimer += _delta
	if(rareTimer > 1.0):
		rareTimer = 0.0
		
		for backendID in backends:
			backends[backendID].processRare(1.0)
	
	for groupIndx in groups:
		groups[groupIndx].process(_delta)
	
	if(saveTimer > 0.0):
		saveTimer -= _delta
		if(saveTimer <= 0.0):
			saveToFile()
	
	gameplay.processGameplay(_delta)
	
func markShouldSave():
	if(saveTimer <= 0.0):
		saveTimer = 3.0
	else:
		saveTimer = min(3.0, saveTimer)

func provideToy(_backend, _toy) -> bool:
	for theToy in toys:
		if(theToy.isSameAs(_toy)):
			theToy.backendData = _toy.backendData
			return false
	
	_toy.uniqueID = generateUniqueID()
	#Log.print("NEW TOY ADDED: "+str(_toy.backendDeviceToyID))
	toys.append(_toy)
	markShouldSave()
	emit_signal("onToyListChange")
	return true

func provideToyGet(_backend, _toy):
	for theToy in toys:
		if(theToy.isSameAs(_toy)):
			theToy.backendData = _toy.backendData
			return theToy
	
	_toy.uniqueID = generateUniqueID()
	#Log.print("NEW TOY ADDED: "+str(_toy.backendDeviceToyID))
	toys.append(_toy)
	markShouldSave()
	#emit_signal("onToyListChange")
	return _toy

func setToys(_backend, _toys:Array):
	if(!_backend.enabled):
		_toys = []
	var _backendID:String = _backend.id
	
	var _shouldUpdate:bool = false
	var _oldAm:int = toys.size()
	
	var allCurrentToys:Array = getToysByBackend(_backendID, false)
	var needToFind:int = allCurrentToys.size()
	for theToy in allCurrentToys:
		theToy.missing = true
	for theToy in _toys:
		var theNewToy = provideToyGet(_backend, theToy)
		if(theNewToy && theNewToy.missing):
			theNewToy.missing = false
			_shouldUpdate = true
			needToFind -= 1
	if(needToFind > 0):
		_shouldUpdate = true
	
	if(_oldAm != toys.size()):
		_shouldUpdate = true
	
	if(_shouldUpdate):
		markShouldSave()
		emit_signal("onToyListChange")
		#saveToFile()

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
		if(_onlyAvailable && theToy.isMissing()):
			continue
		if(theToy.type == _type && theToy.group == _group):
			result.append(theToy)
	return result

func getToysByBackend(_backendID:String, _onlyAvailable:bool = true) -> Array:
	var result:Array = []
	for theToy in toys:
		if(_onlyAvailable && theToy.isMissing()):
			continue
		if(theToy.backendID == _backendID):
			result.append(theToy)
	return result

func generateUniqueID() -> int:
	lastUniqueID += 1
	return lastUniqueID

func isEnabled() -> bool:
	return enabled

func sendSexEvent(_event:SexEvent):
	if(!enabled):
		return
	gameplay.sendSexEvent(_event)

func sendTrigger(_triggerID:int, _args:Array = []):
	if(!enabled):
		return
	gameplay.sendTrigger(_triggerID, _args)

func saveToFile():
	Util.writeFile(TOY_SETTINGS_FILE, JSON.print(saveData(), "\t", true))

func loadFromFile():
	var theStr := Util.readFile(TOY_SETTINGS_FILE)
	if(theStr.empty()):
		gameplay.loadData(DEFAULT_GAMEPLAY_CONFIG) # Give the player a default gameplay config on the first load
		return
		
	var jsonResult := JSON.parse(theStr)
	if(jsonResult.error != OK):
		Log.printerr("SexToyManager: Error while loading the options file, the file is not a valid json")
		return
	var saveData = jsonResult.result
	loadData(saveData)

func saveData() -> Dictionary:
	var toysData:Array = []
	for theToy in toys:
		toysData.append({
			type = theToy.type,
			data = theToy.saveData(),
		})
	var backendsData:Dictionary = {}
	for theBackendID in backends:
		var theBackend = backends[theBackendID]
		backendsData[theBackend.id] = theBackend.saveData()
	
	return {
		enabled = enabled,
		lastUniqueID = lastUniqueID,
		toys = toysData,
		backends = backendsData,
		gameplay = gameplay.saveData(),
	}

func loadData(_data:Dictionary):
	enabled = SAVE.loadVar(_data, "enabled", false)
	lastUniqueID = SAVE.loadVar(_data, "lastUniqueID", 0)
	
	toys.clear()
	var toysData:Array = SAVE.loadVar(_data, "toys", [])
	for theToyEntry in toysData:
		var theType:int = SAVE.loadVar(theToyEntry, "type", SexToyType.Unknown)
		if(theType == SexToyType.Vibrator):
			var theToy := SexToyVibrator.new()
			theToy.loadData(SAVE.loadVar(theToyEntry, "data", {}))
			theToy.missing = true
			toys.append(theToy)
	
	var backendsData:Dictionary = SAVE.loadVar(_data, "backends", {})
	for theBackendID in backends:
		var ourBackend = backends[theBackendID]
		if(!backendsData.has(ourBackend.id)):
			continue
		ourBackend.loadData(backendsData[ourBackend.id])
		ourBackend.updateEnabled()
	
	gameplay.loadData(SAVE.loadVar(_data, "gameplay", {}))
	set_process(enabled)
