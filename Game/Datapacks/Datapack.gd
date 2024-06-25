extends Reference
class_name Datapack

var id:String = "error"
var name:String = "New pack"
var author:String = "No author"

var description:String = "No description provided"

var characters:Dictionary = {}
var skins:Dictionary = {}
var scenes:Dictionary = {}

func getEditVars():
	return {
		"id": {
			name = "ID",
			type = "string",
			value = id,
			noSave = true,
		},
		"name": {
			name = "Name",
			type = "string",
			value = name,
		},
		"author": {
			name = "Author",
			type = "string",
			value = author,
		},
		"description": {
			name = "Description",
			type = "string",
			value = description,
		},
		"characters": {
			type = "editor",
			value = characters,
			name = "Characters",
			editorKind = "character",
		},
		"skins": {
			type = "editor",
			value = skins,
			name = "Skins",
			editorKind = "skin",
		},
	}

func applyEditVar(varid, value):
	if(varid == "id"):
		id = value
	if(varid == "name"):
		name = value
	if(varid == "author"):
		author = value
	if(varid == "description"):
		description = value
	
	return false

func saveData():
	var charData = {}
	for charID in characters:
		charData[charID] = characters[charID].saveData()
	
	return {
		#"id": id,
		"name": name,
		"author": author,
		"description": description,
		"characters": charData,
	}

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue

func loadData(_data):
	#id = loadVar(_data, "id", "error")
	name = loadVar(_data, "name", "No name")
	author = loadVar(_data, "author", "No author")
	description = loadVar(_data, "description", "No description found")
	
	var charData = loadVar(_data, "characters", {})
	characters.clear()
	for charID in charData:
		var newCharacter:DatapackCharacter = DatapackCharacter.new()
		newCharacter.id = charID
		newCharacter.loadData(loadVar(charData, charID, {}))
		characters[charID] = newCharacter
	
func getEditVarsOnlyValues():
	var result = {}
	var editVars = getEditVars()
	for editVarID in editVars:
		if(editVars[editVarID].has("noSave") && editVars[editVarID]["noSave"]):
			continue
		result[editVarID] = editVars[editVarID]["value"]
	return result

func getContainsString() -> String:
	var resultDat = []
	if(!characters.empty()):
		resultDat.append(str(characters.size())+" character"+("s" if characters.size() != 1 else ""))
	if(!skins.empty()):
		resultDat.append(str(skins.size())+" skin"+("s" if skins.size() != 1 else ""))
	if(!scenes.empty()):
		resultDat.append(str(scenes.size())+" scene"+("s" if scenes.size() != 1 else ""))
	if(resultDat.size() <= 0):
		return "Contains: Nothing"
	else:
		return "Contains: "+(Util.join(resultDat, ", "))

func saveToResource() -> DatapackResource:
	var newDatapackResource:DatapackResource = DatapackResource.new()
	
	newDatapackResource.version = 1
	newDatapackResource.id = id
	
	newDatapackResource.data = saveData()#getEditVarsOnlyValues()
	
	return newDatapackResource

func loadFromResource(datapack:DatapackResource):
	var version = datapack.version
	
	if((version is int) && (version in [1])):
		id = datapack.id
		
		var theData = datapack.data
		if(theData is Dictionary):
			loadData(theData)
			#for varID in theData:
			#	applyEditVar(varID, theData[varID])
	else:
		Log.printerr("Tried to load a datapack with a bad version: "+str(version))

func saveToDisk() -> bool:
	var theResource:DatapackResource = saveToResource()
	
	var result = ResourceSaver.save(GlobalRegistry.getDatapacksFolder().plus_file(getDatapackFileName()), theResource)
	if(result == OK):
		return true
	return false
	
func getDatapackFileName() -> String:
	return id+".res"

func needsTogglingOn():
	return !characters.empty() || !scenes.empty()

func getFinalCharacterID(charID):
	return id + ":" + charID

func getSkinIDs():
	var result = []
	
	for skinID in skins:
		result.append(id+":"+skinID)
	
	return result

func getName():
	return name

func getFancyName():
	return name + " (by "+author+")"
