extends Node

var ui: GameUI
var main: MainThing
var pc: Player
var world: GameWorld
var ES: EventSystem
var QS: QuestSystem
var CS: ChildSystem

func _ready():
	var directory = Directory.new( )
	directory.make_dir("user://saves")
	directory.make_dir("user://mods")
	

