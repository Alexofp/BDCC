extends Node

var currentSavefileVersion = 2
var maxBackupQuicksaves = 3

var loadedSavefileVersion = -1

func saveData():
	var data = {
		"savefile_version": currentSavefileVersion,
		"currentUniqueID_DONT_TOUCH": GlobalRegistry.currentUniqueID,
		"currentChildUniqueID_DONT_TOUCH": GlobalRegistry.currentChildUniqueID,
	}
	
	data["player"] = GM.main.getOriginalPC().saveData()
	if(GM.main.getOverriddenPC() != null):
		data["player_override"] = GM.main.getOverriddenPC().saveData()
	
	var charactersData = {}
	for characterID in GlobalRegistry.getCharacters():
		charactersData[characterID] = GlobalRegistry.getCharacter(characterID).saveData()
	
	data["characters"] = charactersData
	
	data["main"] = GM.main.saveData()
	
	return data

func loadData(data: Dictionary):
	if(!data.has("savefile_version")):
		Log.printerr("Error: Save file doesn't have a version in it. It might not be a savefile")
		return
	if(data["savefile_version"] > currentSavefileVersion):
		Log.printerr("Error: This savefile is not supported, sorry. Current supported version: "+str(currentSavefileVersion)+". Savefile version: "+data["savefile_version"])
		return
		
	loadedSavefileVersion = data["savefile_version"]
		
	GlobalRegistry.currentUniqueID = SAVE.loadVar(data, "currentUniqueID_DONT_TOUCH", 0)
	GlobalRegistry.currentChildUniqueID = SAVE.loadVar(data, "currentChildUniqueID_DONT_TOUCH", 0)
	
	GM.main.getOriginalPC().loadData(data["player"])
	
	if(GM.main.getOverriddenPC() != null):
		GM.main.clearOverridePC()
	if(data.has("player_override") && data["player_override"] != null):
		GM.main.overridePC()
		GM.main.getOverriddenPC().loadData(data["player_override"])
	
	var charactersData = SAVE.loadVar(data, "characters", {})
	for characterID in charactersData:
		var character = GlobalRegistry.getCharacter(characterID)
		if(character == null):
			continue
		character.loadData(charactersData[characterID])
	
	GM.main.loadData(SAVE.loadVar(data, "main", {}))
	
	# post loading refresh
	GM.main.loadingSavefileFinished()
	GM.ui.loadingSavefileFinished()
	
func canSave():
	return GM.main.canSave()
	
func saveGame(_path):
	if(!canSave()):
		print("Can't save because one of the scenes doesn't support saving")
		return
	
	var saveData = saveData()
	var save_game = File.new()
	save_game.open(_path, File.WRITE)
	
	save_game.store_line(JSON.print(saveData, "\t", true))
	
	save_game.close()
	
func saveGameFromText(filepath: String, savedatastring):
	var save_game = File.new()
	save_game.open("user://saves/"+filepath.get_file().get_basename()+".save", File.WRITE)
	save_game.store_line(savedatastring)
	save_game.close()

func loadGameRelative(_name):
	loadGame("user://saves/"+_name+".save")
	
func saveGameRelative(_name):
	saveGame("user://saves/"+_name+".save")
	
func loadGame(_path):
	var save_game = File.new()
	if not save_game.file_exists(_path):
		assert(false, "Save file is not found in "+str(_path))
		return # Error! We don't have a save to load.
	
	save_game.open(_path, File.READ)
	#var saveData = parse_json(save_game.get_as_text())
	var jsonResult = JSON.parse(save_game.get_as_text())
	
	if(jsonResult.error != OK):
		assert(false, "Trying to load a bad save file "+str(_path))
		return
	
	var saveData = jsonResult.result
	loadData(saveData)
	save_game.close()

func switchToGameAndLoad(_path):
	#var _ok = get_tree().change_scene("res://Game/MainScene.tscn")
	GM.ui.prepareToGame()
	yield(get_tree(),"idle_frame")
	loadGame(_path)

func switchToGameAndResumeLatestSave():
	var saves: Array = getSavesSortedByDate()
	
	if(saves.size() > 0):
		#var _ok = get_tree().change_scene("res://Game/MainScene.tscn")
		GM.ui.prepareToGame()
		yield(get_tree(),"idle_frame")
		loadGame(saves[0])

func getLoadedSavefileVersion():
	return loadedSavefileVersion
	
func getCurrentSavefileVersion():
	return currentSavefileVersion

func isUpdatingFromSaveVersion(oldSaveVersion: int):
	if(loadedSavefileVersion < 0):
		return false

	if(currentSavefileVersion <= oldSaveVersion):
		return false
		
	if(oldSaveVersion >= loadedSavefileVersion):
		return true

	return false

func loadVar(data: Dictionary, key, nullvalue = null):
	if(!data.has(key)):
		Log.printerr("Warning: Save doesn't have key "+key+". Using "+str(nullvalue)+" as default value. "+Util.getStackFunction())
		return nullvalue
		
	if(nullvalue != null && typeof(data[key]) != typeof(nullvalue) && !(typeof(data[key]) == TYPE_REAL && typeof(nullvalue) == TYPE_INT)):
		Log.printerr("Warning: value mismatch when loading a save. Key '"+key+"' has type "+Util.variantTypeToString(typeof(data[key]))+" and default value has type "+Util.variantTypeToString(typeof(nullvalue))+". Is that an error? "+Util.getStackFunction())
		
	if(data[key] == null && nullvalue != null):
		Log.printerr("Warning: loaded value is null while the default value isn't. Is that correct? "+Util.getStackFunction())
		
	return data[key]

func recursiveQuickSaveMakeBackup(currentI = 1):
	var quickSaveName = "quicksave"
	if(currentI > 1):
		quickSaveName += " backup" + str(currentI)
	var quickSaveFullname = "user://saves/"+quickSaveName+".save"
	
	var d = Directory.new()
	if(d.file_exists(quickSaveFullname)):
		recursiveQuickSaveMakeBackup(currentI + 1)
		
		if(currentI >= maxBackupQuicksaves):
			d.remove(quickSaveFullname)
			#print("I REMOVED "+quickSaveFullname)
			return
		
		var i = currentI + 1
		var newQuickSaveName = "quicksave backup"+str(i)
		var newQuickSaveFullname = "user://saves/"+newQuickSaveName+".save"
		d.rename(quickSaveFullname, newQuickSaveFullname)
		#print("RENAMING "+quickSaveFullname+" TO "+newQuickSaveFullname)

func makeQuickSave():
	recursiveQuickSaveMakeBackup()
	
	saveGame("user://saves/quicksave.save")

func loadQuickSave():
	loadGame("user://saves/quicksave.save")

func getAllSavePaths():
	var saves = []
	var path = "user://saves/"
	
	var dir = Directory.new()
	dir.open(path)
	var hasHolder = dir.open(path)
	if(hasHolder != OK):
		return []
	dir.list_dir_begin(true)
	
	var subpath = dir.get_next()
	while(!subpath.empty()):
		if dir.current_is_dir():
			subpath = dir.get_next()
			continue
			
		if(subpath.get_extension() == "save"):
			saves.append(path.plus_file(subpath))
		subpath = dir.get_next()
	dir.list_dir_end()
	return saves

func canResumeGame():
	var saves = getAllSavePaths()
	if(saves.size() > 0):
		return true
	return false

func customSavePathComparison(a, b):
	return a[1] > b[1]

func getSavesSortedByDate():
	var savesPaths = getAllSavePaths()
	var sortedSavePaths = []
	var file = File.new()
	for path in savesPaths:
		var fileModifTime = file.get_modified_time(path)
		sortedSavePaths.append([path, fileModifTime])
	sortedSavePaths.sort_custom(self, "customSavePathComparison")
	
	var result = []
	for sortedSaveData in sortedSavePaths:
		result.append(sortedSaveData[0])
	return result

func loadGameInformationFromSave(_path):
	var save_game = File.new()
	if not save_game.file_exists(_path):
		assert(false, "Save file is not found in "+str(_path))
		return null
	
	save_game.open(_path, File.READ)
	var jsonResult = JSON.parse(save_game.get_as_text())
	if(jsonResult.error != OK):
		return null

	var data = jsonResult.result
	
	if(!data.has("savefile_version")):
		Log.printerr("Error: Save file doesn't have a version in it. It might not be a savefile")
		return null
	if(data["savefile_version"] > currentSavefileVersion):
		Log.printerr("Error: This savefile is not supported, sorry. Current supported version: "+str(currentSavefileVersion)+". Savefile version: "+data["savefile_version"])
		return	null
	
	var playerName = data["player"]["gamename"]
	var playerCredits = data["player"]["credits"]
	var playerLocation = data["player"]["location"]
	var gameDays = data["main"]["currentDay"]
	var gameTimeOfDay = data["main"]["timeOfDay"]
	
	save_game.close()
	
	return {
		"gamename": playerName,
		"credits": playerCredits,
		"location": playerLocation,
		"currentDay": gameDays,
		"timeOfDay": gameTimeOfDay,
	}

func deleteSave(path):
	var dir = Directory.new()
	dir.remove(path)
