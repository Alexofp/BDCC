extends Node

var currentSavefileVersion = 1
const useJson = true # Json is easier to read, str2var supports more types? Json will probably be dropped at some point

func saveData():
	var data = {
		"savefile_version": currentSavefileVersion,
		"currentUniqueID_DONT_TOUCH": GlobalRegistry.currentUniqueID,
	}
	
	data["player"] = GM.pc.saveData()
	
	var charactersData = {}
	for characterID in GlobalRegistry.getCharacters():
		charactersData[characterID] = GlobalRegistry.getCharacter(characterID).saveData()
	
	data["characters"] = charactersData
	
	data["main"] = GM.main.saveData()
	
	return data

func loadData(data: Dictionary):
	if(!data.has("savefile_version")):
		printerr("Error: Save file doesn't have a version in it. It might not be a savefile")
		return
	if(data["savefile_version"] != currentSavefileVersion):
		printerr("Error: This savefile is not supported, sorry. Current supported version: "+str(currentSavefileVersion)+". Savefile version: "+data["savefile_version"])
		return	
	GlobalRegistry.currentUniqueID = SAVE.loadVar(data, "currentUniqueID_DONT_TOUCH", 0)
	
	GM.pc.loadData(data["player"])
	
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
	
	if(useJson):
		save_game.store_line(JSON.print(saveData, "\t", true))
	else:
		save_game.store_line(var2str(saveData))
	
	save_game.close()
	
	
func loadGame(_path):
	var save_game = File.new()
	if not save_game.file_exists(_path):
		assert(false, "Save file is not found in "+str(_path))
		return # Error! We don't have a save to load.
	
	save_game.open(_path, File.READ)
	var saveData
	if(useJson):
		saveData = parse_json(save_game.get_as_text())
	else:
		saveData = str2var(save_game.get_as_text())
	loadData(saveData)
	save_game.close()

func loadVar(data: Dictionary, key, nullvalue = null):
	if(!data.has(key)):
		printerr("Warning: Save doesn't have key "+key+". Using "+str(nullvalue)+" as default value. File: "+get_stack()[1]["source"]+" Line: "+str(get_stack()[1]["line"]))
		return nullvalue
		
	if(nullvalue != null && typeof(data[key]) != typeof(nullvalue) && !(typeof(data[key]) == TYPE_REAL && typeof(nullvalue) == TYPE_INT)):
		printerr("Warning: value mismatch when loading a save. Key '"+key+"' has type "+Util.variantTypeToString(typeof(data[key]))+" and default value has type "+Util.variantTypeToString(typeof(nullvalue))+". Is that an error? File: "+get_stack()[1]["source"]+" Line: "+str(get_stack()[1]["line"]))
		
	if(data[key] == null && nullvalue != null):
		printerr("Warning: loaded value is null while the default value isn't. Is that correct? File: "+get_stack()[1]["source"]+" Line: "+str(get_stack()[1]["line"]))
		
	return data[key]
