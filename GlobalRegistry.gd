extends Node

var scenes: Dictionary = {}
var bodyparts: Dictionary = {}
var characters: Dictionary = {}
var attacks: Dictionary = {}
var statusEffects: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	#registerBodypart("res://Player/Bodyparts/CatLeg.gd")
	#registerBodypart("res://Player/Bodyparts/HumanLeg.gd")
	registerBodypartFolder("res://Player/Bodyparts/Legs/")
	registerBodypartFolder("res://Player/Bodyparts/Breasts/")
	
	registerScene("TestScene", "res://Scenes/TestScene.tscn")
	registerScene("WorldScene", "res://Scenes/WorldScene.tscn")
	registerScene("FightScene", "res://Scenes/FightScene.tscn")
	
	registerCharacterFolder("res://Characters/")
	
	registerAttackFolder("res://Attacks/")
	
	registerStatusEffectFolder("res://StatusEffect/")
	

func registerScene(id: String, path: String):
	var scene = load(path)
	if(!scene):
		print("ERROR: couldn't load scene "+id+" from path "+path)
		return
	scenes[id] = scene

func getScene(id: String):
	if(!scenes.has(id)):
		print("ERROR: scene with the id "+id+" wasn't found")
		return null
	var scene = scenes[id].instance()
	scene.sceneID = id
	return scene

func registerBodypart(path: String):
	var bodypart = load(path)
	var bodypartObject = bodypart.new()
	bodyparts[bodypartObject.id] = bodypart

func getBodypart(id: String):
	if(!bodyparts.has(id)):
		print("ERROR: bodypart with the id "+id+" wasn't found")
		return null
	return bodyparts[id].new()

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
					print("Registered bodypart: " + full_path)
					registerBodypart(full_path)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path "+folder)

func registerCharacter(path: String):
	var character = load(path)
	var characterObject = character.new()
	characters[characterObject.id] = characterObject

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
					print("Registered character: " + full_path)
					registerCharacter(full_path)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path "+folder)

func getCharacter(id: String):
	if(!characters.has(id)):
		print("ERROR: character with the id "+id+" wasn't found")
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
					print("Registered attack: " + full_path)
					registerAttack(full_path)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path "+folder)

func getAttack(id: String):
	if(!attacks.has(id)):
		print("ERROR: attack with the id "+id+" wasn't found")
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
					print("Registered status effect: " + full_path)
					registerStatusEffect(full_path)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path "+folder)
		
func getStatusEffect(id: String):
	if(!statusEffects.has(id)):
		print("ERROR: status effect with the id "+id+" wasn't found")
		return null
	return statusEffects[id].duplicate()
