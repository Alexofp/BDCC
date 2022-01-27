extends Node

var ui: GameUI
var main
var pc: Player
var world: GameWorld

func _ready():
	pc = load("res://Player/Player.gd").new()
	add_child(pc)

