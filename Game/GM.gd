extends Node

var ui: GameUI
var main
var pc: Player
var world: GameWorld
var ES: EventSystem

func _ready():
	pc = load("res://Player/Player.gd").new()
	add_child(pc)

	ES = load("res://Events/EventSystem.gd").new()
	add_child(ES)
