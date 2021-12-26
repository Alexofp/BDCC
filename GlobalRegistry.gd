extends Node

var scenes: Dictionary = {}
var bodyparts: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	#registerBodypart("res://Player/Bodyparts/CatLeg.gd")
	#registerBodypart("res://Player/Bodyparts/HumanLeg.gd")
	registerBodypartFolder("res://Player/Bodyparts/Legs/")
	registerBodypartFolder("res://Player/Bodyparts/Breasts/")
	
	registerScene("TestScene", "res://Scenes/TestScene.tscn")
	registerScene("WorldScene", "res://Scenes/WorldScene.tscn")
	

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
