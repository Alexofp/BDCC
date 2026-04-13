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
