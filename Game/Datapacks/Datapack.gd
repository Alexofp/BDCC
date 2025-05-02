extends Reference
class_name Datapack

var id:String = "error"
var name:String = "New pack"
var author:String = "No author"
var version:String = "1.0"

var description:String = "No description provided"

var loadedPath:String = ""

var characters:Dictionary = {}
var skins:Dictionary = {}
var scenes:Dictionary = {}
var flags:Dictionary = {}
var quests:Dictionary = {}

var requiredDatapacks:Array = []
var reqDatapackToName:Dictionary = {}
var requiredMods:Array = []

func getEditVars():
	var datapacksFancy = []
	for datapackID in GlobalRegistry.getDatapacks().keys():
		if(datapackID == id):
			continue
		datapacksFancy.append([datapackID, GlobalRegistry.getDatapack(datapackID).name])
	
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
		"version": {
			name = "Version",
			type = "string",
			value = version,
		},
		"description": {
			name = "Description",
			type = "bigString",
			value = description,
		},
		"requiredMods": {
			type = "addRemoveList",
			value = requiredMods,
			name = "Required Mods",
			values = GlobalRegistry.getLoadedMods(),
			collapsable = true,
		},
		"requiredDatapacks": {
			type = "addRemoveList",
			value = requiredDatapacks,
			name = "Required Datapacks",
			values = datapacksFancy,
			addtoprev=true,
			noseparator=true,
		},
		"characters": {
			type = "editor",
			value = characters,
			name = "Characters",
			editorKind = "character",
			datapack = self,
		},
		"skins": {
			type = "editor",
			value = skins,
			name = "Skins",
			editorKind = "skin",
			datapack = self,
		},
		"scenes": {
			type = "editor",
			value = scenes,
			name = "Scenes",
			editorKind = "scene",
			datapack = self,
		},
		"quests": {
			type = "editor",
			value = quests,
			name = "Quests",
			editorKind = "quest",
			datapack = self,
		},
	}

func applyEditVar(varid, value):
	if(varid == "id"):
		id = value
	if(varid == "name"):
		name = value
	if(varid == "author"):
		author = value
	if(varid == "version"):
		version = value
	if(varid == "description"):
		description = value
	if(varid == "requiredDatapacks"):
		requiredDatapacks = value
		reqDatapackToName = {}
		for datapackID in requiredDatapacks:
			var datapack = GlobalRegistry.getDatapack(datapackID)
			if(datapack != null):
				reqDatapackToName[datapackID] = datapack.name
	if(varid == "requiredMods"):
		requiredMods = value
	
	return false

func saveData():
	var charData = {}
	for charID in characters:
		charData[charID] = characters[charID].saveData()
	
	var skinData = {}
	for skinID in skins:
		skinData[skinID] = skins[skinID].saveData()
	
	var sceneData = {}
	for sceneID in scenes:
		sceneData[sceneID] = scenes[sceneID].saveData()
	
	var questData = {}
	for questID in quests:
		questData[questID] = quests[questID].saveData()
	
	return {
		#"id": id,
		"name": name,
		"author": author,
		"version": version,
		"description": description,
		"characters": charData,
		"skins": skinData,
		"scenes": sceneData,
		"flags": flags,
		"quests": questData,
		"requiredDatapacks": requiredDatapacks,
		"requiredMods": requiredMods,
		"reqDatapackToName": reqDatapackToName,
	}

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue

func loadData(_data):
	#id = loadVar(_data, "id", "error")
	name = loadVar(_data, "name", "No name")
	author = loadVar(_data, "author", "No author")
	version = loadVar(_data, "version", "1.0")
	description = loadVar(_data, "description", "No description found")
	requiredDatapacks = loadVar(_data, "requiredDatapacks", [])
	requiredMods = loadVar(_data, "requiredMods", [])
	reqDatapackToName = loadVar(_data, "reqDatapackToName", {})
	
	var charData = loadVar(_data, "characters", {})
	characters.clear()
	for charID in charData:
		var newCharacter:DatapackCharacter = DatapackCharacter.new()
		newCharacter.id = charID
		newCharacter.loadData(loadVar(charData, charID, {}))
		characters[charID] = newCharacter
	
	var skinData = loadVar(_data, "skins", {})
	skins.clear()
	for skinID in skinData:
		var newSkin:DatapackSkin = DatapackSkin.new()
		newSkin.id = skinID
		newSkin.author = author
		newSkin.datapackID = id
		newSkin.loadData(loadVar(skinData, skinID, {}))
		skins[skinID] = newSkin
	
	var sceneData = loadVar(_data, "scenes", {})
	scenes.clear()
	for sceneID in sceneData:
		var newScene:DatapackScene = DatapackScene.new()
		newScene.id = sceneID
		newScene.loadData(loadVar(sceneData, sceneID, {}))
		scenes[sceneID] = newScene
	
	var flagsData = loadVar(_data, "flags", {})
	flags = {}
	for flagName in flagsData:
		var flagData = flagsData[flagName]
		
		if(!flagData.has("type") || !flagData.has("default")):
			continue
			
		flags[flagName] = {
			type = flagData["type"],
			default = flagData["default"],
		}
		
	var questData = loadVar(_data, "quests", {})
	quests.clear()
	for questID in questData:
		var newQuest:DatapackQuest = DatapackQuest.new()
		newQuest.id = questID
		newQuest.loadData(loadVar(questData, questID, {}))
		quests[questID] = newQuest
	
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
	if(!quests.empty()):
		resultDat.append(str(quests.size())+" quest"+("s" if quests.size() != 1 else ""))
	if(resultDat.size() <= 0):
		return "Contains: Nothing"
	else:
		return "Contains: "+(Util.join(resultDat, ", "))

func getRequiredModsString() -> String:
	return getRequiredModsStringStatic(requiredMods, requiredDatapacks, reqDatapackToName)

static func getRequiredModsStringStatic(_requiredMods, _requiredDatapacks, _reqDatapackToName, _datapacklinks = {}):
	var resultMods = []
	for mod in _requiredMods:
		if(!(mod in GlobalRegistry.getLoadedMods())):
			resultMods.append("[color=red]"+str(mod)+"[/color]")
		else:
			resultMods.append("[color=#4FFF4F]"+str(mod)+"[/color]")
	var resultDatapacks = []
	for datapackID in _requiredDatapacks:
		var datapackName = datapackID+".res"
		if(_reqDatapackToName.has(datapackID)):
			datapackName = _reqDatapackToName[datapackID]
		
		if(!GlobalRegistry.datapacks.has(datapackID)):
			var theText = "[color=red]"+str(datapackName)+"[/color]"
			
			if(_datapacklinks.has(datapackID)):
				theText += "[url=SELECT:"+str(datapackID)+"](Select)[/url]"
			resultDatapacks.append(theText)
		else:
			resultDatapacks.append("[color=#4FFF4F]"+str(datapackName)+"[/color]")
	var res = []
	if(resultMods.size() > 0):
		res.append("Required mods: "+Util.join(resultMods, ", "))
	if(resultDatapacks.size() > 0):
		res.append("Required datapacks: "+Util.join(resultDatapacks, ", "))
	
	return Util.join(res, "\n")

func saveToResource() -> DatapackResource:
	var newDatapackResource:DatapackResource = DatapackResource.new()
	
	newDatapackResource.version = 1
	newDatapackResource.id = id
	
	newDatapackResource.data = saveData()#getEditVarsOnlyValues()
	
	return newDatapackResource

func loadFromResource(datapack:DatapackResource):
	var datapackversion = datapack.version
	
	if((datapackversion is int) && (datapackversion in [1])):
		id = datapack.id
		
		var theData = datapack.data
		if(theData is Dictionary):
			loadData(theData)
			#for varID in theData:
			#	applyEditVar(varID, theData[varID])
			return true
		return false
	else:
		Log.printerr("Tried to load a datapack with a bad version: "+str(version))
		return false

func saveToDisk() -> bool:
	var theResource:DatapackResource = saveToResource()
	
	var result = ResourceSaver.save(getLoadedPath(), theResource)
	if(result == OK):
		return true
	return false

func getLoadedPath() -> String:
	if(loadedPath != ""):
		return loadedPath
	return GlobalRegistry.getDatapacksFolder().plus_file(getDatapackFileName())

func getDatapackFileName() -> String:
	return id+".res"

func needsTogglingOn():
	return !characters.empty() || !scenes.empty() || !quests.empty()

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

func getScene(theID):
	if(!scenes.has(theID)):
		return null
	return scenes[theID]

func isStaticDatapack() -> bool:
	return loadedPath.begins_with("res://")
