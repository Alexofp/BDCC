extends Node

var ui: GameUI
var main: MainThing
var pc: Player
var world: GameWorld
var ES: EventSystem
var QS: QuestSystem

func _ready():
	pc = load("res://Player/Player.gd").new()
	add_child(pc)

	ES = load("res://Events/EventSystem.gd").new()
	add_child(ES)

	QS = load("res://Quests/QuestSystem.gd").new()
	add_child(QS)
