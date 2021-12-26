extends "res://Game/World/Room.gd"

signal onEnter(room)
signal onReact(room, key)

func _onEnter():
	say(getDescription())
	
	emit_signal("onEnter", self)

func _onButton(key):
	emit_signal("onReact", self, key)
