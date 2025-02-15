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
		
	directory.make_dir("user://saves")
	directory.make_dir("user://mods")
	directory.make_dir("user://custom_skins")
	directory.make_dir("user://datapacks")

