extends Node

var game_version_major = 0
var game_version_minor = 0
var game_version_revision = 18
var game_version_suffix = ""

var currentUniqueID = 0
var currentChildUniqueID = 0

var scenes: Dictionary = {}
var sceneCreators: Dictionary = {}
var bodyparts: Dictionary = {}
var characters: Dictionary = {}
var characterClasses: Dictionary = {}
var attacks: Dictionary = {}
var statusEffects: Dictionary = {}
var allSpecies: Dictionary = {}
var items: Dictionary = {}
var itemsRefs: Dictionary = {}
var itemsByTag: Dictionary = {}
var buffs: Dictionary = {}
var events: Dictionary = {}
var modules: Dictionary = {}
var quests: Dictionary = {}
var stats: Dictionary = {}
var skills: Dictionary = {}
var perks: Dictionary = {}
var perksBySkillGroups: Dictionary = {}
var perksObjects: Dictionary = {}
var lustTopics: Dictionary = {}
var lustTopicsObjects: Array = []
var stageScenes: Dictionary = {}
var lustActions: Dictionary = {}
var defaultLustActions: Array = []
var orgasmLustActions: Array = []
var lootLists: Dictionary = {}
var lootListsByCharacter: Dictionary = {}
var lootListsByBattle: Dictionary = {}
var fightClubFightersByRank: Dictionary = {}
var fightClubFighters: Dictionary = {}
var mapFloors: Dictionary = {}
var imagePacks: Dictionary = {}
var worldEdits: Dictionary = {}
var regularWorldEdits: Array = []
var sexSubActions: Dictionary = {}
var sexDomActions: Dictionary = {}
var sexActivities: Dictionary = {}
var sexActivitiesReferences: Dictionary = {}

var bodypartStorageNode

var sceneCache: Dictionary = {}

var cachedDonationData = null
var cachedLocalDonationData = null
var donationDataRequest: HTTPRequest
signal donationDataUpdated

var modsSupport = false
var loadedMods = []

func hasModSupport():
	return modsSupport

func getLoadedMods():
	return loadedMods

func loadMods():
	# If we're in editor we have to do this silly thing
	# read more here: https://github.com/godotengine/godot/issues/19815
	if(OS.has_feature("editor")):
		var _haveBase = ProjectSettings.load_resource_pack("res://BDCC.pck")
		if(!_haveBase):
			modsSupport = false
			return
	else:
		modsSupport = true
	
	var modsFolder = "user://mods"
	if(OS.get_name() == "Android"):
		var permissions: Array = OS.get_granted_permissions() #for Godot 3 branch
		if permissions.has("android.permission.READ_EXTERNAL_STORAGE"):
			var externalDir:String = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS, true)
			var finalDir = externalDir.plus_file("BDCCMods")
			modsFolder = finalDir
	
	var dir = Directory.new()
	if dir.open(modsFolder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
			else:
				if(file_name.get_extension() in ["pck", "zip"]):
					var full_path = modsFolder.plus_file(file_name)
					#print("Registered mod: " + full_path)
					var _ok = ProjectSettings.load_resource_pack(full_path)
					if(_ok):
						loadedMods.append(file_name)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+modsFolder)
	

func _init():
	loadMods()
	
	bodypartStorageNode = Node.new()
	add_child(bodypartStorageNode)
	bodypartStorageNode.name = "Bodyparts"	
	
func startLoadingDonationData():
	var file = File.new()
	if(file.file_exists("res://DonationInfo.json")):
		file.open("res://DonationInfo.json", File.READ)
		var content = file.get_as_text()
		file.close()
		
		var jsonResult = JSON.parse(content)
		if(jsonResult.error == OK):
			cachedLocalDonationData = jsonResult.result
	
	donationDataRequest = HTTPRequest.new()
	add_child(donationDataRequest)
	var _ok = donationDataRequest.connect("request_completed", self, "onDonationDataRequest")
	var _ok2 = donationDataRequest.request("https://raw.githubusercontent.com/Alexofp/BDCC/main/DonationInfo.json")

func validateDonationData(donationData):
	if(!(donationData is Dictionary)):
		return false
	if(!donationData.has("dateString") || !donationData.has("unixTime") || !donationData.has("entries") || !(donationData["entries"] is Dictionary) || !donationData.has("tiers") || !(donationData["tiers"] is Array)):
		return false
	for tierName in donationData["entries"]:
		var tier = donationData["entries"][tierName]
		if(!(tier is Array)):
			return false
		for entry in tier:
			var requiredFields = ["nickname"]
			for req in requiredFields:
				if(!entry.has(req)):
					return false
	return true

func onDonationDataRequest(result, _response_code, _headers, body):
	if result != HTTPRequest.RESULT_SUCCESS:
		Log.printerr("[onDonationDataRequest] Couldn't get data from github")
		return
	
	var jsonResult = JSON.parse(body.get_string_from_utf8())
	if(jsonResult.error != OK):
		Log.printerr("[onDonationDataRequest] Couldn't parse json data from github.")
		return
	
	var donationData = jsonResult.result

	if(!validateDonationData(donationData)):
		Log.printerr("[onDonationDataRequest] Bad data from github")
		return
	
	cachedDonationData = donationData
	emit_signal("donationDataUpdated")

func getDonationDataString():
	var theData
	if(cachedDonationData == null):
		theData = cachedLocalDonationData
	else:
		if(cachedDonationData["unixTime"] >= cachedLocalDonationData["unixTime"]):
			theData = cachedDonationData
		else:
			theData = cachedLocalDonationData
	
	if(theData == null || !validateDonationData(theData)):
		return ""
	
	var newText = "[center][b][url=https://subscribestar.adult/rahi]SubscribeStar[/url][/b]\nCompiled "+str(theData["dateString"])+"\n\n"
	
	for tierName in theData["tiers"]:
		if(!theData["entries"].has(tierName)):
			continue
		newText += "[b]"+tierName+" tier[/b]\n"
		for entry in theData["entries"][tierName]:
			newText += entry["nickname"]+"\n"
		newText += "\n"
	newText += "Thank you [color=red]<3[/color][/center]"
	return newText

func _ready():
	startLoadingDonationData()
	
	registerBodypartFolder("res://Player/Bodyparts/Legs/")
	registerBodypartFolder("res://Player/Bodyparts/Breasts/")
	registerBodypartFolder("res://Player/Bodyparts/Hair/")
	registerBodypartFolder("res://Player/Bodyparts/Tail/")
	registerBodypartFolder("res://Player/Bodyparts/Body/")
	registerBodypartFolder("res://Player/Bodyparts/Head/")
	registerBodypartFolder("res://Player/Bodyparts/Arms/")
	registerBodypartFolder("res://Player/Bodyparts/Ears/")
	registerBodypartFolder("res://Player/Bodyparts/Horns/")
	registerBodypartFolder("res://Player/Bodyparts/Penis/")
	registerBodypartFolder("res://Player/Bodyparts/Anus/")
	registerBodypartFolder("res://Player/Bodyparts/Vagina/")
	
	registerItemFolder("res://Inventory/Items/")
	registerItemFolder("res://Inventory/Items/Underwear/")
	registerItemFolder("res://Inventory/Items/BDSM/")
	registerItemFolder("res://Inventory/Items/StaticBDSM/")
	registerItemFolder("res://Inventory/Items/Weapons/")
	
	registerBuffFolder("res://Inventory/Buffs/")
	
	registerLootListFolder("res://Inventory/LootLists/")
	
	registerStat("res://Skills/Stat/AgilityStat.gd")
	registerStat("res://Skills/Stat/StrengthStat.gd")
	registerStat("res://Skills/Stat/VitalityStat.gd")
	registerStat("res://Skills/Stat/SexinessStat.gd")
	
	registerSkillFolder("res://Skills/Skill/")
	
	registerPerkFolder("res://Skills/Perk/")
	
	registerEventFolder("res://Events/Event/")
	
	registerSceneFolder("res://Scenes/")
	registerSceneFolder("res://Scenes/Intro/")
	registerSceneFolder("res://Scenes/Item/")
	registerSceneFolder("res://Scenes/Cellblock/")
	registerSceneFolder("res://Scenes/Mineshaft/")
	
	registerCharacterFolder("res://Characters/")
	registerCharacterFolder("res://Characters/Generic/")
	
	registerAttackFolder("res://Attacks/")
	registerAttackFolder("res://Attacks/PlayerOnly/")
	registerAttackFolder("res://Attacks/WeaponAttacks/")
	registerAttackFolder("res://Attacks/NpcAttacks/")
	
	registerLustActionFolder("res://Game/LustCombat/LustActions/")
	registerLustActionFolder("res://Game/LustCombat/LustActions/Perk/")
	
	registerLustTopicFolder("res://Game/LustCombat/Topic/")
	
	#registerSexActionsFolder("res://Game/SexEngine/SexActions/")
	registerSexActivitiesFolder("res://Game/SexEngine/SexActivity/")
	
	registerStatusEffectFolder("res://StatusEffect/")
	
	registerSpeciesFolder("res://Species/")
	
	registerQuestFolder("res://Quests/Quest/")
	
	registerStageSceneFolder("res://Player/StageScene3D/Scenes/")
	
	#registerMapFloor("Medical", "res://Game/World/Floors/Medical.tscn")
	registerMapFloorFolder("res://Game/World/Floors/")
	
	registerImagePackFolder("res://Images/ImagePacks/")
	OPTIONS.checkImagePackOrder(imagePacks)
	
	registerModulesFolder("res://Modules/")
	sortFightClubFighters()
	
# The point is that it will still generate unique ids even after saving/loading
func generateUniqueID():
	currentUniqueID += 1
	return currentUniqueID - 1

func generateChildUniqueID():
	currentChildUniqueID += 1
	return currentChildUniqueID - 1

func getGameVersionString():
	return str(game_version_major)+"."+str(game_version_minor)+"."+str(game_version_revision)+str(game_version_suffix)

func registerScene(path: String, creator = null):
	var scene = load(path)
	if(!scene):
		Log.printerr("ERROR: couldn't load scene from path "+path)
		return
	var sceneObject = scene.new()
	scenes[sceneObject.sceneID] = scene
	sceneObject.queue_free()
	if(creator != null):
		sceneCreators[sceneObject.sceneID] = creator

func getSceneCreator(id: String):
	if(!sceneCreators.has(id)):
		return null
	return sceneCreators[id]

func createScene(id: String):
	if(!scenes.has(id)):
		Log.printerr("ERROR: scene with the id "+id+" wasn't found")
		return null
	var scene = scenes[id].new()
	scene.name = scene.sceneID
	return scene

func registerSceneFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered scene: " + full_path)
					registerScene(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)

func registerBodypart(path: String):
	var bodypart = load(path)
	var bodypartObject = bodypart.new()
	bodyparts[bodypartObject.id] = bodypartObject
	bodypartStorageNode.add_child(bodypartObject)

func createBodypart(id: String):
	if(!bodyparts.has(id)):
		Log.printerr("ERROR: bodypart with the id "+id+" wasn't found")
		return null
	return bodyparts[id].duplicate()

func getBodypartRef(id: String):
	if(!bodyparts.has(id)):
		Log.printerr("ERROR: bodypart with the id "+id+" wasn't found")
		return null
	return bodyparts[id]

func getBodypartsIdsBySlot(_slot):
	var result = []
	for bodypartID in bodyparts:
		var bodypart = bodyparts[bodypartID]
		if(bodypart.getSlot() == _slot):
			result.append(bodypartID)
	return result

func registerBodypartFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered bodypart: " + full_path)
					registerBodypart(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)

func registerCharacter(path: String):
	var character = load(path)
	var characterObject = character.new()
	characters[characterObject.id] = characterObject
	characterClasses[characterObject.id] = character
	add_child(characterObject)

func recreateCharacters():
	for characterID in characters:
		var ch = characters[characterID]
		remove_child(ch)
		ch.queue_free()
	
	for characterID in characterClasses:
		var character = characterClasses[characterID]
		var characterObject = character.new()
		characters[characterObject.id] = characterObject
		add_child(characterObject)

func registerCharacterFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered character: " + full_path)
					registerCharacter(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)

func getCharacter(id: String):
	if(id == "pc"):
		return GM.pc
	
	if(!characters.has(id)):
		Log.printerr("ERROR: character with the id "+id+" wasn't found")
		return null
	return characters[id]

func getCharacters():
	return characters

func registerAttack(path: String):
	var attack = load(path)
	var attackObject = attack.new()
	attacks[attackObject.id] = attackObject
	
func registerAttackFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered attack: " + full_path)
					registerAttack(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)

func getAttack(id: String):
	if(!attacks.has(id)):
		Log.printerr("ERROR: attack with the id "+id+" wasn't found")
		return null
	return attacks[id]


func registerStatusEffect(path: String):
	var effect = load(path)
	var effectObject = effect.new()
	statusEffects[effectObject.id] = effect
	effectObject.queue_free()

func registerStatusEffectFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered status effect: " + full_path)
					registerStatusEffect(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func createStatusEffect(id: String):
	if(!statusEffects.has(id)):
		Log.printerr("ERROR: status effect with the id "+id+" wasn't found")
		return null
	return statusEffects[id].new()


func registerSpecies(path: String):
	var species = load(path)
	var speciesObject = species.new()
	allSpecies[speciesObject.id] = speciesObject

func registerSpeciesFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered species: " + full_path)
					registerSpecies(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func getSpecies(id: String):
	if(!allSpecies.has(id)):
		Log.printerr("ERROR: species with the id "+id+" wasn't found")
		return null
	return allSpecies[id]

func getAllPlayableSpecies():
	var result = {}
	for speciesID in allSpecies:
		if(allSpecies[speciesID].isPlayable()):
			result[speciesID] = allSpecies[speciesID]
	return result



func registerItem(path: String):
	var item = load(path)
	var itemObject = item.new()
	items[itemObject.id] = item
	itemsRefs[itemObject.id] = itemObject
	for tag in itemObject.getTags():
		if(!itemsByTag.has(tag)):
			itemsByTag[tag] = []
		itemsByTag[tag].append(itemObject.id)

func registerItemFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered item: " + full_path)
					registerItem(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)

func createItem(id: String, generateID = true):
	if(!items.has(id)):
		Log.printerr("ERROR: item with the id "+id+" wasn't found")
		return null
	var newItem = items[id].new()
	if(generateID):
		newItem.uniqueID = "item"+str(generateUniqueID())
	return newItem

func createItemNoID(id: String):
	return createItem(id, false)

func getItemRef(id: String):
	if(!itemsRefs.has(id)):
		Log.printerr("ERROR: item with the id "+id+" wasn't found")
		return null
	return itemsRefs[id]

func getItemIDsByTag(tag):
	if(!itemsByTag.has(tag)):
		return []
	return itemsByTag[tag]

func getItemRefs():
	return itemsRefs

func registerBuff(path: String):
	var item = load(path)
	var itemObject = item.new()
	buffs[itemObject.id] = item

func registerBuffFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered buff: " + full_path)
					registerBuff(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func createBuff(id: String):
	if(!buffs.has(id)):
		Log.printerr("ERROR: buff with the id "+id+" wasn't found")
		return null
	return buffs[id].new()



func registerEvent(path: String):
	var item = load(path)
	var itemObject = item.new()
	events[itemObject.id] = itemObject

func registerEventFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered event: " + full_path)
					registerEvent(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func getEvent(id: String):
	if(!events.has(id)):
		Log.printerr("ERROR: event with the id "+id+" wasn't found")
		return null
	return events[id]

func getEvents():
	return events

func registerModule(path: String):
	var module = load(path)
	var moduleObject = module.new()
	moduleObject.register()
	modules[moduleObject.id] = moduleObject
	
	print("Module "+moduleObject.id+" by "+moduleObject.author+" was registered")

func getModules():
	return modules

func getModule(id):
	if(!modules.has(id)):
		Log.printerr("ERROR: module with the id "+id+" wasn't found")
		return null
	return modules[id]

func registerQuest(path: String):
	var item = load(path)
	var itemObject = item.new()
	quests[itemObject.id] = itemObject

func registerQuestFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					print("Registered quest: " + full_path)
					registerQuest(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func getQuest(id: String):
	if(!quests.has(id)):
		Log.printerr("ERROR: quest with the id "+id+" wasn't found")
		return null
	return quests[id]

func getQuests():
	return quests

func registerStat(path: String):
	var item = load(path)
	var itemObject = item.new()
	stats[itemObject.id] = itemObject

func getStat(id: String):
	if(!stats.has(id)):
		Log.printerr("ERROR: quest with the id "+id+" wasn't found")
		return null
	return stats[id]

func getStats():
	return stats


func registerSkill(path: String):
	var item = load(path)
	var itemObject = item.new()
	skills[itemObject.id] = item

func registerSkillFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered skill: " + full_path)
					registerSkill(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func createSkill(id: String):
	if(!skills.has(id)):
		Log.printerr("ERROR: skill with the id "+id+" wasn't found")
		return null
	return skills[id].new()

func getSkills():
	return skills


func registerPerk(path: String):
	var item = load(path)
	var itemObject = item.new()
	perks[itemObject.id] = item
	perksObjects[itemObject.id] = itemObject
	var skillGroup = itemObject.getSkillGroup()
	if(!perksBySkillGroups.has(skillGroup)):
		perksBySkillGroups[skillGroup] = []
		
	perksBySkillGroups[skillGroup].append(itemObject.id)

func registerPerkFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered perk: " + full_path)
					registerPerk(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func createPerk(id: String):
	if(!perks.has(id)):
		Log.printerr("ERROR: perk with the id "+id+" wasn't found")
		return null
	return perks[id].new()

func getPerk(id: String):
	if(!perksObjects.has(id)):
		Log.printerr("ERROR: perk with the id "+id+" wasn't found")
		return null
	return perksObjects[id]

func getPerksIDsBySkill(skillID: String):
	if(!perksBySkillGroups.has(skillID)):
		return []
	return perksBySkillGroups[skillID]



func registerLustTopic(path: String):
	var item = load(path)
	var itemObject = item.new()
	var ids = itemObject.handles_ids
	for id in ids:
		assert(!lustTopics.has(id))
		lustTopics[id] = itemObject
	lustTopicsObjects.append(itemObject)

func registerLustTopicFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered lust topic: " + full_path)
					registerLustTopic(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func getLustTopic(id: String):
	if(!lustTopics.has(id)):
		Log.printerr("ERROR: lust topic with the id "+id+" wasn't found")
		return null
	return lustTopics[id]

func getLustTopicObjects():
	return lustTopicsObjects



func registerStageScene(path: String):
	var item:PackedScene = load(path)
	var itemObject = item.instance()
	stageScenes[itemObject.id] = item
	itemObject.queue_free()

func registerStageSceneFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "tscn"):
					var full_path = folder.plus_file(file_name)
					#print("Registered stage scene: " + full_path)
					registerStageScene(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func createStageScene(id: String):
	if(!stageScenes.has(id)):
		Log.printerr("ERROR: stage scene with the id "+id+" wasn't found")
		return null
	return stageScenes[id].instance()

func instanceCached(scenePath):
	if(sceneCache.has(scenePath)):
		return sceneCache[scenePath].instance()
	sceneCache[scenePath] = load(scenePath)
	return sceneCache[scenePath].instance()


func registerLustAction(path: String):
	var item = load(path)
	var itemObject = item.new()
	lustActions[itemObject.id] = itemObject
	if(itemObject.hasByDefault):
		defaultLustActions.append(itemObject.id)
	if(itemObject.isOrgasmAction):
		orgasmLustActions.append(itemObject.id)

func registerLustActionFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered lust action: " + full_path)
					registerLustAction(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func getLustAction(id: String):
	if(!lustActions.has(id)):
		Log.printerr("ERROR: lust action with the id "+id+" wasn't found")
		return null
	return lustActions[id]

func getDefaultLustActions():
	return defaultLustActions

func getOrgasmLustActions():
	return orgasmLustActions


func registerLootList(path: String):
	var item = load(path)
	var itemObject = item.new()
	for id in itemObject.handlesIds:
		if(!lootLists.has(id)):
			lootLists[id] = []
		lootLists[id].append(itemObject)
	for id in itemObject.handlesCharacters:
		if(!lootListsByCharacter.has(id)):
			lootListsByCharacter[id] = []
		lootListsByCharacter[id].append(itemObject)
	for id in itemObject.handlesBattles:
		if(!lootListsByBattle.has(id)):
			lootListsByBattle[id] = []
		lootListsByBattle[id].append(itemObject)

func registerLootListFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered loot list: " + full_path)
					registerLootList(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func getLootLists(id: String):
	if(!lootLists.has(id)):
		return []
	return lootLists[id]

func getLootListsByCharacter(charID: String):
	if(!lootListsByCharacter.has(charID)):
		return []
	return lootListsByCharacter[charID]

func registerModulesFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				var full_path = folder.plus_file(file_name)
				#print("FOUND DIR: "+full_path)
				
				var modulePath:String = full_path.plus_file("Module.gd")
				if(dir.file_exists(modulePath)):
					#print("MODULE FILE: " +modulePath)
					registerModule(modulePath)
				pass
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)

func registerFightClubFighter(path: String):
	var item = load(path)
	var itemObject = item.new()
	
	var rank = itemObject.getRank()
	if(!fightClubFightersByRank.has(rank)):
		fightClubFightersByRank[rank] = []
	
	fightClubFightersByRank[rank].append(itemObject.id)
	fightClubFighters[itemObject.id] = itemObject

func getFightClubFighter(id):
	if(!fightClubFighters.has(id)):
		return null
	return fightClubFighters[id]

func getFightClubFightersIDsByRank(rank):
	if(!fightClubFightersByRank.has(rank)):
		return []
	
	return fightClubFightersByRank[rank]

func sortFightClubFighterFunc(a, b):
	var aFighter = fightClubFighters[a]
	var bFighter = fightClubFighters[b]
	if aFighter.getOrder() > bFighter.getOrder():
		return true
	return false

func sortFightClubFighters():
	for rank in fightClubFightersByRank:
		fightClubFightersByRank[rank].sort_custom(self, "sortFightClubFighterFunc")


func registerMapFloor(id: String, path: String):
	if(mapFloors.has(id)):
		print(id+" floor is being overwritten!")
	mapFloors[id] = path

func registerMapFloorFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "tscn"):
					var full_path = folder.plus_file(file_name)
					#print("Registered map floor: " + full_path)
					registerMapFloor(full_path.get_file().get_basename(), full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)

func getMapFloors():
	return mapFloors


func registerImagePack(path: String):
	var imagepack = load(path)
	var imagepackObject = imagepack.new()
	imagePacks[imagepackObject.id] = imagepackObject

func registerImagePackFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				var full_path = folder.plus_file(file_name)
				#print("FOUND DIR: "+full_path)
				
				var imagePackPath:String = full_path.plus_file("ImagePack.gd")
				if(dir.file_exists(imagePackPath)):
					#print("IMAGE PACK FILE: " +modulePath)
					registerImagePack(imagePackPath)
				pass
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func getImagePack(id: String):
	if(!imagePacks.has(id)):
		Log.printerr("ERROR: image pack with the id "+id+" wasn't found")
		return null
	return imagePacks[id]

func getImagePacks():
	return imagePacks



func registerWorldEdit(path: String):
	var worldEdit = load(path)
	var worldEditObject = worldEdit.new()
	worldEdits[worldEditObject.id] = worldEditObject
	if(worldEditObject.isRegular):
		regularWorldEdits.append(worldEditObject)

func registerWorldEditFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered world edit: " + full_path)
					registerWorldEdit(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func getWorldEdit(id: String):
	if(!worldEdits.has(id)):
		Log.printerr("ERROR: world edit with the id "+id+" wasn't found")
		return null
	return worldEdits[id]

func getWorldEdits():
	return worldEdits

func getRegularWorldEdits():
	return regularWorldEdits





func registerSexAction(path: String):
	var sexAction = load(path)
	var sexActionObject = sexAction.new()
	
	if(sexActionObject.isDomAction):
		sexDomActions[sexActionObject.id] = sexActionObject
	else:
		sexSubActions[sexActionObject.id] = sexActionObject

func registerSexActionsFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered sex action: " + full_path)
					registerSexAction(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func getSexAction(id: String):
	if(sexDomActions.has(id)):
		return sexDomActions[id]
	elif(sexSubActions.has(id)):
		return sexSubActions[id]
	else:
		Log.printerr("ERROR: sex action with the id "+id+" wasn't found")
		return null

func getDomSexActions():
	return sexDomActions

func getSubSexActions():
	return sexSubActions



func registerSexActivity(path: String):
	var sexActivity = load(path)
	var sexActivityObject = sexActivity.new()
	
	sexActivities[sexActivityObject.id] = sexActivity
	sexActivitiesReferences[sexActivityObject.id] = sexActivityObject

func registerSexActivitiesFolder(folder: String):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
				#print("Found directory: " + file_name)
			else:
				if(file_name.get_extension() == "gd"):
					var full_path = folder.plus_file(file_name)
					#print("Registered sex activity: " + full_path)
					registerSexActivity(full_path)
			file_name = dir.get_next()
	else:
		Log.printerr("An error occurred when trying to access the path "+folder)
		
func createSexActivity(id: String):
	if(sexActivities.has(id)):
		return sexActivities[id].new()
	else:
		Log.printerr("ERROR: sex activity with the id "+id+" wasn't found")
		return null

func getSexActivityReference(id: String):
	if(sexActivitiesReferences.has(id)):
		return sexActivitiesReferences[id]
	else:
		Log.printerr("ERROR: sex activity with the id "+id+" wasn't found")
		return null
		
func getSexActivityReferences():
	return sexActivitiesReferences
