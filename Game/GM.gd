extends Node

var ui: GameUI
var main: MainScene
var pc: Player
var world: GameWorld
var ES: EventSystem
var QS: QuestSystem
var CS: ChildSystem
var GES: GameExtenderSystem
var PROFILE: MyProfilerBase

func _init():
	GES = GameExtenderSystem.new()
	createProfiler()

func _ready():
	var directory = Directory.new()
		
	directory.make_dir("user://saves")
	directory.make_dir("user://mods")
	directory.make_dir("user://custom_skins")
	directory.make_dir("user://datapacks")

func createProfiler():
	if(OPTIONS.shouldProfile()):
		PROFILE = MyProfiler.new()
	else:
		PROFILE = MyProfilerBase.new()
