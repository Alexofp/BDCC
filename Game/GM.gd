extends Node

var ui: GameUI
var main
var pc: Player
var world: GameWorld

func _ready():
	pc = preload("res://Player/Player.tscn").instance()
	add_child(pc)
