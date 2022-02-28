extends Node

var game_version_major = 0
var game_version_minor = 0
var game_version_revision = 8

var currentUniqueID = 0

var scenes: Dictionary = {}
var bodyparts: Dictionary = {}
var characters: Dictionary = {}
var attacks: Dictionary = {}
var statusEffects: Dictionary = {}
var allSpecies: Dictionary = {}
var items: Dictionary = {}
var buffs: Dictionary = {}
var events: Dictionary = {}
var modules: Dictionary = {}
var quests: Dictionary = {}

func _ready():
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
	
	registerBuffFolder("res://Inventory/Buffs/")
	
	registerEventFolder("res://Events/Event/")
	
	registerSceneFolder("res://Scenes/")
	registerSceneFolder("res://Scenes/Intro/")
	registerSceneFolder("res://Scenes/Item/")
	registerSceneFolder("res://Scenes/Cellblock/")
	registerSceneFolder("res://Scenes/Mineshaft/")
	
	registerCharacterFolder("res://Characters/")
	
	registerAttackFolder("res://Attacks/")
	
	registerStatusEffectFolder("res://StatusEffect/")
	
	registerSpeciesFolder("res://Species/")
	
	registerQuestFolder("res://Quests/Quest/")
	
	registerModule("res://Modules/TaviModule/Tavi_module.gd")
	registerModule("res://Modules/RahiModule/Rahi_module.gd")
	registerModule("res://Modules/NovaModule/Nova_module.gd")
	registerModule("res://Modules/PunishmentsModule/Punishments_module.gd")
	
# The point is that it will still generate unique ids even after saving/loading
func generateUniqueID():
	currentUniqueID += 1
	return currentUniqueID - 1

func getGameVersionString():
	return str(game_version_major)+"."+str(game_version_minor)+"."+str(game_version_revision)

func registerScene(path: String):
	var scene = load(path)
	if(!scene):
		printerr("ERROR: couldn't load scene from path "+path)
		return
	var sceneObject = scene.new()
	scenes[sceneObject.sceneID] = sceneObject

func getScene(id: String):
	if(!scenes.has(id)):
		printerr("ERROR: scene with the id "+id+" wasn't found")
		return null
	var scene = scenes[id].duplicate()
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
		printerr("An error occurred when trying to access the path "+folder)

func registerBodypart(path: String):
	var bodypart = load(path)
	var bodypartObject = bodypart.new()
	bodyparts[bodypartObject.id] = bodypartObject

func getBodypart(id: String):
	if(!bodyparts.has(id)):
		printerr("ERROR: bodypart with the id "+id+" wasn't found")
		return null
	return bodyparts[id].duplicate()

func getBodypartRef(id: String):
	if(!bodyparts.has(id)):
		printerr("ERROR: bodypart with the id "+id+" wasn't found")
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
		printerr("An error occurred when trying to access the path "+folder)

func registerCharacter(path: String):
	var character = load(path)
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
		printerr("An error occurred when trying to access the path "+folder)

func getCharacter(id: String):
	if(id == "pc"):
		return GM.pc
	
	if(!characters.has(id)):
		printerr("ERROR: character with the id "+id+" wasn't found")
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
		printerr("An error occurred when trying to access the path "+folder)

func getAttack(id: String):
	if(!attacks.has(id)):
		printerr("ERROR: attack with the id "+id+" wasn't found")
		return null
	return attacks[id]


func registerStatusEffect(path: String):
	var effect = load(path)
	var effectObject = effect.new()
	statusEffects[effectObject.id] = effectObject

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
		printerr("An error occurred when trying to access the path "+folder)
		
func getStatusEffect(id: String):
	if(!statusEffects.has(id)):
		printerr("ERROR: status effect with the id "+id+" wasn't found")
		return null
	return statusEffects[id].duplicate()


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
		printerr("An error occurred when trying to access the path "+folder)
		
func getSpecies(id: String):
	if(!allSpecies.has(id)):
		printerr("ERROR: species with the id "+id+" wasn't found")
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
	itemObject.queue_free()

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
		printerr("An error occurred when trying to access the path "+folder)

func createItem(id: String):
	if(!items.has(id)):
		printerr("ERROR: item with the id "+id+" wasn't found")
		return null
	return items[id].new()



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
		printerr("An error occurred when trying to access the path "+folder)
		
func createBuff(id: String):
	if(!buffs.has(id)):
		printerr("ERROR: buff with the id "+id+" wasn't found")
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
		printerr("An error occurred when trying to access the path "+folder)
		
func getEvent(id: String):
	if(!events.has(id)):
		printerr("ERROR: event with the id "+id+" wasn't found")
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
		printerr("An error occurred when trying to access the path "+folder)
		
func getQuest(id: String):
	if(!quests.has(id)):
		printerr("ERROR: quest with the id "+id+" wasn't found")
		return null
	return quests[id]

func getQuests():
	return quests
