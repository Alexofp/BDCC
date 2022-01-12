extends Node

var ui: GameUI
var main
var pc: Player
var world: GameWorld

#saving/loading stuff
var currentSavefileVersion = 1

func _ready():
	pc = preload("res://Player/Player.tscn").instance()
	add_child(pc)

func saveData():
	var data = {
		"savefile_version": currentSavefileVersion,
	}
	
	data["player"] = GM.pc.saveData()
	
	return data

func loadData(data: Dictionary):
	print(data)
	if(!data.has("savefile_version")):
		printerr("Error: Save file doesn't have a version in it. It might not be a savefile")
		return
	if(data["savefile_version"] != currentSavefileVersion):
		printerr("Error: This savefile is not supported, sorry. Current supported version: "+str(currentSavefileVersion)+". Savefile version: "+data["savefile_version"])
		return	
	
	GM.pc.loadData(data["player"])
	
	GM.main.loadingSavefileFinished()
	GM.ui.loadingSavefileFinished()
	
func saveGame(_path):
	var save_game = File.new()
	save_game.open(_path, File.WRITE)
	var saveData = saveData()
	
	save_game.store_line(JSON.print(saveData, "\t", true))
	save_game.close()
	
	
func loadGame(_path):
	var save_game = File.new()
	if not save_game.file_exists(_path):
		assert(false, "Save file is not found in "+str(_path))
		return # Error! We don't have a save to load.
	
	save_game.open(_path, File.READ)
	var saveData = parse_json(save_game.get_as_text())
	loadData(saveData)
	save_game.close()
