extends Node

var ui: GameUI
var main: MainScene
var pc: Player
var world: GameWorld
var ES: EventSystem
var QS: QuestSystem
var CS: ChildSystem
var GES: GameExtenderSystem

func _init():
	GES = GameExtenderSystem.new()

func _ready():
	var directory = Directory.new()

	var exe_dir = OS.get_executable_path().get_base_dir()
	print("Current Dir:", exe_dir)
	var portable_dir = exe_dir.plus_file("BDCC.data")

	if Directory.new().dir_exists(portable_dir):
		print("Using portable save directory:", portable_dir)

		if not Directory.new().dir_exists(portable_dir + "/Godot/app_userdata/BDCC"):
			Directory.new().make_dir_recursive(portable_dir + "/Godot/app_userdata/BDCC")
		
		if OS.has_environment("APPDATA"):
			OS.set_environment("APPDATA", portable_dir)  # Windows
		if OS.has_environment("HOME"):
			OS.set_environment("HOME", portable_dir)  # Linux & Mac
		
	directory.make_dir("user://saves")
	directory.make_dir("user://mods")
	directory.make_dir("user://custom_skins")
	directory.make_dir("user://datapacks")

